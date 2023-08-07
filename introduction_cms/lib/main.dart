import 'dart:async';

import 'package:additions/additions.dart';
import 'package:cms/cms.dart';
import 'package:config/config.dart';
import 'package:flutter/material.dart';
import 'package:model/model.dart';
import 'package:nanc_api_supabase/nanc_api_supabase.dart';
import 'package:svg_renderer/svg_renderer.dart';

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
        ],
        customFonts: [],
        sliverChecker: null,
      ),
    );
  }, ErrorsCatcher.catchZoneErrors);
}
