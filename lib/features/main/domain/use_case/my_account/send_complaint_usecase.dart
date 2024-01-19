import 'dart:io';

import '/index.dart';

class SendComplaintUseCase
    extends UseCaseWithParams<ContactUsModel, SendComplaintParameter> {
  final HomeRepositoryImp _repo;

  SendComplaintUseCase(this._repo);
  @override
  ResultFuture<ContactUsModel> call(SendComplaintParameter params) async =>
      await _repo.sendComplaint(params);
}

class SendComplaintParameter extends Equatable {
  const SendComplaintParameter({
    this.content,
    this.image,
    required this.categoryId,
  });
  final int categoryId;
  final String? content;
  final File? image;
  @override
  List<Object?> get props => [categoryId, image, content];
}
