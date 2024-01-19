import '/index.dart';

part 'sup_categories_entity.g.dart';

@JsonSerializable(createToJson: false)
class SubCategoryEntity extends Equatable {
  @JsonKey(name: "id")
  final int id;
  @JsonKey(name: "name")
  final String name;
  @JsonKey(name: "image")
  final String? image;
  @JsonKey(name: "is_active")
  final bool? isActive;

  const SubCategoryEntity({
    required this.id,
    required this.name,
    required this.image,
    required this.isActive,
  });
  factory SubCategoryEntity.fromJson(Map<String, dynamic> json) =>
      _$SubCategoryEntityFromJson(json);

  @override
  List<Object?> get props => [id, name, image, isActive];
}
