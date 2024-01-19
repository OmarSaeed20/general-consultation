class EndPoints {
  static const String baseUrl = "https://consult.codeella.com/api/";
  static const String home = "customer/home";
  static const String allVendors = "customer/vendors";
  static const String vendorDetailes = "customer/vendors";
  static const String vendorRates = "customer/vendors/rates/{id}";
  static const String addVendorRates = "customer/vendors/rates/add";
  // static String rateVendor(int id) => "customer/vendors/$id";
  // static String addRateVendor(int id) => "customer/vendors/$id";

  static const String login = "public/login";
  static const String register = "public/register";
  static const String verifyCode = "public/checkcode";
  static const String resendCode = "public/resend";
  static const String sendCode = "public/password/reset/send-code";
  static const String phoneOrEmail = "public/password/reset/check-single-code";
  static const String resetPassword = "public/password/reset/check-code";
  static const String logout = "public/logout";

  static const String getUserData = "public/user-auth-data";
  static const String deleteAccount = "public/profile/delete";
  static const String updatePassword = "public/profile/update/password";
  static const String updateProfile = "public/profile/update";
  static const String changeLang = "public/profile/change-lang";
  static const String contactUs = "public/contact-us";

  static const String customerInquiries = "customer/inquiry";

  static const String chatsList = "customer/chats/list";
  static const String sendMessage = "customer/chats/send";
  static const String message = "customer/chats/{id}";
  static const String pusherAppId = "1663240";
  static const String pusherAppKey = "4dd2a6a07fb367cec1cf";
  static const String pusherCluster = "eu";
  static String getChatChannel({required int chatId}) => "chat-$chatId";

  static const String allAds = "customer/ads";
  static const String blockAds = "customer/ads/block/{id}";

  static const String allMyAds = "customer/ads/my-ads";
  static const String createAds = "customer/ads/create";
  static const String editAds = "customer/ads/edit/{id}";
  static const String deleteAds = "customer/ads/delete/{id}";

  static const String country = "/public/data/countries";
  static const String city = "/public/data/cities/{id}";
  static const String allCategories = "public/data/categories";

  static const String supCategories = "public/data/sub-categories/{id}";

  static const String aboutUsData = 'public/data/abouts';

  static const String notifications = "public/notifications";
  static const String blockNotifications = "public/notifications/block-unblock";
  static const String countUnreadNotifications = "public/notifications/count-unread";
}
