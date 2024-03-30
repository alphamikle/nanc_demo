import 'package:nanc/fields.dart';
import 'package:nanc/model.dart';
import 'package:nanc_icons/nanc_icons.dart';

final Model supaUserToNonFavoriteColors = Model(
  name: 'User ⤍ Non Favorite Colors',
  id: 'user_to_non_favorite_colors',
  icon: IconPackNames.mdi_relation_one_to_many,
  fields: [
    [
      IdField(),
      IdField(name: 'User ID', id: 'user_id'),
      IdField(name: 'Color ID', id: 'color_id'),
    ],
  ],
);
