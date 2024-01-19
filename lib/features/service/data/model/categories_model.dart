import '/index.dart';

part 'categories_model.g.dart';

@JsonSerializable(createToJson: false)
class CategoriesModel extends BaseResponse<List<CategoriesEntity>> {
  const CategoriesModel({
    required super.status,
    required super.code,
    required super.message,
    required super.data,
  });

  factory CategoriesModel.fromJson(Map<String, dynamic> json) =>
      _$CategoriesModelFromJson(json);
}
