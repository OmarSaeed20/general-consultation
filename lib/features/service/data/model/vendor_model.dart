import '/index.dart';

part 'vendor_model.g.dart';

@JsonSerializable(createToJson: false)
class VendorModel extends BaseResponse<VendorEntity> {
  const VendorModel({
    required super.status,
    required super.code,
    required super.message,
    required super.data,
  });

  factory VendorModel.fromJson(Map<String, dynamic> json) =>
      _$VendorModelFromJson(json);
}
