import 'dart:async';

import 'package:cms/cms.dart';
import 'package:config/config.dart';
import 'package:flutter/material.dart';
import 'package:nanc_api_firebase/nanc_api_firebase.dart';

Future<void> main() async {
  await runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();

    final FirebaseApi firebaseApi = await FirebaseApi.create('');
    final FirebaseCollectionApi firebaseCollectionApi = FirebaseCollectionApi(api: firebaseApi);
    final FirebasePageApi firebasePageApi = FirebasePageApi(api: firebaseApi, firebaseCollectionApi: firebaseCollectionApi);
    final FirebaseModelApi firebaseModelApi = FirebaseModelApi();

    await adminRunner(
      CmsConfig(
        collectionApi: firebaseCollectionApi,
        pageApi: firebasePageApi,
        modelApi: firebaseModelApi,
        networkConfig: NetworkConfig.simple(),
        imageBuilderDelegate: null,
        adminWrapperBuilder: null,
        predefinedModels: [
          /// ? Here will be a list of your predefined code-first models
        ],
        customRenderers: [],
        clickHandlers: [],
        customFonts: [],
      ),
    );
  }, ErrorsCatcher.catchZoneErrors);
}
