import '/index.dart';

part 'add_vendor_commints_parameter.g.dart';

@JsonSerializable()
class AddVendorCommintsParameter extends Equatable {
  @JsonKey(name: "to_user_id")
  final int? toUserId;
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "rate")
  final int? rate;

  const AddVendorCommintsParameter({this.rate, this.toUserId, this.message});
  Map<String, dynamic> toJson() => _$AddVendorCommintsParameterToJson(this);

  @override
  List<Object?> get props => [rate, toUserId, message];
}
