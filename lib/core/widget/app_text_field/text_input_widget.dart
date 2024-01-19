import '/index.dart';

class TextInputWidget extends StatelessWidget {
  const TextInputWidget(
    this.title, {
    super.key,
    this.controller,
    this.keyboardType,
    this.hintText,
    this.hintStyle,
    this.isPassword = false,
    this.enabled = true,
    this.onChanged,
    this.validator,
    this.textStyle,
    this.prefixIcon,
    this.prefixColor,
    this.suffixIcon,
    this.onPressed,
    this.val,
    this.suffixIconColor,
    this.fillColor = KColors.greyLight,
    this.textInputAction,
    this.maxLines = 1,
    this.readOnly = false,
    this.callback,
  });
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final String? title, hintText, val;
  final TextStyle? textStyle, hintStyle;
  final Color? prefixColor, fillColor, suffixIconColor;
  final bool isPassword, readOnly,enabled;
  final dynamic prefixIcon;
  final IconData? suffixIcon;
  final VoidCallback? onPressed, callback;
  final Function(String?)? onChanged;
  final String? Function(String?)? validator;
  final TextInputAction? textInputAction;
  final int maxLines;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (!title.isEmptyOrNul) ...[
          TextWidget(' $title', style: textStyle ?? gStyle14()),
          12.sH,
        ],
        TextFormField(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          initialValue: val,
          enabled:enabled,
          controller: controller,
          inputFormatters: keyboardType == TextInputType.number
              ? [FilteringTextInputFormatter.digitsOnly]
              : null,
          keyboardType: keyboardType != TextInputType.number
              ? (keyboardType ?? TextInputType.text)
              : null,
          obscureText: isPassword,
          onChanged: onChanged,
          validator: validator,
          maxLines: maxLines,
          textInputAction: textInputAction,
          cursorColor: KColors.black,
          style: gStyle14(fontSize: 13, color: KColors.black),
          decoration: InputDecoration(
            contentPadding: gPaddingAll(/* context.width < 350 ? 15 : */ 20),
            hintText: (hintText ?? title).toString().toLowerCase(),
            hintStyle: hintStyle ?? gStyle12(color: KColors.textGray),
            border: OutlineInputBorder(
              borderRadius: 40.radius,
              borderSide: BorderSide(width: .5.w, color: KColors.fillBorder),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: 40.radius,
              borderSide: BorderSide(width: .5.w, color: KColors.fillBorder),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: 40.radius,
              borderSide: BorderSide(width: 1.5.w, color: KColors.primary),
            ),
            filled: true,
            fillColor: fillColor,
            // prefixIconConstraints:
            //     (prefixIcon is Widget) ? BoxConstraints(minWidth: 120.w) : null,
            prefixIcon: (prefixIcon != null)
                ? (prefixIcon is IconData)
                    ? Icon(
                        prefixIcon,
                        size: (/* context.width < 350 ? 15 : */ 18).h,
                        color: prefixColor ?? KColors.primary,
                      )
                    : (prefixIcon is String)
                        ? CircleAvatar(
                            backgroundColor: KColors.transparent,
                            child: ImageWidget(
                              path: prefixIcon,
                              height: /*  context.width < 350 ? 15 : */ 20,
                              // width: 20,
                            ),
                          )
                        : SizedBox(
                            width: (context.isTablet ? 120 : 110).w,
                            child: prefixIcon as Widget,
                          )
                : null,
            suffixIcon: (suffixIcon != null)
                ? TextButton(
                    style: const ButtonStyle(
                      shape: MaterialStatePropertyAll(CircleBorder()),
                    ),
                    onPressed: onPressed,
                    child: Icon(
                      suffixIcon,
                      color: suffixIconColor ?? KColors.grey1,
                    ),
                  )
                : null,
          ),
          readOnly: readOnly,
          onTap: callback,
        ),
      ],
    );
  }
}

List<BoxShadow> boxShadow = [
  const BoxShadow(
    color: KColors.grey,
    blurRadius: 10,
    offset: Offset(-2, 2), // changes position of shadow
  ),
];
