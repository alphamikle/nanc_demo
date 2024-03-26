import 'package:nanc_fields/nanc_fields.dart';
import 'package:icons/icons.dart';
import 'package:nanc_model/nanc_model.dart';

final Model ageRatingModel = Model(
  name: 'Age Rating',
  id: 'age_rating',
  icon: IconPackNames.mdi_baby_carriage,
  fields: [
    [
      IdField(),
      StringField(name: 'Title', id: 'title', isRequired: true, showInList: true, maxLines: 1),
    ],
  ],
);
