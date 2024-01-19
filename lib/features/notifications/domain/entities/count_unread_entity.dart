import 'package:general_consultation/index.dart';
part 'count_unread_entity.g.dart';

@JsonSerializable(createToJson: false, converters: [DataConverter()])
class CountUnreadEntity extends Equatable {
  @JsonKey(name: "count")
  final int count;

  const CountUnreadEntity({required this.count});

  factory CountUnreadEntity.fromJson(Map<String, dynamic> json) =>
      _$CountUnreadEntityFromJson(json);

  @override
  List<Object?> get props => [count];
}
