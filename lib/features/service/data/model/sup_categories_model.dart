import '/index.dart';

part 'sup_categories_model.g.dart';

@JsonSerializable(createToJson: false)
class SubCategoryModel extends BaseResponse<List<SubCategoryEntity>> {
  const SubCategoryModel({
    required super.status,
    required super.code,
    required super.message,
    required super.data,
  });

  factory SubCategoryModel.fromJson(Map<String, dynamic> json) =>
      _$SubCategoryModelFromJson(json);
}
