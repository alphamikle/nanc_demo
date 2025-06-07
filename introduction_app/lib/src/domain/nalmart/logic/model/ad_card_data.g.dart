// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ad_card_data.dart';

// **************************************************************************
// AutoequalGenerator
// **************************************************************************

extension _$AdCardDataAutoequal on AdCardData {
  List<Object?> get _$props => [
        image,
        title,
        description,
      ];
}

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$AdCardDataCWProxy {
  AdCardData image(String? image);

  AdCardData title(String? title);

  AdCardData description(String? description);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `AdCardData(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// AdCardData(...).copyWith(id: 12, name: "My name")
  /// ````
  AdCardData call({
    String? image,
    String? title,
    String? description,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfAdCardData.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfAdCardData.copyWith.fieldName(...)`
class _$AdCardDataCWProxyImpl implements _$AdCardDataCWProxy {
  const _$AdCardDataCWProxyImpl(this._value);

  final AdCardData _value;

  @override
  AdCardData image(String? image) => this(image: image);

  @override
  AdCardData title(String? title) => this(title: title);

  @override
  AdCardData description(String? description) => this(description: description);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `AdCardData(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// AdCardData(...).copyWith(id: 12, name: "My name")
  /// ````
  AdCardData call({
    Object? image = const $CopyWithPlaceholder(),
    Object? title = const $CopyWithPlaceholder(),
    Object? description = const $CopyWithPlaceholder(),
  }) {
    return AdCardData(
      image: image == const $CopyWithPlaceholder()
          ? _value.image
          // ignore: cast_nullable_to_non_nullable
          : image as String?,
      title: title == const $CopyWithPlaceholder()
          ? _value.title
          // ignore: cast_nullable_to_non_nullable
          : title as String?,
      description: description == const $CopyWithPlaceholder()
          ? _value.description
          // ignore: cast_nullable_to_non_nullable
          : description as String?,
    );
  }
}

extension $AdCardDataCopyWith on AdCardData {
  /// Returns a callable class that can be used as follows: `instanceOfAdCardData.copyWith(...)` or like so:`instanceOfAdCardData.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$AdCardDataCWProxy get copyWith => _$AdCardDataCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AdCardData _$AdCardDataFromJson(Map<String, dynamic> json) => AdCardData(
      image: json['image'] as String?,
      title: json['title'] as String?,
      description: json['description'] as String?,
    );

Map<String, dynamic> _$AdCardDataToJson(AdCardData instance) =>
    <String, dynamic>{
      'image': instance.image,
      'title': instance.title,
      'description': instance.description,
    };
