import 'package:nanc_fields/nanc_fields.dart';
import 'package:icons/icons.dart';
import 'package:model/model.dart';

final Model countryModel = Model(
  name: 'Country',
  id: 'country',
  icon: IconPackNames.rmx_flag_fill,
  fields: [
    [
      IdField(),
      StringField(name: 'Name', id: 'name', isRequired: true, showInList: true, maxLines: 1),
    ],
  ],
);
