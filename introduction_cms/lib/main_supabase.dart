import 'dart:async';

import 'package:cms/cms.dart';
import 'package:config/config.dart';
import 'package:flutter/material.dart';
import 'package:nanc_api_supabase/nanc_api_supabase.dart';

import 'supabase_key.dart';

Future<void> main() async {
  await runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();

    final SupabaseApi supabaseApi = await SupabaseApi.create(supabaseUrl: supabaseUrl, supabaseKey: supabaseServiceKey);
    final SupabaseCollectionApi supabaseCollectionApi = SupabaseCollectionApi(api: supabaseApi);
    final SupabaseDocumentApi supabaseDocumentApi = SupabaseDocumentApi(api: supabaseApi);
    final SupabaseModelApi supabaseModelApi = SupabaseModelApi(
      api: supabaseApi,
      config: const SupabaseModelApiConfig(
        doNothingMode: false,
        executorFunctionName: 'executor:9074dd65-094b-494a-9018-58dcb9cdf52a',
        executorSqlArgumentName: 'argument:c8fd0385-5a68-4072-bd33-2ef4d5a06f55',
        executorReturnableArgumentName: 'response:2846a674-a8fb-46fe-8d15-421d9f1131bf',
        changeDifferentTypes: true,
        deleteUnnecessaryColumns: true,
      ),
    );

    await adminRunner(
      CmsConfig(
        /// ? Use them here
        collectionApi: supabaseCollectionApi,
        documentApi: supabaseDocumentApi,
        modelApi: supabaseModelApi,
        networkConfig: NetworkConfig.simple(),
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
