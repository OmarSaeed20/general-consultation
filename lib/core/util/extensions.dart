import '/index.dart';
// ignore: depend_on_referenced_packages
import 'package:intl/intl.dart';

extension DateTimeExtensions on String? {
  String get appDateFormat {
    if (this == null) {
      return '';
    }

    return DateFormat('d/M/y', Get.find<AppPreferences>().getLang)
        .format(DateTime.parse(this!));
  }

  String get chatDateFormat {
    if (this == null) {
      return '';
    }

    return DateFormat(' d MMM', Get.find<AppPreferences>().getLang)
        .format(DateTime.parse(this!));
  }

  String get formatDate {
    if (this == null) {
      return '';
    }

    return DateFormat('hh:mm a', Get.find<AppPreferences>().getLang)
        .format(DateTime.parse(this!));
  }

  String get forrmattedDateTime {
    return DateFormat('hh:mm', LanguageType.en.name)
        .format(DateTime.tryParse(this ?? '') ?? DateTime.now())
      ..toUpperCase();
  }

  String get chatDateWithTimeFormat {
    if (this == null) {
      return '';
    }

    return DateFormat('', Get.find<AppPreferences>().getLang)
        .add_jm()
        .format(DateTime.parse(this!));
  }

  String get dayMonFormat {
    if (this == null) {
      return '';
    }

    return DateFormat('d MMM', Get.find<AppPreferences>().getLang)
        .add_jm()
        .format(DateTime.parse(this!));
  }

  bool get isEmptyOrNul =>
      this == null ||
      (this != null && this!.isEmpty) ||
      (this != null && this! == 'null');

  // Check null string, return given value if null
  String valide({String value = ''}) {
    if (isEmptyOrNul) return value;
    return this!;
  }
}

extension TextEditingControllerExtension on TextEditingController {
  String? controller(TextEditingController ctrl) {
    return ctrl.text.isNotEmpty ? text : null;
  }

  TextEditingController copyWith({String? text}) =>
      TextEditingController(text: text ?? this.text);
}

extension InttExtensionn on int {
  String get getDurationReminder {
    if (toString().length == 1) return '0$this';
    return '$this';
  }
}

gPadding({
  double left = 0,
  double top = 0,
  double right = 0,
  double bottom = 0,
}) =>
    EdgeInsetsDirectional.only(
      end: left.w,
      top: top.h,
      start: right.w,
      bottom: bottom.h,
    );

gPaddingSymmetric({double horizontal = 0, double vertical = 0}) =>
    EdgeInsets.symmetric(vertical: vertical.h, horizontal: horizontal.w);
gPaddingAll(double all) =>
    EdgeInsets.symmetric(vertical: all.h, horizontal: all.w);

extension BorderRadiusExtension on num {
  BorderRadius get radius => BorderRadius.circular(toDouble().r);
  BorderRadius get radiusAll => BorderRadius.all(toDouble().radiusCircular);
  Radius get radiusCircular => Radius.circular(toDouble().r);
}

extension SizedBoxExtension on num {
  SizedBox get sH => SizedBox(height: toDouble().h);
  SizedBox get sW => SizedBox(width: toDouble().w);
}
