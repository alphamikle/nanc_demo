import 'package:nanc/fields.dart';
import 'package:nanc/model.dart';
import 'package:nanc_icons/nanc_icons.dart';

import 'movie_model.dart';
import 'quality_rating_model.dart';

final Model movieRateRelationModel = Model(
  name: 'Movie - Rate',
  id: 'movie_rate_relation',
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
    ],
    [
      SelectorField(
        name: 'Rate ID',
        id: 'rate_id',
        isRequired: true,
        showInList: true,
        model: qualityRatingModel,
        titleFields: const [
          ExternalField.id('name'),
        ],
      ),
    ],
  ],
);
