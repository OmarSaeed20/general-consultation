import '/index.dart';

import 'contact_us_state.dart';

abstract class ContactUsController extends GetxController {
  // void onChangedEmail(String email);
  // void onChangedContent(String content);
  Future<void> sendContactUs();
}

class ContactUsControllerImp extends ContactUsController {
  ContactUsControllerImp({required this.contactUsUseCase});
  final ContactUsUseCase contactUsUseCase;

  final Rx<ContactUsState> state = ContactUsState(
    content: TextEditingController().obs,
    form: GlobalKey<FormState>(),
  ).obs;
  /* @override
  void onChangedEmail(String email) {
    state(state.value.copyWith(email: email));
    //debugPrint("phone ==> ${state.value.email}");
  } 

  @override
  void onChangedContent(String content) => state(
      state.value.copyWith(content: TextEditingController(text: content))
      );
*/
  @override
  Future<void> sendContactUs() async {
    if (!state.value.form.currentState!.validate()) return;
    state(state.value.copyWith(rx: handleRxLoading()));
    var result = await contactUsUseCase(
      ContactUsParameter(content: state.value.content.value.text),
    );
    result.when(
      failure: (e) => state(state.value.copyWith(rx: handleRxError(e))),
      success: (user) async {
        state.value.content.value.text = "";
        toast(user.message);
        state(state.value.copyWith(rx: RequestState.success));
      },
    );
  }
}
