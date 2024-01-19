/* import 'package:dartz/dartz.dart';

import '../../../../../core/errors/failures.dart';
import '../repositories/base_pusher_repository.dart';

class SubscribeNotificationUseCase {
  final BasePusherRepository basePusherRepository;

  SubscribeNotificationUseCase({
    required this.basePusherRepository,
  });

  Future<Either<Failure, Unit>> call({
    required int userId,
  }) async {
    return await basePusherRepository.subscribeToNotification(
      userId: userId,
    );
  }
}
 */