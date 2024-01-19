/* import '/features/main/domain/entity/vendor.dart';
import '/index.dart';

part 'vendor_model.g.dart';

@JsonSerializable(createToJson: false)
class VendorDataModel extends Vendor {
  const VendorDataModel({
    required super.id,
    required super.name,
    required super.about,
    required super.aboutMedia,
    required super.accountVerificationSign,
    required super.avgRate,
    required super.category,
    required super.city,
    required super.country,
    required super.dayes,
    required super.idImage,
    required super.licenseWorkDate,
    required super.licenseWorkImage,
    required super.locationLat,
    required super.locationLong,
    required super.locationText,
    required super.serviceDescription,
    required super.services,
    required super.subCategory,
    required super.title,
    required super.yearsOfExperience,
  });

  factory VendorDataModel.fromJson(Map<String, dynamic> json) =>
      _$VendorDataModelFromJson(json);
}

@JsonSerializable(createToJson: false)
class DayesDataModel extends Dayes {
  const DayesDataModel({
    required super.friday,
    required super.monday,
    required super.saturday,
    required super.sunday,
    required super.thursday,
    required super.tuesday,
    required super.wednesday,
  });

  factory DayesDataModel.fromJson(Map<String, dynamic> json) =>
      _$DayesDataModelFromJson(json);
}

@JsonSerializable(createToJson: false)
class DayDataModel extends Day {
  const DayDataModel({required super.from, required super.to});

  factory DayDataModel.fromJson(Map<String, dynamic> json) =>
      _$DayDataModelFromJson(json);
}

@JsonSerializable(createToJson: false)
class CountryDataModel extends Country {
  const CountryDataModel({
    required super.value,
    required super.label,
    required super.isActive,
  });

  factory CountryDataModel.fromJson(Map<String, dynamic> json) =>
      _$CountryDataModelFromJson(json);
}

@JsonSerializable(createToJson: false)
class SubCategoryDataModel extends SubCategory {
  const SubCategoryDataModel({
    required super.id,
    required super.image,
    required super.name,
    required super.isActive,
  });

  factory SubCategoryDataModel.fromJson(Map<String, dynamic> json) =>
      _$SubCategoryDataModelFromJson(json);
}
 */