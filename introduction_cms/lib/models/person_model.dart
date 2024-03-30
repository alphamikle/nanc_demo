import 'package:nanc/fields.dart';
import 'package:nanc/model.dart';
import 'package:nanc_icons/nanc_icons.dart';

final Model personModel = Model(
  name: 'Person',
  id: 'person',
  icon: IconPackNames.flu_person_filled,
  fields: [
    [
      IdField(),
    ],
    [
      StringField(name: 'Name', id: 'name', isRequired: true, showInList: true, maxLines: 1),
      StringField(name: 'Lastname', id: 'lastname', isRequired: true, showInList: true, maxLines: 1),
      StringField(name: 'Middle Name', id: 'middle_name', showInList: true, maxLines: 1),
    ],
  ],
);
