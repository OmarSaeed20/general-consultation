/* import 'package:dartz/dartz.dart';

import '../../../../../core/errors/failures.dart';
import '../repositories/base_pusher_repository.dart';

class UnsubscribeChatUseCase {
  final BasePusherRepository basePusherRepository;

  UnsubscribeChatUseCase({
    required this.basePusherRepository,
  });

  Future<Either<Failure, Unit>> call({
    required int orderId,
    required int vendorId,
    required int userId,
  }) async {
    return await basePusherRepository.unsubscribeToChat(
      orderId: orderId,
      vendorId: vendorId,
      userId: userId,
    );
  }
}
 */