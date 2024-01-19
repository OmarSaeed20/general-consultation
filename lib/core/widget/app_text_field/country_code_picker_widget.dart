/* import '/index.dart';
import 'package:flutter/cupertino.dart';

class CountryCodePickerWidget extends StatefulWidget {
  const CountryCodePickerWidget({
    super.key,
    required this.phone,
    required this.isCorrectPhone,
    required this.onChanged,
    required this.onValidated,
    required this.initialValue,
    this.fillColor = KColors.greyLight,
  });
  final String phone;
  final bool isCorrectPhone;
  final Color fillColor;
  final void Function(PhoneNumber) onChanged;
  final void Function(bool) onValidated;
  final PhoneNumber? initialValue;

  @override
  State<CountryCodePickerWidget> createState() =>
      _CountryCodePickerWidgetState();
}

class _CountryCodePickerWidgetState extends State<CountryCodePickerWidget> {
  final FocusNode _focusNode = FocusNode();
  Border border = Border.all(width: 0.5.w, color: KColors.fillBorder);

  void _onFocusChanged() {
    _focusNode.hasFocus
        ? border = Border.all(
            width: 1.5.w,
            color: KColors.primary,
          )
        : border = Border.all(width: 0.5.w, color: KColors.fillBorder);
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(_onFocusChanged);
  }

  @override
  void dispose() {
    super.dispose();
    _focusNode.removeListener(_onFocusChanged);
    _focusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextWidget(
          Kstrings.mobileNumber.tr,
          style: gStyle14(fontWeight: FontWeight.w500),
        ),
        15.sH,
        Container(
          padding: gPadding(right: 15, left: 15),
          decoration: BoxDecoration(
            borderRadius: 40.radius,
            border: border,
            color: widget.fillColor,
          ),
          child: InternationalPhoneNumberInput(
            onInputChanged: widget.onChanged,
            // onInputValidated: widget.onValidated,
            focusNode: _focusNode,
            selectorConfig: const SelectorConfig(
              selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
              trailingSpace: false,
            ),
            searchBoxDecoration: const InputDecoration(
              labelText: AppConstants.empty,
              prefixIcon: Icon(CupertinoIcons.search),
            ),
            inputDecoration: InputDecoration(
              isCollapsed: true,
              contentPadding: gPadding(top: 17.0, bottom: 17.0),
              hintText: Kstrings.enterMobileNumber.tr,
              hintStyle: gStyle12(color: KColors.textGray),
              border: InputBorder.none,
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              errorBorder: InputBorder.none,
            ),
            textAlign:
                Get.find<AppPreferences>().getLang == LanguageType.ar.name
                    ? TextAlign.right
                    : TextAlign.start,
            // autoValidateMode: AutovalidateMode.onUserInteraction,
            selectorTextStyle: const TextStyle(color: KColors.black),
            initialValue: widget.initialValue,
            formatInput: true,
            ignoreBlank: true,
            keyboardType: TextInputType.number,
            inputBorder: InputBorder.none,
            // validator: (value) => Utils.inputValidator(
            //   '$value',
            //   Type.phone,
            //   isCorrectPhone: widget.isCorrectPhone,
            // ),
          ),
        ),
      ],
    );
  }
}
/* 
    TextInputWidget(
      Kstrings.mobileNumber.tr,
      hintText: Kstrings.enterMobileNumber.tr,
      fillColor: KColors.transparent,
      controller: controller.mobileCtrl,
      prefixIcon: Kimage.mobile,
                ), */ */