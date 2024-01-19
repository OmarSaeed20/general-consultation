/* import 'package:dartz/dartz.dart';

import '../../../../../core/errors/failures.dart';
import '../repositories/base_pusher_repository.dart';

class SubscribeToServiceNotificationsUseCase {
  final BasePusherRepository basePusherRepository;

  SubscribeToServiceNotificationsUseCase({
    required this.basePusherRepository,
  });

  Future<Either<Failure, Unit>> call({
    required String serviceType,
  }) async {
    return await basePusherRepository.subscribeToServiceNotifications(
      serviceType: serviceType,
    );
  }
}
 */