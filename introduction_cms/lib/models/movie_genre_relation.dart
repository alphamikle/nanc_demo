import 'package:icons/icons.dart';
import 'package:nanc/fields.dart';
import 'package:nanc/model.dart';

import 'genre_model.dart';
import 'movie_model.dart';

final Model movieGenreRelationModel = Model(
  name: 'Movie - Genre',
  id: 'movie_genre_relation',
  icon: IconPackNames.mdi_relation_many_to_many,
  fields: [
    [
      IdField(),
      SelectorField(
        name: 'Movie ID',
        id: 'movie_id',
        model: movieModel,
        isRequired: true,
        showInList: true,
        titleFields: const [
          ExternalField.id('title'),
          ExternalField.id('year'),
        ],
      ),
      SelectorField(
        name: 'Genre ID',
        id: 'genre_id',
        model: genreModel,
        isRequired: true,
        showInList: true,
        titleFields: const [
          ExternalField.id('name'),
        ],
      ),
    ]
  ],
);
