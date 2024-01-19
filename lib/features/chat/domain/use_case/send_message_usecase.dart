import 'dart:io';

import '/index.dart';

class SendMessageUseCase
    extends UseCaseWithParams<MessageModel, SendMessageParameter> {
  final ChatRepositoryImp _repo;

  SendMessageUseCase(this._repo);
  @override
  ResultFuture<MessageModel> call(SendMessageParameter params) async =>
      await _repo.sendMessage(params);
}

class SendMessageParameter extends Equatable {
  const SendMessageParameter({
    required this.chatId,
    required this.message,
    required this.image,
    required this.voice,
  });
  final int chatId;
  final String? message;
  final File? image;
  final File? voice;
  @override
  List<Object?> get props => [chatId, message, image, voice];
}
