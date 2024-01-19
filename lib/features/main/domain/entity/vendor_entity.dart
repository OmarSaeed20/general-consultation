import '/index.dart';

part 'vendor_entity.g.dart';

@JsonSerializable(createToJson: false)
class VendorEntity extends Equatable {
  @JsonKey(name: "id")
  final int id;
  @JsonKey(name: "name")
  final String name;
  @JsonKey(name: "image")
  final String image;
  @JsonKey(name: "title")
  final String title;
  @JsonKey(name: "about")
  final String? about;
  @JsonKey(name: "years_of_experience")
  final int? yearsOfExperience;
  @JsonKey(name: "services")
  final List<String>? services;
  @JsonKey(name: "location_text")
  final String? locationText;
  @JsonKey(name: "location_lat")
  final String? locationLat;
  @JsonKey(name: "location_long")
  final String? locationLong;
  @JsonKey(name: "license_work_image")
  final String? licenseWorkImage;
  @JsonKey(name: "license_work_date")
  final String? licenseWorkDate;
  @JsonKey(name: "category")
  final CategoriesEntity category;
  @JsonKey(name: "sub_category")
  final SubCategoryEntity? subCategory;
  @JsonKey(name: "country")
  final CountryData? country;
  @JsonKey(name: "city")
  final CountryData? city;
  @JsonKey(name: "dayes")
  final Dayes? dayes;
  @JsonKey(name: "service_description")
  final String? serviceDescription;
  @JsonKey(name: "about_media")
  final String? aboutMedia;
  @JsonKey(name: "avg_rate")
  final String avgRate;
  @JsonKey(name: "account_verification_sign")
  final bool? accountVerificationSign;
  @JsonKey(name: "is_office")
  final bool? isOffice;

  const VendorEntity({
    required this.id,
    required this.name,
    required this.image,
    required this.title,
    required this.about,
    required this.yearsOfExperience,
    required this.services,
    required this.locationText,
    required this.locationLat,
    required this.locationLong,
    required this.licenseWorkImage,
    required this.licenseWorkDate,
    required this.category,
    required this.subCategory,
    required this.country,
    required this.city,
    required this.dayes,
    required this.serviceDescription,
    required this.aboutMedia,
    required this.avgRate,
    required this.accountVerificationSign,
    required this.isOffice,
  });
  factory VendorEntity.fromJson(Map<String, dynamic> json) =>
      _$VendorEntityFromJson(json);
  @override
  List<Object?> get props => [
        id,
        name,
        image,
        title,
        about,
        yearsOfExperience,
        services,
        locationText,
        locationLat,
        locationLong,
        licenseWorkImage,
        licenseWorkDate,
        category,
        subCategory,
        country,
        city,
        dayes,
        serviceDescription,
        aboutMedia,
        avgRate,
        isOffice,
        accountVerificationSign
      ];
}

@JsonSerializable(createToJson: false)
class Dayes extends Equatable {
  @JsonKey(name: "saturday")
  final Day? saturday;
  @JsonKey(name: "sunday")
  final Day? sunday;
  @JsonKey(name: "monday")
  final Day? monday;
  @JsonKey(name: "tuesday")
  final Day? tuesday;
  @JsonKey(name: "wednesday")
  final Day? wednesday;
  @JsonKey(name: "thursday")
  final Day? thursday;
  @JsonKey(name: "friday")
  final Day? friday;
  const Dayes({
    required this.saturday,
    required this.sunday,
    required this.monday,
    required this.tuesday,
    required this.wednesday,
    required this.thursday,
    required this.friday,
  });
  factory Dayes.fromJson(Map<String, dynamic> json) => _$DayesFromJson(json);
  @override
  List<Object?> get props => [
        saturday,
        sunday,
        monday,
        tuesday,
        wednesday,
        thursday,
        friday,
      ];
}

@JsonSerializable(createToJson: false)
class Day extends Equatable {
  @JsonKey(name: "from")
  final String? from;
  @JsonKey(name: "to")
  final String? to;
  @JsonKey(name: "translate_word")
  final String? name;
  const Day({
    required this.from,
    required this.to,
    required this.name,
  });
  factory Day.fromJson(Map<String, dynamic> json) => _$DayFromJson(json);

  @override
  List<Object?> get props => [from, to, name];
}
