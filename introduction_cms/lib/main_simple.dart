import 'dart:async';

import 'package:cms/cms.dart';
import 'package:config/config.dart';
import 'package:flutter/material.dart';
import 'package:nanc_api_firebase/nanc_api_firebase.dart';

import 'firebase_key.dart';

Future<void> main() async {
  await runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();

    /// ? Creating instances of needed APIs
    final FirebaseApi firebaseApi = await FirebaseApi.create(firebaseBase64EncodedKey);

    /// ? Backend-first ICollectionApi implementation
    final FirebaseCollectionApi firebaseCollectionApi = FirebaseCollectionApi(api: firebaseApi);

    /// ? Partially-local ICollectionApi implementation
    final FirebaseLocalCollectionApi firebaseLocalCollectionApi = FirebaseLocalCollectionApi(api: firebaseApi, cacheTTL: const Duration(minutes: 10));

    final FirebaseDocumentApi firebasePageApi = FirebaseDocumentApi(api: firebaseApi, firebaseCollectionApi: firebaseCollectionApi);
    final FirebaseModelApi firebaseModelApi = FirebaseModelApi();

    await adminRunner(
      CmsConfig(
        /// ? Use them here
        collectionApi: firebaseCollectionApi,
        documentApi: firebasePageApi,
        modelApi: firebaseModelApi,
        networkConfig: NetworkConfig.simple(paginationLimitParameterDefaultValue: 50),
        imageBuilderDelegate: null,
        adminWrapperBuilder: null,
        predefinedModels: [],
        customRenderers: [],
        clickHandlers: [],
        customFonts: [],
      ),
    );
  }, ErrorsCatcher.catchZoneErrors);
}
