import 'package:flutter/cupertino.dart';
import '/index.dart';

class ChangePassState extends Equatable {
  const ChangePassState({
    required this.oldPass,
    required this.password,
    required this.passwordConfirm,
    this.isOldPassword = false,
    this.isPassword = false,
    this.isPasswordConfirm = false,
    this.suffixIconOld = CupertinoIcons.eye,
    this.suffixIcon = CupertinoIcons.eye,
    this.suffixIconConfirm = CupertinoIcons.eye,
    required this.formKey,
    this.rx = RequestState.none,
  });
  final Rx<TextEditingController> oldPass, password, passwordConfirm;
  final bool isOldPassword, isPassword, isPasswordConfirm;
  final IconData suffixIconOld, suffixIcon, suffixIconConfirm;
  final GlobalKey<FormState> formKey;
  final RequestState rx;

  ChangePassState copyWith({
    Rx<TextEditingController>? oldPass,
    Rx<TextEditingController>? password,
    Rx<TextEditingController>? passwordConfirm,
    bool? isOldPassword,
    bool? isPassword,
    bool? isPasswordConfirm,
    IconData? suffixIconOld,
    IconData? suffixIcon,
    IconData? suffixIconConfirm,
    GlobalKey<FormState>? formKey,
    RequestState? rx,
  }) =>
      ChangePassState(
        oldPass: oldPass ?? this.oldPass,
        password: password ?? this.password,
        passwordConfirm: passwordConfirm ?? this.passwordConfirm,
        isOldPassword: isOldPassword ?? this.isOldPassword,
        isPassword: isPassword ?? this.isPassword,
        isPasswordConfirm: isPasswordConfirm ?? this.isPasswordConfirm,
        suffixIconOld: suffixIconOld ?? this.suffixIconOld,
        suffixIcon: suffixIcon ?? this.suffixIcon,
        suffixIconConfirm: suffixIconConfirm ?? this.suffixIconConfirm,
        formKey: formKey ?? this.formKey,
        rx: rx ?? this.rx,
      );
  @override
  List<Object?> get props => [
        oldPass,
        suffixIconOld,
        password,
        passwordConfirm,
        isOldPassword,
        isPassword,
        isPasswordConfirm,
        suffixIcon,
        suffixIconConfirm,
        formKey,
        rx,
      ];
}
