import '/features/main/presentation/account/controllers/account_state.dart';
import '/index.dart';

abstract class AccountController extends GetxController {
  Future<void> logout();
  Future<void> deleteAccount();
}

class AccountControllerImp extends AccountController {
  AccountControllerImp({
    required this.deleteAccountUseCase,
    required this.logOutUseCase,
  });
  final DeleteAccountUseCase deleteAccountUseCase;
  final LogOutUseCase logOutUseCase;

  final Rx<AccountState> state = const AccountState().obs;

  @override
  logout() async {
    state(state.value.copyWith(rx: RequestState.loading));
    var result = await logOutUseCase();
    result.when(
      success: (data) {
        state(state.value.copyWith(rx: RequestState.success));
        Get.find<AppPreferences>().logout();
        Get.offNamedUntil(Routes.login, (route) => false);
      },
      failure: (e) {
        state(state.value.copyWith(
          rx: handleRxError(e),
          error: NetworkExceptions.getErrorMessage(e),
        ));
      },
    );
  }

  @override
  deleteAccount() async {
    state(state.value.copyWith(rx: RequestState.loading));
    var result = await deleteAccountUseCase();
    result.when(
      success: (data) => state(state.value.copyWith(rx: RequestState.success)),
      failure: (e) {
        state(state.value.copyWith(
          rx: handleRxError(e),
          error: NetworkExceptions.getErrorMessage(e),
        ));
      },
    );
  }
}
