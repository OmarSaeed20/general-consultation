import 'package:flutter/cupertino.dart';
import '/index.dart';

class ResetPasswordState extends Equatable {
  const ResetPasswordState({
    this.email = "",
    this.code = "",
    this.password = '',
    this.passwordConfirm = '',
    this.isPassword = false,
    this.isPasswordConfirm = false,
    this.suffixIcon = CupertinoIcons.eye,
    this.suffixIconConfirm = CupertinoIcons.eye,
    this.formKey,
    this.rx = RequestState.none,
  });
  final String email, code, password, passwordConfirm;
  final bool isPassword, isPasswordConfirm;
  final IconData suffixIcon, suffixIconConfirm;
  final GlobalKey<FormState>? formKey;
  final RequestState rx;

  ResetPasswordState copyWith({
    String? email,
    String? code,
    String? password,
    String? passwordConfirm,
    bool? isPassword,
    bool? isPasswordConfirm,
    IconData? suffixIcon,
    IconData? suffixIconConfirm,
    GlobalKey<FormState>? formKey,
    RequestState? requestState,
  }) =>
      ResetPasswordState(
        email: email ?? this.email,
        code: code ?? this.code,
        password: password ?? this.password,
        passwordConfirm: passwordConfirm ?? this.passwordConfirm,
        isPassword: isPassword ?? this.isPassword,
        isPasswordConfirm: isPasswordConfirm ?? this.isPasswordConfirm,
        suffixIcon: suffixIcon ?? this.suffixIcon,
        suffixIconConfirm: suffixIconConfirm ?? this.suffixIconConfirm,
        formKey: formKey ?? this.formKey,
        rx: requestState ?? rx,
      );
  @override
  List<Object?> get props => [
        email,
        code,
        password,
        passwordConfirm,
        isPassword,
        isPasswordConfirm,
        suffixIcon,
        suffixIconConfirm,
        formKey,
        rx,
      ];
}
