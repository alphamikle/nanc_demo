import 'package:icons/icons.dart';
import 'package:nanc_fields/nanc_fields.dart';
import 'package:nanc_model/nanc_model.dart';

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
