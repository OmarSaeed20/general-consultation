import '/index.dart';
part 'filter_vendors.g.dart';
 
@JsonSerializable()
class FilterVendorParameter extends Equatable {
  @JsonKey(name: "category_id")
  final int? categoryId;
  @JsonKey(name: "sub_categories_ids")
  final List<int> subCtegoriesIds;
  @JsonKey(name: "country_id")
  final int? countryId;
  @JsonKey(name: "cities_ids")
  final List<int> citiesIds;
  @JsonKey(name: "verify_account")
  final String? verifyAccount;
  @JsonKey(name: "rate")
  final int? rate;
  @JsonKey(name: "key_words")
  final String? keyWords;
  @JsonKey(name: "years_of_experience")
  final String? yearsOfExperience;
  @JsonKey(name: "office")
  final int? office;

  const FilterVendorParameter({
    this.categoryId,
    this.subCtegoriesIds = const [],
    this.countryId,
    this.citiesIds = const [],
    this.verifyAccount,
    this.rate,
    this.keyWords,
    this.office,
    this.yearsOfExperience,
  });
  Map<String, dynamic> toJson() => _$FilterVendorParameterToJson(this);
  @override
  List<Object?> get props => [
        categoryId,
        subCtegoriesIds,
        countryId,
        citiesIds,
        verifyAccount,
        rate,
        keyWords,
        office,
        yearsOfExperience,
      ];
}

