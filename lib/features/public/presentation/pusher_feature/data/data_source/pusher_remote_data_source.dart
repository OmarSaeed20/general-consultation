/* import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:cars_new/core/consts/k_strings.dart';
import 'package:cars_new/features/public/notifications/data/models/notification_model.dart';
import 'package:cars_new/features/seller/offer/data/models/offer_details_model.dart';
import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:pusher_channels_flutter/pusher_channels_flutter.dart';

abstract class BasePusherRemoteDataSource {
  /// subscribe to channels
  Future<Unit> subscribeToChat({
    required int orderId,
    required int toUserId,
    required int userId,
  });

  Future<Unit> unsubscribeToChat({
    required int orderId,
    required int vendorId,
    required int userId,
  });

  Future<Unit> unsubscribeToServiceNotifications({
    required String serviceType,
  });

  Future<Unit> subscribeToAuctionChat({
    required int adId,
    required int toUserId,
    required int userId,
  });

  Future<Unit> subscribeToNotification({
    required int userId,
  });
  Future<Unit> subscribeToServiceNotifications({
    required String serviceType,
  });

  /// listen to events
  Stream<MessageModel> listenToChat();
  Stream<MessageModel> listenToAuctionChat();
  Stream<NotificationModel> listenToNotification();
  Stream<NotificationModel> listenToServiceNotifications();

  /// init pusher
  Future<Unit> initPusher();

  /// disconnect pusher
  Future<Unit> disconnectPusher();
}

class PusherRemoteDataSource extends GetConnect
    implements BasePusherRemoteDataSource {
  PusherChannelsFlutter pusher;
  PusherRemoteDataSource({required this.pusher});

  StreamController<MessageModel>? _chatStreamController;
  StreamController<MessageModel>? _auctionChatStreamController;
  StreamController<NotificationModel>? _notificationStreamController;
  StreamController<NotificationModel>? _serviceNotificationStreamController;

  @override
  Future<Unit> initPusher() async {
    try {
      _chatStreamController = StreamController();
      // init pusher

      await pusher.init(
        apiKey: Kstrings.pusherAppKey,
        cluster: Kstrings.pusherCluster,
      );

      // connect to channel
      await pusher.connect();

      return unit;
    } on SocketException {
      return Future.delayed(const Duration(seconds: 10), () async {
        return await initPusher();
      });
    } catch (error) {
      rethrow;
    }
  }

  // Disconnect from pusher service
  @override
  Future<Unit> disconnectPusher() async {
    try {
      pusher.disconnect();

      if (_auctionChatStreamController != null) {
        _auctionChatStreamController!.close();
      }
      if (_notificationStreamController != null) {
        _notificationStreamController!.close();
      }

      return unit;
    } on SocketException {
      return Future.delayed(const Duration(seconds: 10), () async {
        return await disconnectPusher();
      });
    } catch (error) {
      rethrow;
    }
  }

  @override
  Future<Unit> subscribeToChat({
    required int orderId,
    required int toUserId,
    required int userId,
  }) async {
    _chatStreamController = StreamController();
    await pusher.subscribe(
      channelName: Kstrings.getChatChannel(
        orderId: orderId,
        userId: userId,
        toUserId: toUserId,
      ),
      onEvent: (event) => listenToChats(event),
    );

    return unit;
  }

  @override
  Future<Unit> unsubscribeToChat({
    required int orderId,
    required int vendorId,
    required int userId,
  }) async {
    if (_chatStreamController != null) {
      _chatStreamController!.close();
    }

    await pusher.unsubscribe(
      channelName: Kstrings.getChatChannel(
        orderId: orderId,
        userId: userId,
        toUserId: vendorId,
      ),
    );

    return unit;
  }

  @override
  Future<Unit> unsubscribeToServiceNotifications({
    required String serviceType,
  }) async {
    if (_serviceNotificationStreamController != null) {
      _serviceNotificationStreamController!.close();
    }

    await pusher.unsubscribe(
      channelName: Kstrings.getServiceNotificationChannel(
        serviceType: serviceType,
      ),
    );

    return unit;
  }

  listenToChats(PusherEvent event) {
    final responseBody = jsonDecode(event.data);

    if (responseBody != null) {
      final MessageModel chatModel = MessageModel.fromMap(responseBody['data']);

      _chatStreamController!.add(chatModel);
    }
  }

  @override
  Stream<MessageModel> listenToChat() {
    return _chatStreamController!.stream;
  }

  @override
  Future<Unit> subscribeToAuctionChat({
    required int adId,
    required int toUserId,
    required int userId,
  }) async {
    _auctionChatStreamController = StreamController();
    await pusher.subscribe(
      channelName: Kstrings.getAuctionChatChannel(
        adId: adId,
        userId: userId,
        toUserId: toUserId,
      ),
      onEvent: (event) => listenToAuctionChats(event),
    );

    return unit;
  }

  listenToAuctionChats(PusherEvent event) {
    final responseBody = jsonDecode(event.data);

    if (responseBody != null) {
      final MessageModel chatModel = MessageModel.fromMap(responseBody['data']);

      _auctionChatStreamController!.add(chatModel);
    }
  }

  @override
  Stream<MessageModel> listenToAuctionChat() {
    return _auctionChatStreamController!.stream;
  }

  @override
  Future<Unit> subscribeToNotification({
    required int userId,
  }) async {
    _notificationStreamController = StreamController();
    await pusher.subscribe(
      channelName: Kstrings.getNotificationChannel(
        userId: userId,
      ),
      onEvent: (event) => listenToNotificationEvent(event),
    );

    return unit;
  }

  listenToNotificationEvent(PusherEvent event) {
    final responseBody = jsonDecode(event.data);

    if (responseBody != null) {
      final NotificationModel notification =
          NotificationModel.fromMap(responseBody['data']);

      _notificationStreamController!.add(notification);
    }
  }

  @override
  Stream<NotificationModel> listenToNotification() {
    return _notificationStreamController!.stream;
  }

  @override
  Future<Unit> subscribeToServiceNotifications({
    required String serviceType,
  }) async {
    _serviceNotificationStreamController = StreamController();
    await pusher.subscribe(
      channelName: Kstrings.getServiceNotificationChannel(
        serviceType: serviceType,
      ),
      onEvent: (event) => listenToServiceNotificationEvent(event),
    );

    return unit;
  }

  listenToServiceNotificationEvent(PusherEvent event) {
    final responseBody = jsonDecode(event.data);

    if (responseBody != null) {
      final NotificationModel notification =
          NotificationModel.fromMap(responseBody['data']);

      _serviceNotificationStreamController!.add(notification);
    }
  }

  @override
  Stream<NotificationModel> listenToServiceNotifications() {
    return _serviceNotificationStreamController!.stream;
  }
}
 */