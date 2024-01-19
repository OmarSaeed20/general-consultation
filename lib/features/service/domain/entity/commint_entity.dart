import 'package:general_consultation/index.dart';
part 'commint_entity.g.dart';

@JsonSerializable(createToJson: false)
class CommintEntity extends Equatable {
  @JsonKey(name: "count_rates")
  final int countRates;
  @JsonKey(name: "rates")
  final CommintDataEntity? commints;

  const CommintEntity({required this.countRates, this.commints});

  factory CommintEntity.fromJson(Map<String, Object?> json) =>
      _$CommintEntityFromJson(json);

  @override
  List<Object?> get props => [countRates, commints];
}

@JsonSerializable(createToJson: false)
class CommintDataEntity extends Equatable {
  @JsonKey(name: "data")
  final List<CommintData> rates;
  @JsonKey(name: "meta")
  final MetaDataModel? meta;

  const CommintDataEntity({required this.rates, this.meta});

  factory CommintDataEntity.fromJson(Map<String, Object?> json) =>
      _$CommintDataEntityFromJson(json);

  @override
  List<Object?> get props => [rates, meta];
}

@JsonSerializable(createToJson: false)
class CommintData extends Equatable {
  final int? rate;
  final String message;
  final String name;
  final String? image;
  @JsonKey(name: "created_at")
  final String createdAt;
  const CommintData({
    this.rate,
    this.image,
    required this.message,
    required this.name,
    required this.createdAt,
  });

  factory CommintData.fromJson(Map<String, Object?> json) =>
      _$CommintDataFromJson(json);

  @override
  List<Object?> get props => [rate, message, name, image, createdAt];
}
