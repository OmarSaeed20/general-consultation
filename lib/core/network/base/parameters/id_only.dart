import 'package:general_consultation/index.dart';

class IdOnlyParameter extends Equatable {
  final int id;

  const IdOnlyParameter({required this.id});

  @override
  List<Object> get props => [id];
}
