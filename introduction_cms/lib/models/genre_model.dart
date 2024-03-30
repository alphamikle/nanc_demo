import 'package:nanc/fields.dart';
import 'package:nanc/model.dart';
import 'package:nanc_icons/nanc_icons.dart';

final Model genreModel = Model(
  name: 'Genre',
  id: 'genre',
  icon: IconPackNames.mdi_theater,
  fields: [
    [
      IdField(),
      StringField(name: 'Name', id: 'name', isRequired: true, showInList: true, maxLines: 1),
    ]
  ],
);
