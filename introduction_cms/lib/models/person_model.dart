import 'package:fields/fields.dart';
import 'package:icons/icons.dart';
import 'package:model/model.dart';

final Model personModel = Model(
  name: 'Person',
  id: 'person',
  icon: IconPackNames.flu_person_filled,
  fields: [
    [
      IdField(),
    ],
    [
      StringField(name: 'Name', id: 'name', isRequired: true, showInList: true),
      StringField(name: 'Lastname', id: 'lastname', isRequired: true, showInList: true),
      StringField(name: 'Middle Name', id: 'middle_name', showInList: true),
    ],
  ],
);