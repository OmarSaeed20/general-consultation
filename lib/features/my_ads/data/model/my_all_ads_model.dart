import 'package:general_consultation/index.dart';

part 'my_all_ads_model.g.dart';

@JsonSerializable(createToJson: false)
class MyAllAdsModel extends BaseResponse<MyAllAdsEntity> {
  const MyAllAdsModel({
    required super.status,
    required super.code,
    required super.message,
    required super.data,
  });

  factory MyAllAdsModel.fromJson(Map<String, dynamic> json) =>
      _$MyAllAdsModelFromJson(json);
}
