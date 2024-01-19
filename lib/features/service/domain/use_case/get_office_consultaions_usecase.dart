import '/index.dart';

class GetOfficeConsultaionsUseCase
    extends UseCaseWithParams<AllVendorModel, OfficeConsultaionsParameter> {
  final ServiceRepositoryImp _repo;
  GetOfficeConsultaionsUseCase(this._repo);

  @override
  ResultFuture<AllVendorModel> call(OfficeConsultaionsParameter params) async =>
      await _repo.getOfficeConsultaionsData(pragma: params);
}
class OfficeConsultaionsParameter extends Equatable {
  final int office;
  final int page;
  const OfficeConsultaionsParameter({required this.page, required this.office});

  @override
  List<Object?> get props => [office, page];
}