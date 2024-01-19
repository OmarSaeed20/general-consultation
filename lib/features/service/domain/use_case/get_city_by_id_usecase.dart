import '/index.dart';

class GetCityByIdUseCase extends UseCaseWithParams<CountryModel, IdOnlyParameter> {
  final ServiceRepositoryImp _repository;

  GetCityByIdUseCase(this._repository);
  @override
  ResultFuture<CountryModel> call(IdOnlyParameter params) async =>
      await _repository.fetchCities(params);
}

