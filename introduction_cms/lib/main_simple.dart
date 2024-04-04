import 'dart:async';

import 'package:flutter/material.dart';
import 'package:nanc/nanc.dart';
import 'package:nanc/services.dart';
import 'package:nanc_api_local/nanc_api_local.dart';
import 'package:nanc_configuration/nanc_configuration.dart';

Future<void> main() async {
  await runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();

    await adminRunner(
      CmsConfig(
        collectionApi: LocalCollectionApi(),
        documentApi: LocalDocumentApi(),
        modelApi: LocalModelApi(),
        networkConfig: NetworkConfig.simple(paginationLimitParameterDefaultValue: 50),
        imageBuilderDelegate: null,
        adminWrapperBuilder: null,
        predefinedModels: [],
        customRenderers: [],
        eventsHandlers: [],
        customFonts: [],
        sliverChecker: null,
        customIcons: null,
        themeBuilder: null,
      ),
    );
  }, ErrorsCatcher.catchZoneErrors);
}
