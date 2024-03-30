import 'dart:async';

import 'package:additions/additions.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:nanc/model.dart';
import 'package:nanc/nanc.dart';
import 'package:nanc/services.dart';
import 'package:nanc_api_supabase/nanc_api_supabase.dart';
import 'package:nanc_configuration/nanc_configuration.dart';
import 'package:nanc_fonts/nanc_fonts.dart';
import 'package:nanc_svg_renderer/nanc_svg_renderer.dart';

import 'logic/add_to_cart_event_handler.dart';
import 'models/age_rating_model.dart';
import 'models/country_model.dart';
import 'models/genre_model.dart';
import 'models/language_model.dart';
import 'models/movie_actor_relation_model.dart';
import 'models/movie_country_relation.dart';
import 'models/movie_director_relation_model.dart';
import 'models/movie_genre_relation.dart';
import 'models/movie_language_relation.dart';
import 'models/movie_model.dart';
import 'models/movie_quality_rating_relation.dart';
import 'models/movie_writer_relation_model.dart';
import 'models/person_model.dart';
import 'models/quality_rating_model.dart';
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
        executorFunctionName: 'executor_01h62mrtn2w1b6pyr578awhn6d',
        executorSqlArgumentName: 'query_01h62ms2trn6qkprq0gzmw1tc4',
        executorReturnableArgumentName: 'returnable_01h62mvaxvgh46db8ddchyvgsz',
        changeDifferentTypes: true,
        deleteUnnecessaryColumns: true,
      ),
    );

    final List<Model> models = [
      ageRatingModel,
      countryModel,
      genreModel,
      languageModel,
      movieActorRelationModel,
      movieCountryRelationModel,
      movieDirectorRelationModel,
      movieGenreRelationModel,
      movieLanguageRelationModel,
      movieModel,
      movieRateRelationModel,
      movieWriterRelationModel,
      personModel,
      qualityRatingModel,
    ];

    final CustomIcons customIcons = ioniconsMapping.map(
      (String key, String value) => MapEntry(
        'ionic_${key.replaceAll('-', '_')}',
        IoniconsData(
          int.parse(value),
        ),
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
        customRenderers: [
          svgRenderer(),
          colorFilterProperty(),
          headerProperty(),
        ],
        eventsHandlers: [
          snackbarDemoHandler,
          browserLinksEventDemoHandler,
          deeplinkEventDemoHandler,
          shareDemoHandler,
          anyEventHandler,
          addToCartEventHandler,
        ],
        customFonts: [
          const CustomFont(font: 'Blazeface'),
          const CustomFont(font: 'Helvetica'),
          const CustomFont(font: 'Helvetica Neue'),
        ],
        sliverChecker: null,
        customIcons: customIcons,
        themeBuilder: (BuildContext context) => ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
          useMaterial3: true,
        ),
      ),
    );
  }, ErrorsCatcher.catchZoneErrors);
}
