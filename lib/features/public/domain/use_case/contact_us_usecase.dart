import '/index.dart';

class ContactUsUseCase
    extends UseCaseWithParams<BaseResponse, ContactUsParameter> {
  final BaseAuthenticationRepository _repo;

  ContactUsUseCase(this._repo);
  @override
  ResultFuture<BaseResponse> call(ContactUsParameter params) async =>
      await _repo.contactUs(params);
}

class ContactUsParameter extends Equatable {
  final String content;

  const ContactUsParameter({required this.content});

  @override
  List<Object> get props => [content];
}
