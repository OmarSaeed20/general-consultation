import '/index.dart';

class GetChatByVendorUseCase
    extends UseCaseWithParams<GetChatByVendorModel, ChatParameter> {
  final ChatRepositoryImp _repo;

  GetChatByVendorUseCase(this._repo);
  @override
  ResultFuture<GetChatByVendorModel> call(ChatParameter params) async =>
      await _repo.getChatByVendor(params);
}

class ChatParameter extends Equatable {
  const ChatParameter({required this.page, required this.vendorId});
  final int page;
  final int vendorId;

  @override
  List<Object?> get props => [page,vendorId];
}
