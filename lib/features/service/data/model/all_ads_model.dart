import '/index.dart';

part 'all_ads_model.g.dart';

@JsonSerializable(createToJson: false)
class AllAdsModel extends BaseResponse<AllAdsEntity> {
  const AllAdsModel({
    required super.status,
    required super.code,
    required super.message,
    required super.data,
  });

  factory AllAdsModel.fromJson(Map<String, dynamic> json) =>
      _$AllAdsModelFromJson(json);
}


