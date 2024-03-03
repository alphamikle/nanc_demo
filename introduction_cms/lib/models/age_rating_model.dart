import 'package:fields/fields.dart';
import 'package:icons/icons.dart';
import 'package:model/model.dart';

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
