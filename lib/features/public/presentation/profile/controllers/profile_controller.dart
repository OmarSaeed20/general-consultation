import '/features/public/presentation/profile/controllers/profile_state.dart';

import '/index.dart';
import 'dart:io';

abstract class ProfileController extends GetxController {
  void onChangedPhone({String? phone, String? codeCountry});
  void isCheckPhoneValidOrNot({required bool value});
  initData(AuthenticationEntity? user);
  Future<void> pickPicture();
  deletePicture();
  Future<void> updateProfile();
}

class ProfileControllerImp extends ProfileController {
  UpdateProfileUseCase updateProfileUseCase;
  ProfileControllerImp({required this.updateProfileUseCase});

  final Rx<ProfileState> state = ProfileState(
    userdata: UserServiceImp.to.currentUser.value,
    name: TextEditingController(),
    phoneController: TextEditingController(),
    email: TextEditingController(),
    formKey: GlobalKey<FormState>(),
  ).obs;

  @override
  Future<void> pickPicture() async {
    File? resultImg = await Utils.pickPicture();
    if (resultImg != null) {
      state(state.value.copyWith(selectedImage: resultImg.obs));
    }
  }

  @override
  void isCheckPhoneValidOrNot({required bool value}) =>
      state(state.value.copyWith(isCorrectPhone: value));

  @override
  void deletePicture() => state(state.value.copyWith(selectedImage: null.obs));

  @override
  void onChangedPhone({String? phone, String? codeCountry}) {
    state(state.value.copyWith(phone: phone, codeCountry: codeCountry));
    //debugPrint(
    // "phone ==> ${state.value.phone} , code country ==> ${state.value.codeCountry}",
    // )
  }

  @override
  Future<void> updateProfile() async {
    if (state.value.formKey.currentState?.validate() == false) {
      return;
    }
    state(state.value.copyWith(rx: RequestState.loading));
    var data = UpdateProfileParameter(
      codeCountry: state.value.codeCountry,
      image: state.value.selectedImage?.value,
      name: state.value.name.text,
      phone: state.value.phone.replaceAll(state.value.codeCountry, ""),
    );
    final result = await updateProfileUseCase(data);

    result.when(failure: (e) async {
      state(state.value.copyWith(rx: handleRxError(e)));
    }, success: (user) {
      initData(user.data);
      UserServiceImp.to.currentUser.value = user.data;

      state(
        state.value.copyWith(rx: RequestState.success, userdata: user.data),
      );
      ToastManager.showSuccess(user.message);
    });
  }

  @override
  initData(AuthenticationEntity? user) {
    state(
      state.value.copyWith(
        name: user?.name,
        email: user?.email,
        phone: user?.phone,
        selectedImage: null.obs,
        codeCountry: user?.codeCountry,
        phoneContr: user?.phone,
        // phoneNumber: PhoneNumber(
        //   phoneNumber: user?.phone,
        //   dialCode: user?.codeCountry,
        //   isoCode: "EG",
        // ),
      ),
    );
  }

  @override
  void onInit() {
    if (UserServiceImp.to.currentUser.value == null) {
      UserServiceImp.to.getUser();
    }
    initData(UserServiceImp.to.currentUser.value);
    super.onInit();
  }
}
