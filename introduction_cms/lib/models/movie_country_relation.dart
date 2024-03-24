import 'package:nanc_fields/nanc_fields.dart';
import 'package:icons/icons.dart';
import 'package:model/model.dart';

import 'country_model.dart';
import 'movie_model.dart';

final Model movieCountryRelationModel = Model(
  name: 'Movie - Country',
  id: 'movie_country_relation',
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
        name: 'Country ID',
        id: 'country_id',
        model: countryModel,
        isRequired: true,
        showInList: true,
        titleFields: const [
          ExternalField.id('name'),
        ],
      ),
    ]
  ],
);
