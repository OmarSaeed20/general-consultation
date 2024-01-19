import '/index.dart';
import 'choose_language_state.dart';

abstract class ChooseLanguageController extends GetxController {
  onSelectLang({required String lang});
  changeLanguage();
}

class ChooseLanguageControllerImp extends ChooseLanguageController {
  ChooseLanguageControllerImp(this.preferences, this.changeLangUseCase);
  final AppPreferences preferences;
  final ChangeLangUseCase changeLangUseCase;

  final Rx<ChooseLanguageState> state = const ChooseLanguageState().obs;

  @override
  onSelectLang({required String lang}) => switch (lang) {
        (Keys.ar || Keys.en) => {
            state(state.value.copyWith(lang: lang)),
            Get.updateLocale(Locale(lang)),
          },
        _ => toast("soon".tr),
      };

  @override
  changeLanguage() async {
    if (state.value.lang == preferences.getLang) return;
    state(state.value.copyWith(rx: RequestState.loading));
    ApiResult<BaseResponse> result = await changeLangUseCase(
      LangOnlyParameter(lang: state.value.lang),
    );

    result.when(
      success: (user) async {
        await preferences.setLang(state.value.lang).then(
              (_) async => {
                if (Get.previousRoute == Routes.main)
                  {
                    await HomeControllerImp.to.getHome(),
                    Get.back(),
                  },
                state(state.value.copyWith(rx: RequestState.success)),
              },
            );
      },
      failure: (e) => state(state.value.copyWith(rx: handleRxError(e))),
    );
  }

  selectLangFrist() async {
    state(state.value.copyWith(rx: RequestState.loading));
    await preferences.setLang(state.value.lang).then(
          (_) async => {
            if (Get.previousRoute != Routes.main) {Get.toNamed(Routes.login)},
            state(state.value.copyWith(rx: RequestState.success)),
          },
        );
  }

  noAction() => switch (Get.previousRoute) {
        Routes.main => Get.back(),
        _ => Get.toNamed(Routes.login),
      };
  @override
  void onInit() {
    state(state.value.copyWith(lang: preferences.getLang));
    super.onInit();
  }
}
