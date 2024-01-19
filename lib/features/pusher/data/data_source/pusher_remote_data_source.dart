import 'dart:async';
import 'dart:convert';
import 'dart:io';

import '/index.dart' hide GetNumUtils;
import 'package:flutter/foundation.dart';

abstract class BasePusherRemoteDataSource {
  Future<void> initPusher();
  Future<void> disconnectPusher();
  Future<void> subscribeToChat({required int chatId});
  Future<void> unsubscribeToChat({required int chatId});

  /// listen to events
  Stream<MessageEntity> listenToChat();
}

class PusherRemoteDataSourceImp extends GetConnect
    implements BasePusherRemoteDataSource {
  PusherRemoteDataSourceImp({required this.pusher});
  PusherChannelsFlutter pusher;
  StreamController<MessageEntity>? _chatStreamController;

  @override
  Future<void> initPusher() async {
    try {
      _chatStreamController = StreamController();
      // init pusher
      await pusher.init(
        apiKey: EndPoints.pusherAppKey,
        cluster: EndPoints.pusherCluster,
      );
      await pusher.connect();
    } on SocketException {
      return Future.delayed(10.seconds, () async => await initPusher());
    } catch (error) {
      //debugPrint("Error in init pusher ===> $error");
      rethrow;
    }
  }

  @override
  Future<void> disconnectPusher() async {
    try {
      pusher.disconnect();
    } on SocketException {
      return Future.delayed(10.seconds, () async => await disconnectPusher());
    } catch (error) {
      //debugPrint("Error in disconnect pusher ===> $error");
      rethrow;
    }
  }

  @override
  Future<void> subscribeToChat({required int chatId}) async {
    _chatStreamController = StreamController();
    await pusher
        .subscribe(
      channelName: EndPoints.getChatChannel(chatId: chatId),
      onEvent: (event) => _listenToChats(event),
    )
        .then((value) {
      if (kDebugMode) {
        //debugPrint("==============================> ${value.channelName}");
      }
    });
  }

  @override
  Future<void> unsubscribeToChat({required int chatId}) async {
    if (_chatStreamController != null) {
      _chatStreamController!.close();
    }

    await pusher.unsubscribe(
      channelName: EndPoints.getChatChannel(chatId: chatId),
    );
  }

  void _listenToChats(PusherEvent event) {
    final response = jsonDecode(event.data);
    if (response != null) {
      final MessageEntity chatModel = MessageEntity.fromJson(response['data']);
      _chatStreamController?.add(chatModel);
    }
  }

  @override
  Stream<MessageEntity> listenToChat() => _chatStreamController!.stream;
}
