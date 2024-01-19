import 'package:general_consultation/index.dart';

class ChangeLangUseCase
    extends UseCaseWithParams<BaseResponse, LangOnlyParameter> {
  final BaseAuthenticationRepository _repo;

  ChangeLangUseCase(this._repo);

  @override
  ResultFuture<BaseResponse> call(LangOnlyParameter params) async =>
      await _repo.changeLang(lang: params.lang);
}

class LangOnlyParameter extends Equatable {
  final String lang;

  const LangOnlyParameter({required this.lang});

  @override
  List<Object> get props => [lang];
}
