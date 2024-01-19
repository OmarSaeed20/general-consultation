// ignore: file_names
import 'dart:io';
import 'dart:ui';

import '/index.dart';

class Utils {
  Utils._();

  static List<String> videoExtensions = [
    'mp4',
    'mkv',
    'avi',
    'mov',
    'flv',
    'webm',
    "3g2",
    "3gp",
    "aaf",
    'asf',
    'm4v',
    'mpeg',
    'mpg',
    'ogv',
    'wmv',
    'gif',
    'avchd',
    'vob',
    'ogg',
    'qt',
    'mts',
  ];
  static isValiedVideo(String? path) {
    if (path.isEmptyOrNul) return false;
    for (var extension in videoExtensions) {
      if (path!.toLowerCase().endsWith('.$extension')) return true;
    }
    return false;
  }

  static String? inputValidator(
    String value, {
    Type type = Type.text,
    bool isCorrectPhone = false,
    String val = '',
  }) {
    if (type == Type.username) {
      if (value.trim().isEmpty) {
        return 'The field is required.'.tr;
      } /* else if (!RegExp(r'^[a-zA-Z0-9_]+$').hasMatch(value)) {
        return 'The username can only contain letters, numbers, and underscores.'
            .tr;
      } */
    }
    if (type == Type.email) {
      if (value.trim().isEmpty) {
        return 'The field is required.'.tr;
      } else if (!RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$')
          .hasMatch(value)) {
        return 'The email is not valid.'.tr;
      }
    }
    if (type == Type.phone) {
      if (value.trim().isEmpty) {
        return 'The field is required.'.tr;
      }
      /* else if (isCorrectPhone == false) {
        return 'The phone number is not valid.'.tr;
      } */
    }

    if (type == Type.password) {
      if (value.trim().isEmpty) {
        return 'The field is required.'.tr;
      } else if (value.length < 8) {
        return 'Password must be at least 8 characters.'.tr;
      } /* else if (!RegExp(r'^(?=.[a-z])(?=.[A-Z])(?=.*\d).+$').hasMatch(value)) {
        return 'Password must contain at least one uppercase letter, one lowercase letter, and one digit.'
            .tr;
      } */
    }
    if (type == Type.passwordConfirm) {
      if (value.trim().isEmpty) {
        return 'The confirm password is required.'.tr;
      } else if (value != val) {
        return 'Passwords do not match.'.tr;
      }
    }

    if (value.trim().isEmpty) {
      return 'The field is required.'.tr;
    } else {
      return null;
    }
  }

  static Future<Uint8List> getBytesFromAsset(String path,
      {required int width, required int height}) async {
    ByteData data = await rootBundle.load(path);
    Codec codec = await instantiateImageCodec(data.buffer.asUint8List(),
        targetWidth: width, targetHeight: height);
    FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ImageByteFormat.png))!
        .buffer
        .asUint8List();
  }

  static String _generateAlpha({required int alpha, required bool withAlpha}) {
    if (withAlpha) {
      return alpha.toRadixString(16).padLeft(2, '0');
    } else {
      return '';
    }
  }

  static String toHex(
          {bool leadingHashSign = false,
          Color color = Colors.white,
          bool withAlpha = false}) =>
      '${leadingHashSign ? '#' : ''}'
              '${_generateAlpha(alpha: color.alpha, withAlpha: withAlpha)}'
              '${color.red.toRadixString(16).padLeft(2, '0')}'
              '${color.green.toRadixString(16).padLeft(2, '0')}'
              '${color.blue.toRadixString(16).padLeft(2, '0')}'
          .toUpperCase();

