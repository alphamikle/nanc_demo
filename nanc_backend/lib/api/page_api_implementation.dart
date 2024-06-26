import 'dart:async';

import 'package:nanc/fields.dart';
import 'package:nanc/model.dart';
import 'package:nanc_configuration/nanc_configuration.dart';
import 'package:nanc_tools/nanc_tools.dart';

import '../connection_manager/logic/connection_manager_bloc.dart';
import '../models/landing_page.dart';
import 'db_extension.dart';
import 'tools.dart';

class PageApiImplementation extends MockApi implements IDocumentApi {
  PageApiImplementation({
    required this.dbService,
    required this.connectionManagerBloc,
  }) {
    connectionManagerBloc.setOnConnectedCallback(_onConnectedToClient);
  }

  @override
  final DbService dbService;
  final ConnectionManagerBloc connectionManagerBloc;

  @override
  Future<Json> fetchPageData(Model entity, String id, List<String> subset) async {
    try {
      await networkDelay();
      final List<Json> data = await fetchFullList(entity);
      final Json targetEntity = data.firstWhere((Json dataRow) => dataRow[entity.idField.id] == id);
      final Json response = <String, dynamic>{};
      for (final String field in subset) {
        response[field] = targetEntity[field];
      }
      return response;
    } catch (error) {
      throw Exception('Not found page with id "$id" of model "$entity"');
    }
  }

  @override
  Future<Json> upsertPage(Model model, String? id, Json pageData) async {
    await networkDelay();
    final Json effectivePage = <String, dynamic>{
      ...pageData,
    };
    bool isReallyNewPage = false;
    String effectiveId = id ?? '';
    final List<Json> data = await fetchFullList(model);
    List<Json> effectiveData = [];
    if (effectivePage[model.idField.id] == null || effectivePage[model.idField.id].toString().trim() == '') {
      effectiveId = effectiveId.isEmpty ? Ulid().toUuid() : effectiveId;
      effectivePage[model.idField.id] = effectiveId;
      isReallyNewPage = true;
    }
    if (effectiveId.isEmpty) {
      effectiveId = effectivePage[model.idField.id] as String;
    }

    /// ? Remove all copies of this page (this is garbage local logic)
    if (isReallyNewPage == false) {
      effectiveData = await _clearFromDuplicates(model, effectiveId, data);
    } else {
      effectiveData = data;
    }
    effectiveData.add(effectivePage);
    effectiveData.sort((Json first, Json second) => (first[model.idField.id] as String).compareTo(second[model.idField.id] as String));
    await saveFullList(model, effectiveData);
    if (model.id != 'model' && model.id != 'structure') {
      unawaited(connectionManagerBloc.sendPageDataToTheClients(model: model, page: effectivePage));
    }
    return effectivePage;
  }

  @override
  Future<void> deletePage(Model model, String pageId) async {
    await networkDelay();
    final List<Json> data = await fetchFullList(model);
    final List<Json> clearedData = data.where((Json page) => page[model.idField.id] != pageId).toList();
    await saveFullList(model, clearedData);
  }

  @override
  Future<void> saveThirdTable(ThirdTable thirdTable, String parentEntityId, List<String> childEntityIds) async {
    final Model relationsModel = thirdTable.relationsEntity;
    await networkDelay();
    final List<Json> thirdTableData = await fetchFullList(relationsModel);
    thirdTableData.removeWhere((Json row) {
      return row[thirdTable.parentEntityIdName] == parentEntityId;
    });
    for (final FieldId childId in childEntityIds) {
      thirdTableData.add(<String, dynamic>{
        thirdTable.parentEntityIdName: parentEntityId,
        thirdTable.childEntityIdName: childId,
      });
    }
    await saveFullList(relationsModel, thirdTableData);
  }

  Future<List<Json>> _clearFromDuplicates(Model entity, String id, List<Json> data) async {
    final List<Json> clearData = [];
    final Set<int> indexesForDeletion = {};
    for (int i = 0; i < data.length; i++) {
      final Json page = data[i];
      if (page[entity.idField.id] == id) {
        indexesForDeletion.add(i);
      }
      await wait();
    }
    for (int i = 0; i < data.length; i++) {
      final Json page = data[i];
      if (!indexesForDeletion.contains(i)) {
        clearData.add(page);
      }
      await wait();
    }
    return clearData;
  }

  Future<void> _onConnectedToClient() async {
    final Json landingPageData = await fetchPageData(landingPage, landingPage.id, landingPage.flattenFields.ids);
    await wait(duration: const Duration(seconds: 2));
    await connectionManagerBloc.sendPageDataToTheClients(model: landingPage, page: landingPageData);
  }
}
