import 'package:icons/icons.dart';
import 'package:nanc_fields/nanc_fields.dart';
import 'package:nanc_model/nanc_model.dart';

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
