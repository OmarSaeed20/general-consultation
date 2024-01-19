import '/index.dart';

class GetCountryUseCase extends UseCaseWithoutParams<CountryModel> {
  final ServiceRepositoryImp _repository;
  GetCountryUseCase(this._repository);
  
  @override
  ResultFuture<CountryModel> call() async => await _repository.fetchCountry();
}
