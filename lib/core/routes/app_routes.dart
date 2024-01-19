part of 'app_pages.dart';
// DO NOT EDIT. This is code generated via package:get_cli/get_cli.dart

abstract class Routes {
  Routes._();
  static const String init = '/';
  static const String choseLanguage = '/chose_language';

  static String verifyCodePage(String phone) =>
      '${Routes.verifyCode}?phone=$phone';
  static String verifyEmailAddressPage(String email) =>
      '${Routes.verifyForgetPass}?email=$email';
  static String resetPasswordPage(String email, String code) =>
      '${Routes.resetForgetPass}?email=$email&code=$code';
/* 
VendorEntity.fromJson(
      jsonDecode(Get.parameters["vendor"].toString()),
    )
 */
  static void serviceDetailsPage(VendorEntity vendor) =>
      Get.toNamed(serviceDetails, arguments: {
        "vendor": vendor,
        "name": vendor.name,
        "address": vendor.locationText,
        "location": LatLng(
          double.parse(vendor.locationLat!),
          double.parse(vendor.locationLong!),
        ),
      });

  static void chatPage(VendorEntity vendor) => Get.toNamed(
        chat,
        arguments: {
          "vendor_id": vendor.id,
          "vendor_image": vendor.image,
          "vendor_name": vendor.name,
        },
      );
  // '${Routes.serviceDetails}?vendor=${jsonEncode(vendor)}';
  static const String login = '/login';
  static const String register = '/register';
  static const String verifyCode = '/verify_code';

  static const String forgotPassword = '/forgot_password';
  static const String verifyForgetPass = '/verify_forgetPass';
  static const String resetForgetPass = '/reset_forgetPass';

  static const String main = '/main';
  // static const String home = '/home';
  // static const String vip = '/vip';
  static const String serviceCategories = '/service_categories';
  static const String serviceDetails = '/service_details';
  static const String chat = '/chat';
  static const String allChats = '/all_chats';

  static const String changePassword = '/change_password';
  static const String profile = '/profile';
  static const String filter = '/filter';
  static const String aboutUsView = '/about_us';

  static const String createAds = '/create_ads';
  static const String myAllAds = '/my_all_ads';
  static const String editMyAds = '/edit_ads';

  static const String customerInquiriesView = '/customer_inquiries';
  static const String contactUsView = '/contact_us';

  static const String mapView = '/map_view';

  static const String notifications = '/notifications';
  static const String privacy = '/privacy';
  static const String terms = '/terms';
}
