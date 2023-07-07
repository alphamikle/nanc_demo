import 'package:fields/fields.dart';
import 'package:icons/icons.dart';
import 'package:model/model.dart';

final Model featureToggles = Model(
  name: 'Feature toggles',
  icon: IconPackNames.mdi_feature_search,
  fields: [
    [
      IdField(),
    ],
    [
      BoolField(name: 'Feature ABC'),
      BoolField(name: 'Feature BCD'),
      BoolField(name: 'Feature CDE'),
    ],
  ],
);
