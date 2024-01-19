import '/index.dart';

class ToastManager {
  /// SUCCESS NOTIFICATION
  static showSuccess(String message) {
    if (Get.isSnackbarOpen) {
      Get.closeAllSnackbars();
    }
    Get.rawSnackbar(
      message: message.tr,
      barBlur: 5,
      maxWidth: Get.width - 32,
      borderRadius: 10,
      snackPosition: SnackPosition.TOP,
      backgroundColor: Colors.green.withOpacity(0.7),
      padding: gPaddingSymmetric(horizontal: 32, vertical: 16),
    );
  }

  /// ERROR NOTIFICATION
  static showError(String message) {
    if (Get.isSnackbarOpen) {
      Get.closeAllSnackbars();
    }
    Get.rawSnackbar(
      message: message,
      barBlur: 5,
      maxWidth: Get.width - 32,
      borderRadius: 10,
      snackPosition: SnackPosition.TOP,
      backgroundColor: Colors.red.withOpacity(0.7),
      padding: gPaddingSymmetric(horizontal: 32, vertical: 16),
    );
  }
}
