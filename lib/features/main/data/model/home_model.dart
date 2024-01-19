import '/index.dart';

part 'home_model.g.dart';

@JsonSerializable(createToJson: false)
class HomeModel extends BaseResponse<HomeEntity> {
  const HomeModel({
    required super.status,
    required super.code,
    required super.message,
    required super.data,
  });

  factory HomeModel.fromJson(Map<String, dynamic> json) =>
      _$HomeModelFromJson(json);
}
/* @JsonSerializable(createToJson: false)
class HomeDataModel extends HomeEntity { 
  const HomeDataModel({
    required super.banners, 
    // required super.categories, 
    required super.vendors, 
  });

  factory HomeDataModel.fromJson(Map<String, dynamic> json) =>
      _$HomeDataModelFromJson(json);
} */