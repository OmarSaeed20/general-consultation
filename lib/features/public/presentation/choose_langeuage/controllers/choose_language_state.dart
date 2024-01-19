import '/index.dart';

class ChooseLanguageState extends Equatable {
  const ChooseLanguageState({
    this.lang = Keys.ar,
    this.rx = RequestState.none,
  });
  final String lang;
  final RequestState rx;

  ChooseLanguageState copyWith({String? lang, RequestState? rx}) =>
      ChooseLanguageState(lang: lang ?? this.lang, rx: rx ?? this.rx);

  @override
  List<Object?> get props => [lang, rx];
}
