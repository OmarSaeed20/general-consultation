import 'dart:io';

import '/index.dart';

class UpdateProfileUseCase
    extends UseCaseWithParams<AuthenticationModel, UpdateProfileParameter> {
  final BaseAuthenticationRepository _repo;

  UpdateProfileUseCase(this._repo);
  @override
  ResultFuture<AuthenticationModel> call(UpdateProfileParameter params) async =>
      await _repo.updateProfile(params);
}

class UpdateProfileParameter extends Equatable {
  final String? codeCountry;
  final String? phone;
  final String? name;
  final File? image;

  const UpdateProfileParameter({
    this.codeCountry,
    this.name,
    this.image,
    this.phone,
  });

  @override
  List<Object?> get props => [codeCountry, name, phone, image];
}
