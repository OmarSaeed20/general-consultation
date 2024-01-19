/* import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    this.prefixImage,
    this.hintText,
    this.validator,
    this.prefixIcon,
    this.isMultiLine = false,
    this.textEditingController,
    this.readOnly = false,
    this.suffixIcon,
    this.filledColor,
    this.focusNode,
    this.onChanged,
    this.onEditingComplete,
    this.onFieldSubmitted,
    this.isObscure = false,
    this.textInputType = TextInputType.text,
    this.title,
    this.border,
    this.borderRadius = 8,
    this.borderColor = const Color(0xffE2E2E2),
  }) : super(key: key);
  final String? prefixImage;
  final InputBorder? border;
  final IconData? prefixIcon;
  final Widget? suffixIcon;
  final String? hintText;
  final Color? filledColor;
  final String? title;
  final String? Function(String?)? validator;
  final bool isMultiLine;
  final bool isObscure;
  final TextEditingController? textEditingController;
  final bool? readOnly;
  final TextInputType? textInputType;
  final ValueChanged<String>? onChanged;
  final VoidCallback? onEditingComplete;
  final ValueChanged<String>? onFieldSubmitted;
  final FocusNode? focusNode;
  final double? borderRadius;
  final Color? borderColor;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (title != null) ...[
          CustomText(text: title!, fontSize: 14, fontWeight: FontWeight.w500),
          12.sH,
        ],
        ConstrainedBox(
          constraints: BoxConstraints(maxHeight: 100.h),
          child: TextFormField(
            maxLines: isMultiLine ? null : 1,
            minLines: isMultiLine ? 6 : null,
            validator: validator,
            controller: textEditingController,
            keyboardType: textInputType,
            obscureText: isObscure,
            onChanged: onChanged,
            onEditingComplete: onEditingComplete,
            onFieldSubmitted: onFieldSubmitted,
            focusNode: focusNode,
            style: TextStyle(
              fontFamily: "Somar",
              fontSize: 20.sp,
              fontWeight: FontWeight.w400,
            ),
            inputFormatters: textInputType == TextInputType.number
                ? [FilteringTextInputFormatter.digitsOnly]
                : null,
            decoration: InputDecoration(
              filled: filledColor != null,
              fillColor: filledColor,
              contentPadding: gPadding(
                  top: 16, bottom: 16, right: prefixImage != null ? 4 : 16),
              prefixIcon: prefixImage != null
                  ? prefixImage!.contains("svg")
                      ? CircleAvatar(
                          backgroundColor: Colors.transparent,
                          child: SvgPicture.asset(
                            prefixImage!,
                            height: 24.h,
                            width: 24.w,
                          ),
                        )
                      : Image.asset(
                          prefixImage!,
                          height: 18.h,
                          width: 18.w,
                          color: ColorManager.welcome,
                        )
                  : prefixIcon != null
                      ? Icon(prefixIcon)
                      : null,
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: borderColor!),
                borderRadius: borderRadius!.radius,
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: borderColor!),
                borderRadius: borderRadius!.radius,
              ),
              border: OutlineInputBorder(
                borderSide: BorderSide(color: borderColor!),
                borderRadius: borderRadius!.radius,
              ),
              hintText: hintText,
              hintStyle: TextStyle(
                fontFamily: "Somar",
                fontSize: 16.sp,
                fontWeight: FontWeight.w400,
                color: Colors.grey,
              ),
              suffixIcon: suffixIcon,
            ),
          ),
        ),
      ],
    );
  }
}

class DropDownTextField<T> extends StatelessWidget {
  const DropDownTextField({
    Key? key,
    this.prefixImage,
    this.hintText,
    this.validator,
    this.prefixIcon,
    this.readOnly = false,
    this.suffixIcon,
    this.value,
    this.filledColor,
    this.items,
    this.focusNode,
    required this.onChanged,
    this.title,
  }) : super(key: key);
  final String? prefixImage;
  final IconData? prefixIcon;
  final Widget? suffixIcon;
  final String? hintText;
  final Color? filledColor;
  final String? title;
  final String? Function(T?)? validator;
  final bool? readOnly;
  final ValueChanged<T?> onChanged;
  final FocusNode? focusNode;
  final T? value;
  final List<DropdownMenuItem<T>>? items;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (title != null) ...[
          CustomText(text: title!, fontSize: 18),
          12.sH,
        ],
        ConstrainedBox(
          constraints: const BoxConstraints(maxHeight: 100),
          child: DropdownButtonFormField(
            validator: validator,
            onChanged: onChanged,
            focusNode: focusNode,
            style: TextStyle(fontSize: 14.sp),
            value: value,
            items: items,
            decoration: InputDecoration(
              filled: filledColor != null,
              fillColor: filledColor,
              contentPadding: gPaddingSymmetric(horizontal: 10, vertical: 13),
              prefixIcon: prefixImage != null
                  ? Image.asset(
                      prefixImage!,
                      height: 18.h,
                      width: 18.w,
                      color: ColorManager.welcome,
                    )
                  : prefixIcon != null
                      ? Icon(prefixIcon)
                      : null,
              border: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: ColorManager.textFieldBorder,
                ),
                borderRadius: 8.radius,
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: ColorManager.textFieldBorder,
                ),
                borderRadius: 8.radius,
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: ColorManager.textFieldBorder,
                ),
                borderRadius: 8.radius,
              ),
              hintText: hintText,
              hintStyle: TextStyle(
                fontSize: 16.sp,
                color: ColorManager.textFieldHint,
              ),
              suffixIcon: suffixIcon,
            ),
          ),
        ),
      ],
    );
  }
}
 */