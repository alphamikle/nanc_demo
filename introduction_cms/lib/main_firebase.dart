import 'dart:async';

import 'package:additions/additions.dart';
import 'package:nanc_configuration/nanc_configuration.dart';
import 'package:flutter/material.dart';
import 'package:nanc_fonts/nanc_fonts.dart';
import 'package:nanc/model.dart';
import 'package:nanc/nanc.dart';
import 'package:nanc/services.dart';
import 'package:nanc_api_firebase/nanc_api_firebase.dart';
import 'package:svg_renderer/svg_renderer.dart';

import 'firebase_key.dart';
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

Future<void> main() async {
  await runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();

    /// ? Creating instances of needed APIs
    final FirebaseApi firebaseApi = await FirebaseApi.create(firebaseBase64EncodedKey);

    /// ? Backend-first ICollectionApi implementation
    final FirebaseCollectionApi firebaseCollectionApi = FirebaseCollectionApi(api: firebaseApi, cacheTTL: const Duration(minutes: 5));

    /// ? Partially-local ICollectionApi implementation
    final FirebaseLocalCollectionApi firebaseLocalCollectionApi = FirebaseLocalCollectionApi(api: firebaseApi);

    final FirebaseDocumentApi firebasePageApi = FirebaseDocumentApi(api: firebaseApi, firebaseCollectionApi: firebaseCollectionApi);
    final FirebaseModelApi firebaseModelApi = FirebaseModelApi();

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
        collectionApi: firebaseCollectionApi,
        documentApi: firebasePageApi,
        modelApi: firebaseModelApi,
        networkConfig: NetworkConfig.simple(),
        imageBuilderDelegate: null,
        adminWrapperBuilder: null,
        predefinedModels: models,
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
        customIcons: null,
        themeBuilder: (BuildContext context) => ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
          useMaterial3: true,
        ),
      ),
    );
  }, ErrorsCatcher.catchZoneErrors);
}
