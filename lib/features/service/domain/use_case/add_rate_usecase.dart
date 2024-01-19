import 'package:general_consultation/index.dart';

class AddVendorCommintsUseCase
    extends UseCaseWithParams<ContactUsModel, AddVendorCommintsParameter> {
  final ServiceRepositoryImp _repo;

  AddVendorCommintsUseCase(this._repo);
  @override
  ResultFuture<ContactUsModel> call(AddVendorCommintsParameter params) async =>
      await _repo.addVendorCommints(parama: params);
}
