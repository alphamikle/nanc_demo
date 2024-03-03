import 'package:fields/fields.dart';
import 'package:icons/icons.dart';
import 'package:model/model.dart';

import 'age_rating_model.dart';

final Model movieModel = Model(
  name: 'Movie',
  id: 'movie',
  icon: IconPackNames.flu_movies_and_tv_filled,
  fields: [
    [
      IdField(),
      StringField(name: 'Title', id: 'title', isRequired: true, showInList: true, maxLines: 1),
      SelectorField(
        name: 'Age Rating',
        id: 'age_rating_id',
        isRequired: true,
        model: ageRatingModel,
        titleFields: const [
          ExternalField.id('title'),
        ],
      ),
    ],
    [
      NumberField(name: 'Year', id: 'year', isRequired: true, showInList: true),
      StringField(name: 'Release Date', id: 'release_date', isRequired: true, maxLines: 1),
      StringField(name: 'DVD Release Date', id: 'dvd_release_date', maxLines: 1),
    ],
    [
      NumberField(name: 'Duration (min)', id: 'duration', isRequired: true, showInList: true),
      NumberField(name: 'Box Office', id: 'box_office', showInList: true),
    ],
    [
      StringField(name: 'Description', id: 'description', isRequired: true),
    ],
    [
      StringField(name: 'Poster Url', id: 'poster_url', isRequired: true, maxLines: 1),
    ],
    [
      StringField(name: 'Website', id: 'website', maxLines: 1),
      StringField(name: 'Production', id: 'production', maxLines: 1),
      EnumField(
        name: 'Type',
        id: 'movie_type',
        values: const [
          EnumValue(title: 'Movie', value: 'movie'),
          EnumValue(title: 'Show', value: 'series'),
        ],
      ),
    ],
    [
      NumberField(name: 'IMDB Votes', id: 'imdb_votes'),
      StringField(name: 'IMDB ID', id: 'imdb_id', maxLines: 1),
    ],
  ],
);
