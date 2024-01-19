import '/index.dart';

class GetAllChatsUseCase
    extends UseCaseWithParams<AllChatsModel, AllChatsParameter> {
  final ChatRepositoryImp _repo;
  GetAllChatsUseCase(this._repo);

  @override
  ResultFuture<AllChatsModel> call(AllChatsParameter params) async =>
      await _repo.getAllChats(parameter: params);
}

class AllChatsParameter extends Equatable {
  const AllChatsParameter({required this.page});
  final int page;
  @override
  List<Object?> get props => [page];
}
