import 'package:nanc/fields.dart';
import 'package:nanc/model.dart';
import 'package:nanc_icons/nanc_icons.dart';

import 'movie_model.dart';
import 'person_model.dart';

final Model movieWriterRelationModel = Model(
  name: 'Movie - Writer',
  id: 'movie_writer_relation',
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
        name: 'Person ID',
        id: 'person_id',
        model: personModel,
        isRequired: true,
        showInList: true,
        titleFields: const [
          ExternalField.id('name'),
          ExternalField.id('middle_name'),
          ExternalField.id('lastname'),
        ],
      ),
    ]
  ],
);
