import 'package:google_maps_flutter/google_maps_flutter.dart';

import '/index.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static final routes = [
    GetPage(
      name: Routes.init,
      page: () => const SplashView(),
      binding: SplashBinding(),
      transition: Transition.native,
    ),
    GetPage(
      name: Routes.choseLanguage,
      page: () => const ChooseLanguageView(),
      binding: ChooseLanguageBinding(),
      transition: Transition.native,
    ),
    GetPage(
      name: Routes.login,
      page: () => const LoginView(),
      binding: LoginBinding(),
      transition: Transition.native,
    ),
    GetPage(
      name: Routes.register,
      page: () => const RegisterView(),
      binding: RegisterBinding(),
      transition: Transition.native,
    ),
    GetPage(
      name: Routes.verifyCode,
      page: () => const VerifyCodeView(),
      binding: VerifyCodeBinding(),
      transition: Transition.native,
    ),
    GetPage(
      name: Routes.forgotPassword,
      page: () => const ForgetPasswordView(),
      binding: ForgetPasswordBinding(),
      transition: Transition.native,
    ),
    GetPage(
      name: Routes.verifyForgetPass,
      page: () => const VerifyForgetPassView(),
      binding: VerifyForgetPassBinding(),
      transition: Transition.native,
    ),
    GetPage(
      name: Routes.resetForgetPass,
      page: () => const ResetForgetPassView(),
      binding: ResetForgetPassBinding(),
      transition: Transition.native,
    ),
    /* GetPage(
      name: Routes.home,
      page: () => const HomeView(),
      // binding: HomeBinding(),
      transition: Transition.native,
    ), */
    GetPage(
      name: Routes.filter,
      page: () => const FilterView(),
      binding: FilterBinding(),
      transition: Transition.native,
    ),
    GetPage(
      name: Routes.main,
      page: () => const MainView(),
      bindings: [MainBinding(), NotificationsBinding()],
      transition: Transition.native,
    ),
    /* GetPage(
      name: Routes.vip,
      page: () => const VipView(),
      binding: VipBinding(),
      transition: Transition.native,
    ), */
    GetPage(
      name: Routes.serviceCategories,
      page: () => const ServiceCategoriesView(),
      binding: ServiceCategoriesBinding(),
      transition: Transition.native,
    ),
    GetPage(
      name: Routes.serviceDetails,
      page: () => const ServiceDetailsView(),
      bindings: [ServiceDetailsBinding(), MapBinding()],
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: Routes.chat,
      page: () => const ChatView(),
      binding: ChatBinding(),
      transition: Transition.downToUp,
    ),
    /*  GetPage(
      name: Routes.allChats,
      page: () => const AllChatsView(),
      binding: AllChatsBinding(),
      transition: Transition.native,
    ), */
    GetPage(
      name: Routes.changePassword,
      page: () => const ChangePassView(),
      binding: ChangePassBinding(),
      transition: Transition.native,
    ),
    GetPage(
      name: Routes.profile,
      page: () => const ProfileView(),
      binding: ProfileBinding(),
      transition: Transition.native,
    ),
    GetPage(
      name: Routes.customerInquiriesView,
      page: () => const CustomerInquiriesView(),
      binding: CustomerInquiriesBinding(),
      transition: Transition.native,
    ),
    GetPage(
      name: Routes.contactUsView,
      page: () => const ContactUsView(),
      binding: ContactUsBinding(),
      transition: Transition.native,
    ),
    GetPage(
      name: Routes.mapView,
      page: () => const MapView(),
      binding: MapBinding(),
      transition: Transition.native,
    ),
    GetPage(
      name: Routes.createAds,
      page: () => const CreateAdsView(),
      binding: CreateAdsBinding(),
      transition: Transition.native,
    ),
    GetPage(
      name: Routes.myAllAds,
      page: () => const MyAdvertisementsView(),
      // binding:  MyAdvertisementsBinding(),
      bindings: [
        MyAdvertisementsBinding(),
        VideoBinding(),
        NotificationsBinding(),
      ],
      transition: Transition.native,
    ),
    GetPage(
      name: Routes.notifications,
      page: () => const NotificationsView(),
      binding: NotificationsBinding(),
      transition: Transition.native,
    ),
    GetPage(
      name: Routes.aboutUsView,
      page: () => const AboutUsView(),
      binding: AboutUsBinding(),
      transition: Transition.native,
    ),
    GetPage(
      name: Routes.privacy,
      page: () => const PrivacyView(),
      binding: AboutUsBinding(),
      transition: Transition.native,
    ),
    GetPage(
      name: Routes.terms,
      page: () => const TermsView(),
      binding: AboutUsBinding(),
      transition: Transition.native,
    ),
  ];
}
