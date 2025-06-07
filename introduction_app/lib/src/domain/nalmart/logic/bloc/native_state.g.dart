// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'native_state.dart';

// **************************************************************************
// AutoequalGenerator
// **************************************************************************

extension _$NativeStateAutoequal on NativeState {
  List<Object?> get _$props => [
        adCards,
        deliveryStatus,
      ];
}

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$NativeStateCWProxy {
  NativeState adCards(List<AdCardData> adCards);

  NativeState deliveryStatus(DeliveryStatus deliveryStatus);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `NativeState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// NativeState(...).copyWith(id: 12, name: "My name")
  /// ````
  NativeState call({
    List<AdCardData>? adCards,
    DeliveryStatus? deliveryStatus,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfNativeState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfNativeState.copyWith.fieldName(...)`
class _$NativeStateCWProxyImpl implements _$NativeStateCWProxy {
  const _$NativeStateCWProxyImpl(this._value);

  final NativeState _value;

  @override
  NativeState adCards(List<AdCardData> adCards) => this(adCards: adCards);

  @override
  NativeState deliveryStatus(DeliveryStatus deliveryStatus) =>
      this(deliveryStatus: deliveryStatus);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `NativeState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// NativeState(...).copyWith(id: 12, name: "My name")
  /// ````
  NativeState call({
    Object? adCards = const $CopyWithPlaceholder(),
    Object? deliveryStatus = const $CopyWithPlaceholder(),
  }) {
    return NativeState(
      adCards: adCards == const $CopyWithPlaceholder() || adCards == null
          ? _value.adCards
          // ignore: cast_nullable_to_non_nullable
          : adCards as List<AdCardData>,
      deliveryStatus: deliveryStatus == const $CopyWithPlaceholder() ||
              deliveryStatus == null
          ? _value.deliveryStatus
          // ignore: cast_nullable_to_non_nullable
          : deliveryStatus as DeliveryStatus,
    );
  }
}

extension $NativeStateCopyWith on NativeState {
  /// Returns a callable class that can be used as follows: `instanceOfNativeState.copyWith(...)` or like so:`instanceOfNativeState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$NativeStateCWProxy get copyWith => _$NativeStateCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NativeState _$NativeStateFromJson(Map<String, dynamic> json) => NativeState(
      adCards:
          (json['adCards'] as List<dynamic>).map(AdCardData.fromJson).toList(),
      deliveryStatus:
          $enumDecode(_$DeliveryStatusEnumMap, json['deliveryStatus']),
    );

Map<String, dynamic> _$NativeStateToJson(NativeState instance) =>
    <String, dynamic>{
      'adCards': instance.adCards,
      'deliveryStatus': _$DeliveryStatusEnumMap[instance.deliveryStatus]!,
    };

const _$DeliveryStatusEnumMap = {
  DeliveryStatus.noInfo: 'noInfo',
  DeliveryStatus.placed: 'placed',
  DeliveryStatus.preparing: 'preparing',
  DeliveryStatus.onTheWay: 'onTheWay',
  DeliveryStatus.delivered: 'delivered',
};
