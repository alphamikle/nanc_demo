import 'package:nanc_configuration/nanc_configuration.dart';
import 'package:flutter/foundation.dart';
import 'package:nanc/model.dart';
import 'package:nanc_api_firebase/nanc_api_firebase.dart';
import 'package:tools/tools.dart';

class ProxyCollectionApi implements FirebaseCollectionApi {
  ProxyCollectionApi({
    required this.collectionApi,
    required this.documentApi,
    required this.modelApi,
    required this.secondCollectionApi,
    required this.secondDocumentApi,
    required this.secondModelApi,
    required this.models,
  });

  final ICollectionApi collectionApi;
  final IDocumentApi documentApi;
  final IModelApi modelApi;

  @override
  Duration get cacheTTL => Duration.zero;

  final ICollectionApi secondCollectionApi;
  final IDocumentApi secondDocumentApi;
  final IModelApi secondModelApi;

  final List<Model> models;

  bool syncingInProcess = false;

  @override
  Future<CollectionResponseDto> fetchPageList(Model model, List<FieldId> subset, QueryField query, ParamsDto params) async {
    CollectionResponseDto response = await collectionApi.fetchPageList(model, subset, query, params);
    if (response.data.isEmpty) {
      response = await secondCollectionApi.fetchPageList(model, subset, query, params);
    }
    if (model.id == 'sync_collections') {
      await syncCollections();
    }
    return response;
  }

  Future<void> syncCollections() async {
    if (syncingInProcess) {
      return;
    }
    syncingInProcess = true;
    try {
      for (final Model model in models) {
        if (kDebugMode) {
          print('Start syncing model ${model.name}');
        }
        final CollectionResponseDto response = await secondCollectionApi.fetchPageList(
          model,
          model.flattenFields.ids,
          const QueryOrField(),
          ParamsDto(page: 1, limit: 9999, sort: Sort(fieldId: model.idField.id, order: Order.asc)),
        );
        for (final Json document in response.data) {
          try {
            await documentApi.upsertPage(model, document[model.idField.id] as String, document);
            if (kDebugMode) {
              print('Document ${document[model.idField.id]} of model ${model.name} was saved');
            }
          } catch (error, stackTrace) {
            if (kDebugMode) {
              print('Error happened on saving document ${document[model.idField.id]} of model ${model.name}\n$error\n$stackTrace');
            }
            await documentApi.upsertPage(model, document[model.idField.id] as String, document);
            if (kDebugMode) {
              print('Document ${document[model.idField.id]} of model ${model.name} was saved on the second try');
            }
          }
        }
      }
      syncingInProcess = false;
    } catch (error, stackTrace) {
      if (kDebugMode) {
        print('Error happened during syncing process:\n$error\n$stackTrace');
      }
      syncingInProcess = false;
    }
  }

  @override
  Set<QueryFieldType> get supportedFilters => collectionApi.supportedFilters;
}
