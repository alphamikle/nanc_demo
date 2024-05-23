import 'package:autoequal/autoequal.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:nanc_tools/nanc_tools.dart';

import '../../ui/component/delivery_info.dart';
import '../data/page_data.dart';
import '../model/ad_card_data.dart';

part 'native_state.g.dart';

@autoequal
@CopyWith()
@JsonSerializable()
class NativeState extends Equatable {
  const NativeState({
    required this.adCards,
    required this.deliveryStatus,
  });

  factory NativeState.initial() => NativeState(
        adCards: ads.map((Json json) => AdCardData.fromJson(json)).toList(),
        deliveryStatus: DeliveryStatus.onTheWay,
      );

  factory NativeState.fromJson(dynamic json) => _$NativeStateFromJson(castToJson(json));

  final List<AdCardData> adCards;

  final DeliveryStatus deliveryStatus;

  @override
  List<Object?> get props => _$props;

  Json toJson() => _$NativeStateToJson(this);
}
