import 'dart:async';

import 'package:cms/cms.dart';
import 'package:config/config.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  await runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();
    await adminRunner(
      CmsConfig(
        /// ? Your should implement these APIs or use already implemented instead
        collectionApi: ICollectionApi(),
        pageApi: IPageApi(),
        modelApi: IModelApi(),
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
          /// ? Here will be a list of your predefined code-first models
        ],
        customRenderers: [],
        clickHandlers: [],
        customFonts: [],
      ),
    );
  }, ErrorsCatcher.catchZoneErrors);
}
