import '/index.dart';

abstract class EmailAddressController extends GetxController {
  void onChangedEmail({required String value});
  Future<void> setEmailAddress();
}

class PhoneForgetControllerImp extends EmailAddressController {
  PhoneForgetControllerImp({required this.emailAddressUseCase});
  final EmailAddressUseCase emailAddressUseCase;
  @override
  void onChangedEmail({required String value}) {
    state(state.value.copyWith(email: value));
  }

  final Rx<EmailAddressState> state = const EmailAddressState().obs;

  @override
  Future<void> setEmailAddress() async {
    if (state.value.formKey!.currentState!.validate() == false) {
      return;
    }
    state(state.value.copyWith(rx: RequestState.loading));

    ApiResult<AuthenticationModel> result = await emailAddressUseCase(
      ForgotPasswordParameter(email: state.value.email),
    );

    result.when(
      failure: (e) => state(state.value.copyWith(rx: handleRxError(e))),
      success: (result) {
        state(state.value.copyWith(rx: RequestState.success));
        Get.toNamed(Routes.verifyEmailAddressPage(state.value.email));
      },
    );
  }

  @override
  void onInit() {
    super.onInit();
    state(state.value.copyWith(formKey: GlobalKey<FormState>()));
  }

  @override
  void dispose() {
    super.dispose();
    // ignore: invalid_use_of_protected_member
    state.value.formKey?.currentState?.dispose();
  }
}
