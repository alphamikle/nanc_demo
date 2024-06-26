import 'package:nanc/fields.dart';
import 'package:nanc/model.dart';
import 'package:nanc_icons/nanc_icons.dart';

final Model supaColor = Model(
  name: 'Colors',
  id: 'colors',
  icon: IconPackNames.flu_color_regular,
  fields: [
    [
      IdField(),
    ],
    [
      StringField(name: 'Color Name', id: 'color_name', showInList: true, isRequired: true),
      ColorField(name: 'Color Value', id: 'color_value', showInList: true, isRequired: true),
    ],
    [
      DateTimeField(name: 'Created At', id: 'created_at', showInList: true, isCreatedAtField: true),
      DateTimeField(name: 'Updated At', id: 'updated_at', showInList: true, isCreatedAtField: true),
    ],
  ],
);
