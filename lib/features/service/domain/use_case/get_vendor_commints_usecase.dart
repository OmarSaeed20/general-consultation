import 'package:general_consultation/index.dart';

class GetVendorCommintsUseCase
    extends UseCaseWithParams<CommintModel, GetVendorCommintsParameter> {
  final ServiceRepositoryImp _repo;

  GetVendorCommintsUseCase(this._repo);
  @override
  ResultFuture<CommintModel> call(GetVendorCommintsParameter params) async =>
      await _repo.getVendorCommints(parameter: params);
}

class GetVendorCommintsParameter extends Equatable {
  final int vendorId;
  final int currentPage;

  const GetVendorCommintsParameter({
    required this.vendorId,
    required this.currentPage,
  });
  @override
  List<Object?> get props => [vendorId, currentPage];
}
