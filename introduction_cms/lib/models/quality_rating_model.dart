import 'package:icons/icons.dart';
import 'package:nanc/fields.dart';
import 'package:nanc/model.dart';

final Model qualityRatingModel = Model(
  name: 'Rate',
  id: 'rate',
  icon: IconPackNames.flu_star_edit_regular,
  fields: [
    [
      IdField(),
      StringField(name: 'Name', id: 'name', isRequired: true, showInList: true, maxLines: 1),
    ]
  ],
);
