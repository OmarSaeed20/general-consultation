import '/index.dart';

class GetAllVendorsUseCase
    extends UseCaseWithParams<AllVendorModel, GetVendorsParameter> {
  final ServiceRepositoryImp _repo;
  GetAllVendorsUseCase(this._repo);

  @override
  ResultFuture<AllVendorModel> call(
    GetVendorsParameter? params,
  ) async =>
      await _repo.getAllVendors(params);
}

class GetVendorsParameter extends Equatable {
  final FilterVendorParameter? filterParameter;
  final int page;

  const GetVendorsParameter(
      {required this.filterParameter, required this.page});
  @override
  List<Object?> get props => [page, filterParameter];
}
