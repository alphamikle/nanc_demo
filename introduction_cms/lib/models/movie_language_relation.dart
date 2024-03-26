import 'package:icons/icons.dart';
import 'package:nanc_fields/nanc_fields.dart';
import 'package:nanc_model/nanc_model.dart';

import 'language_model.dart';
import 'movie_model.dart';

final Model movieLanguageRelationModel = Model(
  name: 'Movie - Language',
  id: 'movie_language_relation',
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
        name: 'Language ID',
        id: 'language_id',
        model: languageModel,
        isRequired: true,
        showInList: true,
        titleFields: const [
          ExternalField.id('name'),
        ],
      ),
    ],
  ],
);
