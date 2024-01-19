import '/index.dart';

part 'pagenation_model.g.dart';

/* @JsonSerializable(createToJson: false, converters: [DataConverter()])
class PagenationModel<T> extends Equatable {
  @JsonKey(name: "meta")
  final MetaDataModel metaData;
  @JsonKey(name: "data")
  final List<T> data;

  const PagenationModel({required this.metaData, required this.data});

  factory PagenationModel.fromJson(Map<String, dynamic> json) =>
      _$PagenationModelFromJson(json);

  @override
  List<Object?> get props => [metaData, data];
}

@JsonSerializable(createToJson: false)
class MetaDataModel extends Equatable {
  @JsonKey(name: "current_page")
  final int? currentPage;
  @JsonKey(name: "last_page")
  final int? lastPage;
  @JsonKey(name: "total_pages")
  final int? totalPages;
  @JsonKey(name: "per_page")
  final int? perPage;

  const MetaDataModel({
    required this.currentPage,
    required this.lastPage,
    required this.totalPages,
    required this.perPage,
  });

  factory MetaDataModel.fromJson(Map<String, dynamic> json) =>
      _$MetaDataModelFromJson(json);

  @override
  List<Object?> get props => [currentPage, lastPage, totalPages, perPage];
}
 */
@JsonSerializable(createToJson: false)
class PagenationModel<T> extends Equatable {
  @JsonKey(name: "meta")
  final MetaDataModel meta;
  @JsonKey(name: "data")
  @DataConverter()
  final T data;

  const PagenationModel({required this.meta, required this.data});

  factory PagenationModel.fromJson(Map<String, dynamic> json) =>
      _$PagenationModelFromJson(json);

  @override
  List<Object?> get props => [meta, data];
}

@JsonSerializable(createToJson: false)
class MetaDataModel extends Equatable {
  @JsonKey(name: "current_page")
  final int? currentPage;
  @JsonKey(name: "last_page")
  final int? lastPage;
  @JsonKey(name: "total_pages")
  final int? totalPages;
  @JsonKey(name: "per_page")
  final int? perPage;

  const MetaDataModel({
    required this.currentPage,
    required this.lastPage,
    required this.totalPages,
    required this.perPage,
  });

  factory MetaDataModel.fromJson(Map<String, dynamic> json) =>
      _$MetaDataModelFromJson(json);

  @override
  List<Object?> get props => [currentPage, lastPage, totalPages, perPage];
}
