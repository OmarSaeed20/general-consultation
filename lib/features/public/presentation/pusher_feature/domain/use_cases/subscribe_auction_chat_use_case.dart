/* import 'package:dartz/dartz.dart';

import '../../../../../core/errors/failures.dart';
import '../repositories/base_pusher_repository.dart';

class SubscribeAuctionChatUseCase {
  final BasePusherRepository basePusherRepository;

  SubscribeAuctionChatUseCase({
    required this.basePusherRepository,
  });

  Future<Either<Failure, Unit>> call({
    required int adId,
    required int toUserId,
    required int userId,
  }) async {
    return await basePusherRepository.subscribeToAuctionChat(
      adId: adId,
      toUserId: toUserId,
      userId: userId,
    );
  }
}
 */