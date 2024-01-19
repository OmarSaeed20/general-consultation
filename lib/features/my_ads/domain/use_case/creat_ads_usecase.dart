import 'package:general_consultation/index.dart';

import 'dart:io';

class CreateAdsUseCase
    extends UseCaseWithParams<BaseResponse, CreateAdsParameter> {
  final AdsRepositoryImp _repo;

  CreateAdsUseCase(this._repo);
  @override
  ResultFuture<BaseResponse> call(CreateAdsParameter params) =>
      _repo.createAds(params);
}

class CreateAdsParameter extends Equatable {
  final int categoryId;
  final String description;
  final File? image;
  final String? videoLink;

  const CreateAdsParameter({
    required this.categoryId,
    required this.description,
    required this.image,
    required this.videoLink,
  });

  @override
  List<Object?> get props => [categoryId, description, image, videoLink];
}
