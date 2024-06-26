import 'package:nanc/fields.dart';
import 'package:nanc/model.dart';
import 'package:nanc_icons/nanc_icons.dart';

import 'supa_color.dart';
import 'supa_user_to_favorite_colors.dart';
import 'supa_user_to_unfavorite_colors.dart';

final Model supaUser = Model(
  name: 'Users',
  id: 'users',
  icon: IconPackNames.rmx_user_3_line,
  fields: [
    [
      IdField(),
    ],
    [
      StringField(name: 'Name', id: 'name', showInList: true, isRequired: true),
      StringField(name: 'Lastname', id: 'lastname', showInList: true, isRequired: true),
      NumberField(name: 'Age', id: 'age', showInList: true, isRequired: true),
    ],
    [
      MultiSelectorField(
        name: 'Favorite Colors',
        model: supaColor,
        titleFields: const [
          ExternalField.id('color_name'),
          FieldsDivider.divider(': '),
          ExternalField.id('color_value'),
        ],
        thirdTable: ThirdTable(
          relationsEntity: supaUserToFavoriteColors,
          parentEntityIdName: 'user_id',
          childEntityIdName: 'color_id',
        ),
      ),
    ],
    [
      MultiSelectorField(
        name: 'Non Favorite Colors',
        model: supaColor,
        titleFields: const [
          ExternalField.id('color_name'),
          FieldsDivider.divider(': '),
          ExternalField.id('color_value'),
        ],
        thirdTable: ThirdTable(
          relationsEntity: supaUserToNonFavoriteColors,
          parentEntityIdName: 'user_id',
          childEntityIdName: 'color_id',
        ),
      ),
    ],
    [
      SelectorField(
        name: 'Most Favorite Color',
        id: 'most_favorite_color_id',
        model: supaColor,
        titleFields: const [
          ExternalField.id('color_name'),
          FieldsDivider.divider(': '),
          ExternalField.id('color_value'),
        ],
      ),
    ],
    [
      DateTimeField(name: 'Created At', id: 'created_at', showInList: true, isCreatedAtField: true),
      DateTimeField(name: 'Updated At', id: 'updated_at', showInList: true, isCreatedAtField: true),
    ],
  ],
);
