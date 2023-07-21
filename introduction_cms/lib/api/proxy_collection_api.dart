import 'package:config/config.dart';
import 'package:flutter/foundation.dart';
import 'package:model/model.dart';
import 'package:nanc_api_firebase/nanc_api_firebase.dart';
import 'package:tools/tools.dart';

class ProxyCollectionApi implements FirebaseCollectionApi {
  ProxyCollectionApi({
    required this.collectionApi,
    required this.pageApi,
    required this.modelApi,
    required this.secondCollectionApi,
    required this.secondPageApi,
    required this.secondModelApi,
    required this.models,
  });

  final ICollectionApi collectionApi;
  final IPageApi pageApi;
  final IModelApi modelApi;

  final ICollectionApi secondCollectionApi;
  final IPageApi secondPageApi;
  final IModelApi secondModelApi;

  final List<Model> models;

  bool syncingInProcess = false;

  @override
  Future<CollectionResponseDto> fetchPageList(Model model, List<String> subset, QueryField query, ParamsDto params) async {
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
            await pageApi.upsertPage(model, document[model.idField.id] as String, document);
            if (kDebugMode) {
              print('Document ${document[model.idField.id]} of model ${model.name} was saved');
            }
          } catch (error, stackTrace) {
            if (kDebugMode) {
              print('Error happened on saving document ${document[model.idField.id]} of model ${model.name}\n$error\n$stackTrace');
            }
            await pageApi.upsertPage(model, document[model.idField.id] as String, document);
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
