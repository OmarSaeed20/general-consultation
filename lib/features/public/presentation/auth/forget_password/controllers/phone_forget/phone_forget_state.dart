import '/index.dart';

class EmailAddressState extends Equatable {
  const EmailAddressState({
    this.email = "",
    this.formKey,
    this.rx = RequestState.none,
  });
  final String email;
  final GlobalKey<FormState>? formKey;
  final RequestState rx;

  EmailAddressState copyWith({
    String? email,
    GlobalKey<FormState>? formKey,
    RequestState? rx,
  }) =>
      EmailAddressState(
        email: email ?? this.email,
        formKey: formKey ?? this.formKey,
        rx: rx ?? this.rx,
      );
  @override
  List<Object?> get props => [
        email,
        formKey,
        rx,
      ];
}
