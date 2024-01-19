import 'dart:io';
import 'package:general_consultation/index.dart';

class UpdateAdvertisementsUseCase
    extends UseCaseWithParams<BaseResponse, UpdateAdvertisementsParameter> {
  final AdsRepositoryImp _repo;

  UpdateAdvertisementsUseCase(this._repo);
  @override
  ResultFuture<BaseResponse> call(UpdateAdvertisementsParameter params) =>
      _repo.updateAdvertisemrnts(params);
}

class UpdateAdvertisementsParameter extends Equatable {
  final int id;
  final int categoryId;
  final String description;
  final File? image;
  final String? videoLink;

  const UpdateAdvertisementsParameter({
    required this.id,
    required this.categoryId,
    required this.description,
    this.image,
    required this.videoLink,
  });

  @override
  List<Object?> get props => [id, categoryId, description, image, videoLink];
}
