import 'package:cms/cms.dart';
import 'package:config/config.dart';
import 'package:nanc_api_firebase/nanc_api_firebase.dart';
import 'package:nanc_api_supabase/nanc_api_supabase.dart';

import '../models/supabase/feature_toggles.dart';
import '../models/supabase/supa_color.dart';
import '../models/supabase/supa_user.dart';
import '../models/supabase/supa_user_to_favorite_colors.dart';
import '../models/supabase/supa_user_to_unfavorite_colors.dart';

enum DataProvider {
  supabase,
  firebase,
  firebaseLocal;

  bool get isSupabase => this == DataProvider.supabase;
  bool get isFirebase => this == DataProvider.firebase || this == DataProvider.firebaseLocal;
  bool get isFirebaseLocal => this == DataProvider.firebaseLocal;
}

Future<void> startCmsApp(DataProvider provider) async {
  late final ICollectionApi collectionApi;
  late final IDocumentApi pageApi;
  late final IModelApi modelApi;

  if (provider.isSupabase) {
    final SupabaseApi supabaseApi = await SupabaseApi.create(
      supabaseKey: const String.fromEnvironment('SUPA_KEY'),
      supabaseUrl: const String.fromEnvironment('SUPA_URL'),
    );
    collectionApi = SupabaseCollectionApi(api: supabaseApi);
    pageApi = SupabaseDocumentApi(api: supabaseApi);
    modelApi = SupabaseModelApi(
      api: supabaseApi,
      config: const SupabaseModelApiConfig(
        doNothingMode: false,
        executorFunctionName: 'executor',
        executorSqlArgumentName: 'query',
        executorReturnableArgumentName: 'returnable',
        changeDifferentTypes: true,
        deleteUnnecessaryColumns: true,
      ),
    );
  } else if (provider.isFirebase) {
    final FirebaseApi firebaseApi = await FirebaseApi.create(const String.fromEnvironment('FIREBASE_JSON_BASE64_KEY'));
    final IFirebaseCollectionApi firebaseCollectionApi =
        provider.isFirebaseLocal ? FirebaseLocalCollectionApi(api: firebaseApi) : FirebaseCollectionApi(api: firebaseApi);
    collectionApi = firebaseCollectionApi;
    pageApi = FirebaseDocumentApi(api: firebaseApi, firebaseCollectionApi: firebaseCollectionApi);
    modelApi = FirebaseModelApi();
  }

  await adminRunner(
    CmsConfig(
      collectionApi: collectionApi,
      documentApi: pageApi,
      modelApi: modelApi,
      networkConfig: NetworkConfig(
        paginationPageNumberParameterName: 'page',
        paginationLimitParameterName: 'limit',
        paginationDataContainerParameterName: 'data',
        paginationTotalPagesParameterName: 'total_pages',
        paginationLimitParameterDefaultValue: 100,
      ),
      imageBuilderDelegate: null,
      adminWrapperBuilder: null,
      predefinedModels: [
        supaUser,
        supaColor,
        supaUserToFavoriteColors,
        supaUserToNonFavoriteColors,
        featureToggles,
      ],
      customRenderers: [],
      eventsHandlers: [],
      customFonts: [],
      sliverChecker: null,
      customIcons: null,
      themeBuilder: null,
    ),
  );
}
