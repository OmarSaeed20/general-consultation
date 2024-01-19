import 'package:flutter/cupertino.dart';
import '/features/public/presentation/change_password/controllers/change_pass_state.dart';
import '/index.dart';

abstract class ChangePassController extends GetxController {
  void toggleObscureOld();
  void toggleObscure();
  void toggleObscureConfirm();
  Future<void> changePassword();
}

class ChangePassControllerImp extends ChangePassController {
  final UpdatePasswordUsecase updatePasswordUsecase;
  ChangePassControllerImp({required this.updatePasswordUsecase});

  final Rx<ChangePassState> state = ChangePassState(
    oldPass: TextEditingController().obs,
    password: TextEditingController().obs,
    passwordConfirm: TextEditingController().obs,
    formKey: GlobalKey<FormState>(),
  ).obs;
  @override
  void toggleObscureOld() {
    state(
      state.value.copyWith(
        isOldPassword: !state.value.isOldPassword,
        suffixIconOld: state.value.isOldPassword
            ? CupertinoIcons.eye
            : CupertinoIcons.eye_slash,
      ),
    );
  }

  @override
  void toggleObscure() {
    state(
      state.value.copyWith(
        isPassword: !state.value.isPassword,
        suffixIcon: state.value.isPassword
            ? CupertinoIcons.eye
            : CupertinoIcons.eye_slash,
      ),
    );
  }

  @override
  void toggleObscureConfirm() {
    state(
      state.value.copyWith(
        isPasswordConfirm: !state.value.isPasswordConfirm,
        suffixIconConfirm: state.value.isPasswordConfirm
            ? CupertinoIcons.eye
            : CupertinoIcons.eye_slash,
      ),
    );
  }

  @override
  Future<void> changePassword() async {
    if (!state.value.formKey.currentState!.validate()) {
      return;
    }

    state(state.value.copyWith(rx: RequestState.loading));

    var result = await updatePasswordUsecase(ForgotPasswordParameter(
      oldpassword: state.value.oldPass.value.text,
      password: state.value.password.value.text,
    ));

    result.when(failure: (e) {
      state(state.value.copyWith(rx: handleRxError(e)));
      ToastManager.showError(NetworkExceptions.getErrorMessage(e));
    }, success: (result) {
      state(
        state.value.copyWith(
          rx: RequestState.success,
          oldPass: TextEditingController(text: "").obs,
          password: TextEditingController(text: "").obs,
          passwordConfirm: TextEditingController(text: "").obs,
          formKey: GlobalKey<FormState>(),
        ),
      );
      ToastManager.showSuccess(result.message);
    });
  }
}
