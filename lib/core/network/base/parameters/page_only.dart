import 'package:general_consultation/index.dart';

class PageOnlyParameter extends Equatable {
  final int page;

  const PageOnlyParameter({required this.page});

  @override
  List<Object> get props => [page];
}
