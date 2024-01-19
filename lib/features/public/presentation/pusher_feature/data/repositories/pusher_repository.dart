/* import 'package:cars_new/features/public/notifications/data/models/notification_model.dart';
import 'package:dartz/dartz.dart';
import 'package:cars_new/core/errors/failures.dart';
import '../../../../../core/network/network_info.dart';
import '../../../auth/data/data_source/auth_local_data_source.dart';
import '../../../../seller/offer/data/models/offer_details_model.dart';
import '../../domain/repositories/base_pusher_repository.dart';
import '../data_source/pusher_remote_data_source.dart';

class PusherRepository implements BasePusherRepository {
  final BasePusherRemoteDataSource basePusherRemoteDataSource;
  final NetworkInfo networkInfo;
  BaseAuthLocalDataSource baseAuthLocalDataSource;

  PusherRepository({
    required this.basePusherRemoteDataSource,
    required this.networkInfo,
    required this.baseAuthLocalDataSource,
  });

  @override
  Future<Either<Failure, Unit>> initPusher() async {
    try {
      await basePusherRemoteDataSource.initPusher();

      return const Right(unit);
    } catch (error) {
      return Left(UnExpectedFailure(message: error.toString()));
    }
  }

  @override
  Future<Either<Failure, Unit>> disconnectPusher() async {
    try {
      await basePusherRemoteDataSource.disconnectPusher();

      return const Right(unit);
    } catch (error) {
      return Left(UnExpectedFailure(message: error.toString()));
    }
  }

  @override
  Future<Either<Failure, Unit>> subscribeToChat({
    required int orderId,
    required int toUserId,
    required int userId,
  }) async {
    try {
      await basePusherRemoteDataSource.subscribeToChat(
        orderId: orderId,
        toUserId: toUserId,
        userId: userId,
      );

      return const Right(unit);
    } catch (error) {
      return Left(UnExpectedFailure(message: error.toString()));
    }
  }

  @override
  Future<Either<Failure, Unit>> unsubscribeToChat({
    required int orderId,
    required int vendorId,
    required int userId,
  }) async {
    try {
      await basePusherRemoteDataSource.unsubscribeToChat(
        orderId: orderId,
        vendorId: vendorId,
        userId: userId,
      );

      return const Right(unit);
    } catch (error) {
      return Left(UnExpectedFailure(message: error.toString()));
    }
  }

  @override
  Future<Either<Failure, Unit>> unsubscribeToServiceNotifications({
    required String serviceType,
  }) async {
    try {
      await basePusherRemoteDataSource.unsubscribeToServiceNotifications(
        serviceType: serviceType,
      );

      return const Right(unit);
    } catch (error) {
      return Left(UnExpectedFailure(message: error.toString()));
    }
  }

  @override
  Stream<MessageModel> listenToChat() {
    return basePusherRemoteDataSource.listenToChat();
  }

  @override
  Future<Either<Failure, Unit>> subscribeToAuctionChat({
    required int adId,
    required int toUserId,
    required int userId,
  }) async {
    try {
      await basePusherRemoteDataSource.subscribeToAuctionChat(
        adId: adId,
        toUserId: toUserId,
        userId: userId,
      );

      return const Right(unit);
    } catch (error) {
      return Left(UnExpectedFailure(message: error.toString()));
    }
  }

  @override
  Stream<MessageModel> listenToAuctionChat() {
    return basePusherRemoteDataSource.listenToAuctionChat();
  }

  @override
  Future<Either<Failure, Unit>> subscribeToNotification({
    required int userId,
  }) async {
    try {
      await basePusherRemoteDataSource.subscribeToNotification(
        userId: userId,
      );

      return const Right(unit);
    } catch (error) {
      return Left(UnExpectedFailure(message: error.toString()));
    }
  }

  @override
  Stream<NotificationModel> listenToNotification() {
    return basePusherRemoteDataSource.listenToNotification();
  }

  @override
  Future<Either<Failure, Unit>> subscribeToServiceNotifications({
    required String serviceType,
  }) async {
    try {
      await basePusherRemoteDataSource.subscribeToServiceNotifications(
        serviceType: serviceType,
      );

      return const Right(unit);
    } catch (error) {
      return Left(UnExpectedFailure(message: error.toString()));
    }
  }

  @override
  Stream<NotificationModel> listenToServiceNotifications() {
    return basePusherRemoteDataSource.listenToServiceNotifications();
  }
}
 */