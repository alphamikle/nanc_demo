import 'dart:async';

import 'package:nanc/model.dart';
import 'package:nanc/nanc.dart';
import 'package:nanc_configuration/nanc_configuration.dart';
import 'package:flutter/material.dart';
import 'package:nanc/services.dart';
import 'package:nanc_api_firebase/nanc_api_firebase.dart';
import 'package:nanc_api_local/nanc_api_local.dart';
import 'package:tools/tools.dart';

import 'api/proxy_collection_api.dart';
import 'data/age_ratings.dart';
import 'data/countries.dart';
import 'data/genres.dart';
import 'data/languages.dart';
import 'data/movie_actor_relations.dart';
import 'data/movie_country_relations.dart';
import 'data/movie_director_relations.dart';
import 'data/movie_genre_relations.dart';
import 'data/movie_language_relations.dart';
import 'data/movie_quality_rating_relations.dart';
import 'data/movie_writer_relations.dart';
import 'data/movies.dart';
import 'data/persons.dart';
import 'data/quality_ratings.dart';
import 'firebase_key.dart';
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
    final FirebaseCollectionApi firebaseCollectionApi = FirebaseCollectionApi(api: firebaseApi);

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

    final Map<String, List<Json>> preloadedData = {
      ageRatingModel.id: ageRatings,
      countryModel.id: countries,
      genreModel.id: genres,
      languageModel.id: languages,
      movieActorRelationModel.id: moviesToActors,
      movieCountryRelationModel.id: moviesToCountries,
      movieDirectorRelationModel.id: moviesToDirectors,
      movieGenreRelationModel.id: moviesToGenres,
      movieLanguageRelationModel.id: moviesToLang,
      movieModel.id: movies,
      movieRateRelationModel.id: moviesToRates,
      movieWriterRelationModel.id: moviesToWriters,
      personModel.id: persons,
      qualityRatingModel.id: qualityRatings,
    };

    final LocalCollectionApi localCollectionApi = LocalCollectionApi(preloadedData: preloadedData);
    final LocalDocumentApi localPageApi = LocalDocumentApi(preloadedData: preloadedData);
    final LocalModelApi localModelApi = LocalModelApi();

    final ICollectionApi proxyCollectionApi = ProxyCollectionApi(
      collectionApi: firebaseCollectionApi,
      documentApi: firebasePageApi,
      modelApi: firebaseModelApi,
      secondCollectionApi: localCollectionApi,
      secondDocumentApi: localPageApi,
      secondModelApi: localModelApi,
      models: models,
    );

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
