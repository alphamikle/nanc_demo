import 'package:icons/icons.dart';
import 'package:nanc_fields/nanc_fields.dart';
import 'package:nanc_model/nanc_model.dart';

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
