/* import 'package:dartz/dartz.dart';

import '../../../../../core/errors/failures.dart';
import '../repositories/base_pusher_repository.dart';

class UnsubscribeServiceNotificationsUseCase {
  final BasePusherRepository basePusherRepository;

  UnsubscribeServiceNotificationsUseCase({
    required this.basePusherRepository,
  });

  Future<Either<Failure, Unit>> call({
    required String serviceType,
  }) async {
    return await basePusherRepository.unsubscribeToServiceNotifications(
      serviceType: serviceType,
    );
  }
}
 */