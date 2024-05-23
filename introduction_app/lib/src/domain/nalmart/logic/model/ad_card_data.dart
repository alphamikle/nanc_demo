import 'package:autoequal/autoequal.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:nanc_tools/nanc_tools.dart';

part 'ad_card_data.g.dart';

@autoequal
@CopyWith()
@JsonSerializable()
class AdCardData extends Equatable {
  const AdCardData({
    required this.image,
    required this.title,
    required this.description,
  });

  factory AdCardData.fromJson(dynamic json) => _$AdCardDataFromJson(castToJson(json));

  final String? image;

  final String? title;

  final String? description;

  @override
  List<Object?> get props => _$props;

  Json toJson() => _$AdCardDataToJson(this);
}
