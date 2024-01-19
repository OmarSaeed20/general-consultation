/* import 'package:dartz/dartz.dart';

import '../../../../../core/errors/failures.dart';
import '../../../notifications/domain/entities/notification.dart';
import '../../../../seller/offer/domain/entities/offer_details.dart';

abstract class BasePusherRepository {
  Future<Either<Failure, Unit>> initPusher();

  Future<Either<Failure, Unit>> disconnectPusher();

  Future<Either<Failure, Unit>> subscribeToChat({
    required int orderId,
    required int toUserId,
    required int userId,
  });

  Future<Either<Failure, Unit>> unsubscribeToChat({
    required int orderId,
    required int vendorId,
    required int userId,
  });

  Future<Either<Failure, Unit>> unsubscribeToServiceNotifications({
    required String serviceType,
  });

  Stream<Message> listenToChat();

  Future<Either<Failure, Unit>> subscribeToAuctionChat({
    required int adId,
    required int toUserId,
    required int userId,
  });

  Stream<Message> listenToAuctionChat();

  Future<Either<Failure, Unit>> subscribeToNotification({
    required int userId,
  });
  Stream<Notificatiion> listenToNotification();

  Future<Either<Failure, Unit>> subscribeToServiceNotifications({
    required String serviceType,
  });
  Stream<Notificatiion> listenToServiceNotifications();
}
 */