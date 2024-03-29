import 'package:nanc_icons/nanc_icons.dart';
import 'package:nanc/fields.dart';
import 'package:nanc/model.dart';

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
