import 'package:nanc_fields/nanc_fields.dart';
import 'package:icons/icons.dart';
import 'package:model/model.dart';

import 'movie_model.dart';
import 'person_model.dart';

final Model movieActorRelationModel = Model(
  name: 'Movie - Actor',
  id: 'movie_actor_relations',
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
