import '/index.dart';
import 'package:flutter/cupertino.dart';

class LoginState extends Equatable {
  const LoginState({
    this.phone = "",
    this.codeCountry = "+965",
    this.password = "",
    this.isPassword = true,
    this.isCorrectPhone = false,
    // this.phoneNumber,
    this.suffixIcon = CupertinoIcons.eye,
    this.formKey,
    this.rx = RequestState.none,
  });
  final String phone, codeCountry, password;
  final bool isPassword, isCorrectPhone;
  // // final PhoneNumber? phoneNumber;
  final IconData suffixIcon;
  final GlobalKey<FormState>? formKey;
  final RequestState rx;

  LoginState copyWith({
    String? phone,
    String? codeCountry,
    String? password,
    bool? isPassword,
    bool? isCorrectPhone,
    // // PhoneNumber? phoneNumber,
    IconData? suffixIcon,
    GlobalKey<FormState>? formKey,
    RequestState? rx,
  }) =>
      LoginState(
        phone: phone ?? this.phone,
        codeCountry: codeCountry ?? this.codeCountry,
        password: password ?? this.password,
        isPassword: isPassword ?? this.isPassword,
        isCorrectPhone: isCorrectPhone ?? this.isCorrectPhone,
        // // // phoneNumber: phoneNumber ?? this.phoneNumber,
        suffixIcon: suffixIcon ?? this.suffixIcon,
        formKey: formKey ?? this.formKey,
        rx: rx ?? this.rx,
      );
  @override
  List<Object?> get props => [
        phone,
        codeCountry,
        password,
        isPassword,
        isCorrectPhone,
        // phoneNumber,
        suffixIcon,
        formKey,
        rx,
      ];
}
