import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
part 'categories_entity.g.dart';

@JsonSerializable()
class CategoriesEntity extends Equatable {
  @JsonKey(name: "id")
  final int id;
  @JsonKey(name: "name")
  final String name;
  @JsonKey(name: "image")
  final String? image;
  @JsonKey(name: "is_active")
  final bool? isActive;

  const CategoriesEntity({
    required this.id,
    required this.name,
    required this.image,
    required this.isActive,
  });
  factory CategoriesEntity.fromJson(Map<String, dynamic> json) =>
      _$CategoriesEntityFromJson(json);
  Map<String, dynamic> toJson() => _$CategoriesEntityToJson(this);

  @override
  List<Object?> get props => [id, name, image, isActive];
}
