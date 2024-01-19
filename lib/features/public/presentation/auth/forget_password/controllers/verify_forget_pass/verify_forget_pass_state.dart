import 'dart:async';

import '/index.dart';

class VerifyEmailState extends Equatable {
  final GlobalKey<FormState>? formKey;
  final String code;
  final String email;
  final RequestState rx;
  final RequestState rxResendCode;
  final Timer? timer;
  final int timeCounter;
  final StreamController<ErrorAnimationType>? errorAnimationType;

  const VerifyEmailState({
    this.formKey,
    this.code = '',
    this.email = '',
    this.rx = RequestState.none,
    this.rxResendCode = RequestState.none,
    this.timeCounter = 60,
    this.timer,
    this.errorAnimationType,
  });

  VerifyEmailState copyWith({
    GlobalKey<FormState>? formKey,
    String? code,
    String? email,
    RequestState? requestState,
    RequestState? rxResendCode,
    Timer? timer,
    int? timeCounter,
    StreamController<ErrorAnimationType>? errorAnimationType,
  }) =>
      VerifyEmailState(
        formKey: formKey ?? this.formKey,
        code: code ?? this.code,
        email: email ?? this.email,
        rx: requestState ?? rx,
        rxResendCode: rxResendCode ?? this.rxResendCode,
        timer: timer ?? this.timer,
        timeCounter: timeCounter ?? this.timeCounter,
        errorAnimationType: errorAnimationType ?? this.errorAnimationType,
      );
  @override
  List<Object?> get props => [
        formKey,
        code,
        email,
        rx,
        rxResendCode,
        timer,
        timeCounter,
        errorAnimationType,
      ];
}
