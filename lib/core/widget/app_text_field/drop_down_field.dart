import '/index.dart';

class CustomDropDownButton<T> extends StatelessWidget {
  const CustomDropDownButton({
    super.key,
    this.title,
    this.subTitle,
    required this.items,
    this.onChanged,
    this.value,
  });
  final String? title;
  final String? subTitle;
  final List<DropdownMenuItem<T>>? items;
  final ValueChanged<T?>? onChanged;
  final T? value;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title != null) ...[
          TextWidget(
            title!,
            style: gStyle14(fontSize: 13, fontWeight: FontWeight.w500),
          ),
          12.sH
        ],
        DropdownButtonFormField<T>(
          isDense: true,
          borderRadius: 40.radius,
          isExpanded: true,
          icon: const Icon(
            Icons.keyboard_arrow_down,
            color: Colors.black,
          ),
          validator: (value) {
            if (value == null) {
              return Kstrings.pleaseFillThisField.tr;
            }
            return null;
          },
          value: value,
          decoration: InputDecoration(
            contentPadding: gPaddingAll(20),
            border: OutlineInputBorder(
              borderRadius: 40.radius,
              borderSide: const BorderSide(
                color: KColors.fillBorder,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: 40.radius,
              borderSide: const BorderSide(
                color: KColors.fillBorder,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: 40.radius,
              borderSide: const BorderSide(
                color: KColors.fillBorder,
              ),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: 40.radius,
              borderSide: const BorderSide(color: KColors.fillBorder),
            ),
          ),
          style: gStyle14(),
          hint: TextWidget(
            subTitle!.toLowerCase(),
            style: gStyle12(color: Colors.grey),
          ),
          items: items,
          onChanged: onChanged,
        ),
      ],
    );
  }
}
