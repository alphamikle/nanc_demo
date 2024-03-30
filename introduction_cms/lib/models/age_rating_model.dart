import 'package:nanc/fields.dart';
import 'package:nanc/model.dart';
import 'package:nanc_icons/nanc_icons.dart';

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
