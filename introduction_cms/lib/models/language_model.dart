import 'package:nanc/fields.dart';
import 'package:nanc/model.dart';
import 'package:nanc_icons/nanc_icons.dart';

final Model languageModel = Model(
  name: 'Language',
  id: 'language',
  icon: IconPackNames.flu_local_language_filled,
  fields: [
    [
      IdField(),
      StringField(name: 'Name', id: 'name', isRequired: true, showInList: true, maxLines: 1),
    ]
  ],
);
