/* import 'package:dartz/dartz.dart';

import '../../../../../core/errors/failures.dart';
import '../repositories/base_pusher_repository.dart';

class SubscribeChatUseCase {
  final BasePusherRepository basePusherRepository;

  SubscribeChatUseCase({
    required this.basePusherRepository,
  });

  Future<Either<Failure, Unit>> call({
    required int orderId,
    required int toUserId,
    required int userId,
  }) async {
    return await basePusherRepository.subscribeToChat(
      orderId: orderId,
      toUserId: toUserId,
      userId: userId,
    );
  }
}
 */