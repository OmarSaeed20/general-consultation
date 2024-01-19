import '/index.dart';

class FilterVendorState extends Equatable {
  const FilterVendorState({
    this.rx = RequestState.loading,
    this.rxSup = RequestState.none,
    this.rxCitiy = RequestState.none,
    this.categoryId,
    // this.seclectedCitiy,
    this.seclectedCitiy = const [],
    this.supCategories = const [],
    this.subCtegoriesIds = const [],
    this.categories = const [],
    this.citiesIds = const [],
    this.countries = const [],
    this.cities = const [],
    this.seclectedCountry,
    this.office,
    this.rate,
    this.verifyAccount,
    // required this.keyWords,
    this.yearsOfExper = "undefined",
    this.rates = const [4.0, 3.0, 2.0],
    this.accreditations = const [
      Kstrings.acertified,
      Kstrings.unsupported,
    ],
    this.years = const [
      Kstrings.undefined,
      Kstrings.from0to3years,
      Kstrings.from3to10years,
      Kstrings.yearslater10,
    ],
  });

  final RequestState rx, rxSup, rxCitiy;
  final List<String> years, accreditations;
  //* filter data
  final int? categoryId, office /* , countryId */;
  final List<CountryData> seclectedCitiy;
  final CountryData? seclectedCountry;
  final double? rate;
  final List<CountryData> countries, cities;
  final List<CategoriesEntity> categories;
  final List<SubCategoryEntity> supCategories;
  final List<int> subCtegoriesIds, citiesIds;
  final List<double> rates;
  final String? verifyAccount, yearsOfExper;
  // final TextEditingController keyWords;

  FilterVendorState copyWith({
    RequestState? rx,
    RequestState? rxCitiy,
    RequestState? rxSup,
    int? categoryId,
    List<CountryData>? seclectedCitiy,
    List<int>? subCtegoriesIds,
    List<int>? citiesIds,
    List<CategoriesEntity>? categories,
    List<SubCategoryEntity>? supCategories,
    CountryData? seclectedCountry,
    List<CountryData>? countries,
    List<CountryData>? cities,
    String? verifyAccount,
    double? rate,
    // String? keyWords,
    String? yearsOfExper,
    int? office,
  }) =>
      FilterVendorState(
        seclectedCitiy: seclectedCitiy ?? this.seclectedCitiy,
        supCategories: supCategories ?? this.supCategories,
        categories: categories ?? this.categories,
        rxCitiy: rxCitiy ?? this.rxCitiy,
        rxSup: rxSup ?? this.rxSup,
        rx: rx ?? this.rx,
        categoryId: categoryId ?? this.categoryId,
        subCtegoriesIds: subCtegoriesIds ?? this.subCtegoriesIds,
        citiesIds: citiesIds ?? this.citiesIds,
        countries: countries ?? this.countries,
        cities: cities ?? this.cities,
        seclectedCountry: seclectedCountry ?? this.seclectedCountry,
        verifyAccount: verifyAccount ?? this.verifyAccount,
        rate: rate ?? this.rate,
        // keyWords: this.keyWords.copyWith(text: keyWords),
        yearsOfExper: yearsOfExper ?? this.yearsOfExper,
        office: office ?? this.office,
      );

  @override
  List<Object?> get props => [
        rx,
        rxSup,
        rxCitiy,
        categoryId,
        seclectedCitiy,
        office,
        supCategories,
        categories,
        cities,
        rates,
        countries,
        subCtegoriesIds,
        seclectedCountry,
        citiesIds,
        verifyAccount,
        rate,
        // keyWords,
        yearsOfExper,
      ];
}
