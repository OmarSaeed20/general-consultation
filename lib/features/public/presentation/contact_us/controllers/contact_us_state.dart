import '/index.dart';

class ContactUsState extends Equatable {
  const ContactUsState({
    required this.content,
    required this.form,
    this.rx = RequestState.none,
  });
  final Rx<TextEditingController> content;
  final RequestState rx;
  final GlobalKey<FormState> form;

  ContactUsState copyWith({
    Rx<TextEditingController>? content,
    RequestState? rx,
    GlobalKey<FormState> ?form,
  }) =>
      ContactUsState(
        form: form ?? this.form,
        content: content ?? this.content,
        rx: rx ?? this.rx,
      );
  @override
  List<Object?> get props => [form,content, rx];
}