/*   static Future<void> openMap(double latitude, double longitude) async {
    String googleUrl =
        'https://www.google.com/maps/search/?api=1&query=$latitude,$longitude';
    if (!await launchUrl(Uri(path: googleUrl))) {
      throw "Could not launch $googleUrl";
    }
  } */
  static Future<void> openMap({
    required double lat,
    required double lng,
  }) async {
    if (await canLaunchUrl(getUri(lat, lng))) {
      await launchUrl(getUri(lat, lng));
    } else {
      throw "Could not launch ${getUri(lat, lng)}";
    }
  }

  static Uri getUri(double lat, double lng) =>
      Uri(scheme: 'geo', host: '0,0', queryParameters: {'q': '$lat,$lng'});
  static Future<void> makePhoneCall(String url) async {
    if (!await launchUrl(Uri(path: url))) throw 'Could not launch $url';
  }

  static Future<void> launchWhatsapp(String number) async {
    final url = "https://wa.me/$number?text=";
    if (!await launchUrl(Uri(path: url))) throw 'Could not launch $url';
  }

  // Method to pick picture
  static Future<File?> pickPicture() async {
    final ImagePicker picker = ImagePicker();

    bool? isCamera;
    await Get.dialog(Scaffold(
      backgroundColor: Colors.white.withOpacity(0.2),
      body: Center(
        child: Padding(
          padding: gPaddingSymmetric(horizontal: 24.0),
          child: Container(
            decoration:
                BoxDecoration(borderRadius: 12.radius, color: Colors.white),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ListTile(
                  leading: const Icon(
                    Icons.camera_alt_outlined,
                    color: KColors.primary,
                  ),
                  title: TextWidget('Camera'.tr),
                  onTap: () {
                    isCamera = true;
                    Get.back();
                  },
                ),
                const Divider(height: 1, thickness: 1),
                ListTile(
                  leading:
                      const Icon(Icons.image_outlined, color: KColors.primary),
                  title: TextWidget('Gallery'.tr),
                  onTap: () {
                    isCamera = false;
                    Get.back();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    ));
    if (isCamera == null) return null;
    final XFile? image = await picker.pickImage(
        source: isCamera! ? ImageSource.camera : ImageSource.gallery,
        imageQuality: 20);
    if (image != null) {
      return File(image.path);
    }
    return null;
  }

  static void showToast(
    String text, {
    Color? backgroundColor,
    Color? textColor,
    int? duration,
  }) =>
      Get.showSnackbar(
        GetSnackBar(
          maxWidth: Get.context!.size!.width - 50,
          // behavior: SnackBarBehavior.floating,
          duration: Duration(seconds: duration ?? 4),
          messageText: TextWidget(
            text,
            style: gStyle16(color: textColor ?? Colors.white),
          ),
          borderRadius: 10,
          backgroundColor: backgroundColor ?? Colors.green.withOpacity(0.7),
          padding: gPaddingSymmetric(horizontal: 32, vertical: 16),
        ),
      );

  static void showErrorToast(String text, {int? duration}) =>
      showToast(text, backgroundColor: Colors.red.withOpacity(0.7));

  static bool get isRTL {
    final bool isRTL = (Get.locale?.languageCode ?? 'ar') == 'ar';
    return isRTL;
  }

  static TextDirection getDirection(String text) {
    final string = text.trim();
    if (string.isEmpty) return TextDirection.ltr;
    final firstUnit = string.codeUnitAt(0);
    if (firstUnit > 0x0600 && firstUnit < 0x06FF ||
        firstUnit > 0x0750 && firstUnit < 0x077F ||
        firstUnit > 0x07C0 && firstUnit < 0x07EA ||
        firstUnit > 0x0840 && firstUnit < 0x085B ||
        firstUnit > 0x08A0 && firstUnit < 0x08B4 ||
        firstUnit > 0x08E3 && firstUnit < 0x08FF ||
        firstUnit > 0xFB50 && firstUnit < 0xFBB1 ||
        firstUnit > 0xFBD3 && firstUnit < 0xFD3D ||
        firstUnit > 0xFD50 && firstUnit < 0xFD8F ||
        firstUnit > 0xFD92 && firstUnit < 0xFDC7 ||
        firstUnit > 0xFDF0 && firstUnit < 0xFDFC ||
        firstUnit > 0xFE70 && firstUnit < 0xFE74 ||
        firstUnit > 0xFE76 && firstUnit < 0xFEFC ||
        firstUnit > 0x10800 && firstUnit < 0x10805 ||
        firstUnit > 0x1B000 && firstUnit < 0x1B0FF ||
        firstUnit > 0x1D165 && firstUnit < 0x1D169 ||
        firstUnit > 0x1D16D && firstUnit < 0x1D172 ||
        firstUnit > 0x1D17B && firstUnit < 0x1D182 ||
        firstUnit > 0x1D185 && firstUnit < 0x1D18B ||
        firstUnit > 0x1D1AA && firstUnit < 0x1D1AD ||
        firstUnit > 0x1D242 && firstUnit < 0x1D244) {
      return TextDirection.rtl;
    }
    return TextDirection.ltr;
  }

  static String getFileType(String link) {
    if (link.isURL) {
      if (link.contains('.document') || link.isDocumentFileName) {
        return 'docx';
      } else if (link.contains('.pdf') || link.isPDFFileName) {
        return 'pdf';
      } else if (link.contains('.m4a') || link.isAudioFileName) {
        return 'm4a';
      } else if (link.isVideoFileName) {
        return 'video';
      } else {
        return 'image';
      }
    } else {
      return 'string';
    }
  }

//   static void chooseColor(ValueChanged<Color?> onChangedColor,
//       {Color? initialColor}) {
//     Get.dialog(
//       AlertDialog(
//         title: Text(
//           LocaleKeys.pickColor.tr,
//           style: Get.textTheme.titleLarge!.copyWith(color: KColor.white),
//         ),
//         backgroundColor: KColor.primaryColor,
//         content: SingleChildScrollView(
//           child: ColorPicker(
//             pickerColor: initialColor ?? const Color(0xff443a49),
//             onColorChanged: (value) => onChangedColor(value),
//           ),
//         ),
//         actions: <Widget>[
//           ElevatedButton(
//             child: Text(LocaleKeys.selectColor.tr),
//             onPressed: () => Get.back(),
//           ),
//         ],
//       ),
//     );
//   }
//
//   static getActions(Map<String, dynamic> map) {
//     switch (getEnumButtonAction(map['buttonAction'])) {
//       case ButtonActions.OpenDialog:
//         showDialog<void>(
//           context: Get.context!,
//           builder: (BuildContext context) {
//             return Scaffold(
//               body: Stack(
//                 children: [
//                   Center(
//                     child: Image.network(
//                       map[Fields.src],
//                       fit: BoxFit.fill,
//                     ),
//                   ),
//                   Positioned(
//                     bottom: 10,
//                     right: 10,
//                     child: IconButton(
//                       onPressed: () => launch("${map[Fields.src]}"),
//                       icon: const Icon(Icons.download),
//                     ),
//                   ),
//                   Positioned(
//                     top: 10,
//                     left: 10,
//                     child: IconButton(
//                       onPressed: () => Get.back(),
//                       icon: const Icon(Icons.close),
//                     ),
//                   ),
//                 ],
//               ),
//             );
//           },
//         );
//         break;
//       case ButtonActions.login:
//         // var email = PageDetailsController.to.page!.content.variables
//         //     .firstWhere(
//         //       (element) => element.key == map['emailKey']['key'],
//         //     )
//         //     .type as TextEditingController;
//         // var password = PageDetailsController.to.page!.content.variables
//         //     .firstWhere(
//         //       (element) => element.key == map['passwordKey']['key'],
//         //     )
//         //     .type as TextEditingController;
//
//         break;
//       case ButtonActions.goTo:
//         if (map.containsKey(Fields.page)) {
//           Get.offAllNamed(
//               '${Routes.pageDetails}?project_id=${Get.parameters[Fields.projectId]}&page_id=${map[Fields.page][Fields.id]}');
//         }
//         break;
//
//       case ButtonActions.FacebookRewardedAd:
//       case ButtonActions.AdmobRewardedAd:
//         getActions(map[Fields.clickEvent]);
//         break;
//       default:
//         break;
//     }
//   }
//
//   static String getActionsString(Map<String, dynamic> map) {
//     switch (getEnumButtonAction(map[Fields.buttonAction])) {
//       case ButtonActions.OpenDialog:
//         return """
//  showDialog<void>(
//           context: context,
//           builder: (BuildContext context) {
//             return Scaffold(
//               body: Stack(
//                 children: [
//                   Center(
//                     child: Image.network(
//                       '${map[Fields.src]}',
//                       fit: BoxFit.fill,
//                     ),
//                   ),
//                   Positioned(
//                     bottom: 10,
//                     right: 10,
//                     child: Row(
//                       children: [
//                         IconButton(
//                           onPressed: () => launch('${map[Fields.src]}'),
//                           icon: const Icon(Icons.download),
//                         ),
//                         SizedBox(width: 10),
//                         IconButton(
//                           onPressed: () => Share.share("${map[Fields.src]}"),
//                           icon: const Icon(Icons.share),
//                         ),
//                       ],
//                     ),
//                   ),
//                   Positioned(
//                     top: 10,
//                     left: 10,
//                     child: IconButton(
//                       onPressed: () => Navigator.pop(context),
//                       icon: const Icon(Icons.close),
//                     ),
//                   ),
//                 ],
//               ),
//             );
//           },
//         );
// """;
//       case ButtonActions.login:
//         String? email = PageDetailsController.to.page!.content.variables
//             .firstWhereOrNull(
//               (element) => element.key == map['emailKey']['key'],
//             )
//             ?.name;
//
//         String? password = PageDetailsController.to.page!.content.variables
//             .firstWhereOrNull(
//               (element) => element.key == map['passwordKey']['key'],
//             )
//             ?.name;
//         return """
// ${email != null ? '//debugPrint(\'email--->\${widget.$email.text}\');' : ''}
// ${password != null ? '//debugPrint(\'password--->\${widget.$password.text}\');' : ''}
// """;
//       case ButtonActions.goTo:
//         if (map.containsKey(Fields.page)) {
//           return """Navigator.push(
//           context,
//           MaterialPageRoute(builder: (context) =>  ${map[Fields.page][Fields.name].toString().capitalize!.replaceAll(' ', '')}()),
//         );""";
//         } else {
//           return "";
//         }
//       case ButtonActions.AdmobRewardedAd:
//         return """ showDialog<void>(
//           context: context,
//           barrierDismissible: false, // user must tap button!
//           builder: (BuildContext context) {
//             return AlertDialog(
//               title: Text(
//                 'لاستخدام هذه الميزة تحتاج الي مشاهدة اعلان',
//                 style: GoogleFonts.getFont(
//                   'NotoSans',
//                   fontSize: 16,
//                   color: Color(0xff000828),
//                   fontWeight: FontWeight.normal,
//                   decoration: TextDecoration.none,
//                   fontStyle: FontStyle.normal,
//                 ),
//               ),
//               content: SingleChildScrollView(
//                 child: ListBody(
//                   children: <Widget>[
//                     Text(
//                       'هل تريد مشاهدة اعلان؟',
//                       style: GoogleFonts.getFont(
//                         'NotoSans',
//                         fontSize: 16,
//                         color: Color(0xff000828),
//                         fontWeight: FontWeight.normal,
//                         decoration: TextDecoration.none,
//                         fontStyle: FontStyle.normal,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               actions: <Widget>[
//                 TextButton(
//                   child: Text(
//                     'مشاهدة اعلان',
//                     style: GoogleFonts.getFont(
//                       'NotoSans',
//                       fontSize: 16,
//                       color: Color(0xff000828),
//                       fontWeight: FontWeight.normal,
//                       decoration: TextDecoration.none,
//                       fontStyle: FontStyle.normal,
//                     ),
//                   ),
//                   onPressed: () {
//                     RewardedAd.load(
//                       adUnitId: context
//                               .read<AdsProvider>()
//                               .adsModel
//                               ?.addmobRewardedId ??
//                           '',
//                       request: const AdRequest(),
//                       rewardedAdLoadCallback: RewardedAdLoadCallback(
//                         onAdLoaded: (RewardedAd ad) {
//                           ad.show(
//                             onUserEarnedReward: (ad, reward) {
//                               ${map.containsKey(Fields.clickEvent) ? getActionsString(map[Fields.clickEvent]) : ''}
//                             },
//                           );
//                         },
//                         onAdFailedToLoad: (LoadAdError error) {
//                          ${map.containsKey(Fields.clickEvent) ? getActionsString(map[Fields.clickEvent]) : ''}
//                         },
//                       ),
//                     );
//                   },
//                 ),
//                 TextButton(
//                   child: Text(
//                     'الغاء',
//                     style: GoogleFonts.getFont(
//                       'NotoSans',
//                       fontSize: 16,
//                       color: Color(0xff000828),
//                       fontWeight: FontWeight.normal,
//                       decoration: TextDecoration.none,
//                       fontStyle: FontStyle.normal,
//                     ),
//                   ),
//                   onPressed: () {
//                     Navigator.of(context).pop();
//                   },
//                 ),
//               ],
//             );
//           },
//         ); """;
//
//       case ButtonActions.FacebookRewardedAd:
//         return """ FacebookRewardedVideoAd.loadRewardedVideoAd(
//       placementId: context.read<AdsProvider>().adsModel?.facebookRewardedId ??'',
//       listener: (result, value) {
//
//         if (result == RewardedVideoAdResult.LOADED) {}
//         if (result == RewardedVideoAdResult.VIDEO_COMPLETE){
//          ${map.containsKey(Fields.clickEvent) ? getActionsString(map[Fields.clickEvent]) : ''}
//         }
//
//
//         if (result == RewardedVideoAdResult.VIDEO_CLOSED &&
//             (value == true || value["invalidated"] == true)) {
//        ${map.containsKey(Fields.clickEvent) ? getActionsString(map[Fields.clickEvent]) : ''}
//         }
//       },
//     ); """;
//
//       case ButtonActions.StartIORewardedAd:
//         return """
// StartAppRewardedVideoAd? rewardedVideoAd;
//                 context.read<AdsProvider>().startAppSdk.loadRewardedVideoAd(
//                   onAdNotDisplayed: () {
//                     //debugPrint('onAdNotDisplayed: rewarded video');
//
//                     setState(() {
//                       // NOTE rewarded video ad can be shown only once
//                       rewardedVideoAd?.dispose();
//                       rewardedVideoAd = null;
//                     });
//                    ${map.containsKey(Fields.clickEvent) ? getActionsString(map[Fields.clickEvent]) : ''}
//                   },
//                   onAdHidden: () {
//                     //debugPrint('onAdHidden: rewarded video');
//
//                     setState(() {
//                       // NOTE rewarded video ad can be shown only once
//                       rewardedVideoAd?.dispose();
//                       rewardedVideoAd = null;
//                     });
//                     ${map.containsKey(Fields.clickEvent) ? getActionsString(map[Fields.clickEvent]) : ''}
//                   },
//                   onVideoCompleted: () {
//                     //debugPrint(
//                         'onVideoCompleted: rewarded video completed, user gain a reward');
//
//                     setState(() {
//                       rewardedVideoAd?.dispose();
//                       rewardedVideoAd = null;
//                     });
//                    ${map.containsKey(Fields.clickEvent) ? getActionsString(map[Fields.clickEvent]) : ''}
//                   },
//                 ).then((r) {
//                   setState(() {
//                     rewardedVideoAd = r;
//
//                     rewardedVideoAd!.show().onError((error, stackTrace) {
//                       //debugPrint("Error showing Rewarded Video ad: \$error");
//                       return false;
//                     });
//                   });
//                 }).onError((ex, stackTrace) {
//                   //debugPrint("Error loading Rewarded Video ad: \$ex");
//                 }).onError((error, stackTrace) {
//                   //debugPrint("Error loading Rewarded Video ad: \$error");
//                 });
// """;
//       case ButtonActions.MakeCall:
//         if (map.containsKey(Fields.mobileNumber)) {
//           return """launch("tel:+${map[Fields.mobileNumber]}");""";
//         } else {
//           return "";
//         }
//
//       case ButtonActions.SendEmail:
//         if (map.containsKey(Fields.email)) {
//           return """launch("mailto:${map[Fields.email]}");""";
//         } else {
//           return "";
//         }
//
//       case ButtonActions.DownloadUrl:
//         if (map.containsKey(Fields.downloadUrl)) {
//           return """launch("${map[Fields.downloadUrl]}");""";
//         } else {
//           return "";
//         }
//       case ButtonActions.Share:
//         if (map.containsKey(Fields.share)) {
//           return """Share.share("${map[Fields.share]}");""";
//         } else {
//           return "";
//         }
//       default:
//         return '';
//     }
//   }
//
//   /// dialog show actions
//   static actionsDialog(
//       Function(ButtonActions) callBack, List<ButtonActions> buttonActions) {
//     setAction(ButtonActions actions) {
//       if (Get.isDialogOpen!) {
//         Get.back();
//       }
//
//       callBack(actions);
//     }
//
//     return Get.dialog(
//       useSafeArea: true,
//       Dialog(
//         shape: RoundedRectangleBorder(
//           borderRadius: 8.radius,
//         ),
//         backgroundColor: KColor.primaryColor,
//         child: SizedBox(
//           width: 400,
//           child: GridView(
//             padding: gPaddingAll(20),
//             gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//               crossAxisCount: 2,
//               crossAxisSpacing: 20,
//               mainAxisSpacing: 20,
//             ),
//             children: [
//               /// LOGIN
//               if (buttonActions.contains(ButtonActions.login))
//                 ActionsDialogWidget(
//                     onTap: () => setAction(ButtonActions.login),
//                     text: LocaleKeys.login.tr,
//                     icon: Icons.login),
//
//               /// GOTO
//               if (buttonActions.contains(ButtonActions.goTo))
//                 ActionsDialogWidget(
//                     onTap: () => setAction(ButtonActions.goTo),
//                     text: LocaleKeys.goTo.tr,
//                     icon: Icons.arrow_right_alt),
//
//               /// ADMOB REWARDED
//               if (buttonActions.contains(ButtonActions.AdmobRewardedAd) &&
//                   PageDetailsController.to.page!.projectAds?.admobRewardedId !=
//                       null)
//                 ActionsDialogWidget(
//                     onTap: () => setAction(ButtonActions.AdmobRewardedAd),
//                     text: LocaleKeys.admobRewardedAd.tr,
//                     icon: Icons.ads_click),
//
//               /// FACEBOOK REWARDED
//               if (buttonActions.contains(ButtonActions.FacebookRewardedAd) &&
//                   PageDetailsController
//                           .to.page!.projectAds?.facebookRewardedId !=
//                       null)
//                 ActionsDialogWidget(
//                     onTap: () => setAction(ButtonActions.FacebookRewardedAd),
//                     text: LocaleKeys.facebookRewardedAd.tr,
//                     icon: Icons.ads_click),
//
//               /// START IO REWARDED
//               if (buttonActions.contains(ButtonActions.StartIORewardedAd) &&
//                   PageDetailsController.to.page!.projectAds?.startIoAppId !=
//                       null)
//                 ActionsDialogWidget(
//                     onTap: () => setAction(ButtonActions.StartIORewardedAd),
//                     text: LocaleKeys.startIOAds.tr,
//                     icon: Icons.ads_click),
//
//               /// MakeCall
//               if (buttonActions.contains(ButtonActions.MakeCall))
//                 ActionsDialogWidget(
//                   onTap: () => setAction(ButtonActions.MakeCall),
//                   text: LocaleKeys.makeCall.tr,
//                   icon: Icons.call,
//                 ),
//
//               /// Email
//               if (buttonActions.contains(ButtonActions.SendEmail))
//                 ActionsDialogWidget(
//                   onTap: () => setAction(ButtonActions.SendEmail),
//                   text: LocaleKeys.email.tr,
//                   icon: Icons.mail_outlined,
//                 ),
//
//               /// Share
//               if (buttonActions.contains(ButtonActions.Share))
//                 ActionsDialogWidget(
//                   onTap: () => setAction(ButtonActions.Share),
//                   text: LocaleKeys.share.tr,
//                   icon: Icons.share,
//                 ),
//
//               /// DownloadUrl
//               if (buttonActions.contains(ButtonActions.DownloadUrl))
//                 ActionsDialogWidget(
//                   onTap: () => setAction(ButtonActions.DownloadUrl),
//                   text: LocaleKeys.downloadUrl.tr,
//                   icon: Icons.download,
//                 ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   static Future<Uint8List?> getImage() async {
//     Uint8List? imgFile;
//     FilePickerResult? result = await FilePicker.platform.pickFiles();
//
//     if (result != null) {
//       PlatformFile file = result.files.first;
//       final bytes = file.bytes;
//       if (bytes != null) {
//         imgFile = Uint8List.fromList(bytes);
//       }
//     }
//
//     return imgFile;
//   }

  static removeWidget(
          dynamic parentWidgetMap, Map<String, dynamic> deletedWidgetMap) =>
      (parentWidgetMap is List)
          ? removeWidgetFromList(parentWidgetMap, deletedWidgetMap)
          : (parentWidgetMap is Map
              ? removeWidgetFromMap(
                  parentWidgetMap as Map<String, dynamic>, deletedWidgetMap)
              : parentWidgetMap);

  static updateWidget(
          dynamic parentWidgetMap, Map<String, dynamic> updateWidgetMap) =>
      (parentWidgetMap is List)
          ? updateWidgetFromList(parentWidgetMap, updateWidgetMap)
          : (parentWidgetMap is Map
              ? updateWidgetFromMap(
                  parentWidgetMap as Map<String, dynamic>, updateWidgetMap)
              : parentWidgetMap);

  static pickedFile() {}
}

/// REMOVE WIDGET
Map<String, dynamic> removeWidgetFromMap(Map<String, dynamic> currentWidget,
        Map<String, dynamic> deletedWidget) =>
    currentWidget
      ..removeWhere((String key, dynamic value) {
        return value == deletedWidget;
      })
      ..map<String, dynamic>((key, value) =>
          MapEntry(key, Utils.removeWidget(value, deletedWidget)));

List removeWidgetFromList(List list, Map<String, dynamic> deletedWidget) => list
  ..removeWhere((value) => value == deletedWidget)
  ..map((e) => Utils.removeWidget(e, deletedWidget)).toList();

/// UPDATE WIDGET
Map<String, dynamic> updateWidgetFromMap(
    Map<String, dynamic> currentWidget, Map<String, dynamic> updatedWidget) {
  if (currentWidget['key'] == updatedWidget['key']) {
    return updatedWidget;
  } else {
    return currentWidget.map<String, dynamic>((key, value) =>
        MapEntry(key, Utils.updateWidget(value, updatedWidget)));
  }
}

List updateWidgetFromList(List list, Map<String, dynamic> updatedWidget) {
  final int index = list.indexWhere((value) {
    return value['key'] == updatedWidget['key'];
  });
  if (index != -1) {
    list[index] = updatedWidget;
  }

  return list..map((e) => Utils.updateWidget(e, updatedWidget)).toList();
}

extension ListsExtension on List {
  List removeWidget(Map<String, dynamic> deletedWidget) =>
      removeWidgetFromList(this, deletedWidget);

  List updateWidget(Map<String, dynamic> updatedWidget) =>
      updateWidgetFromList(this, updatedWidget);
}

extension MapsExtension on Map {
  Map removeWidget(Map<String, dynamic> deletedWidget) =>
      removeWidgetFromMap(this as Map<String, dynamic>, deletedWidget);

  Map updateWidget(Map<String, dynamic> updatedWidget) =>
      updateWidgetFromMap(this as Map<String, dynamic>, updatedWidget);
}
