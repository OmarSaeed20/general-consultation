import 'package:general_consultation/index.dart';

part 'country_model.g.dart';

@JsonSerializable(createToJson: false)
class CountryModel extends BaseResponse<List<CountryData>> {
  const CountryModel({
    required super.status,
    required super.code,
    required super.message,
    required super.data,
  });

  factory CountryModel.fromJson(Map<String, dynamic> json) =>
      _$CountryModelFromJson(json);
}
