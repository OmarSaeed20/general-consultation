import '/index.dart';

class AccountState extends Equatable {
  const AccountState({
    this.error = "",
    this.rx = RequestState.none,
  });
  final String error;
  final RequestState rx;

  AccountState copyWith({
    String? error,
    RequestState? rx,
  }) =>
      AccountState(
        error: error ?? this.error,
        rx: rx ?? this.rx,
      );

  @override
  List<Object?> get props => [error, rx];
}
