import 'package:flutter/cupertino.dart';

import '/index.dart';

class FilterView extends GetView<FilterVendorControllerImp> {
  const FilterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        FilterVendorState state = controller.state.value;
        // ignore: deprecated_member_use
        return Scaffold(
          appBar: BuildAppBar(
            title: Kstrings.searchFillter.tr,
            actions: [
              TxtBtn(
                TextWidget(Kstrings.reset.tr, style: gStyle12()),
                onTap: () => controller.resetFilter(),
                padding: gPadding(left: 15),
              )
            ],
          ),
          body: /* state.rx.isLoading
              ? const LoadingWidget()
              :  */
              SafeArea(
            child: ListView(
              padding: gPadding(top: 25, left: 15, right: 15, bottom: 15),
              children: [
                /*TextWidget(
                        Kstrings.searchBySpecialistName.tr,
                        style: gStyle16(
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      15.sH,
                       TextInputWidget(
                        "",
                        hintText: Kstrings.writeHere.tr,
                        hintStyle: gStyle12(fontWeight: FontWeight.w300),
                        keyboardType: TextInputType.visiblePassword,
                        prefixIcon: Kimage.searchIcon,
                        // controller: state.keyWords.value,
                        onChanged: (value) =>
                            controller.setKeyWords(val: value!),
                      ),
                      /* TextFormField(
                        onChanged: (value) =>
                            controller.setKeyWords(val: value),
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.zero,
                          border: InputBorder.none,
                          prefixIcon: const ImageWidget(
                            path: Kimage.searchIcon,
                            height: 22.5,
                            width: 22.5,
                            color: KColors.grey3,
                          ),
                          labelText: Kstrings.writeHere.tr,
                          labelStyle: gStyle12(fontWeight: FontWeight.w300),
                        ),
                      ), */
                      
                      5.sH,
                      Divider(color: KColors.textGray.withOpacity(0.25)),
                      15.sH,*/
                /*  ListTile(
                          contentPadding: EdgeInsets.zero,
                          title: AuthHeader(
                            title: Kstrings.location.tr,
                            supTitle: "السعودية ,الرياض",
                            padding: gPadding(),
                            padLef: 0,
                          ),
                          trailing: SvgPicture.asset(Kimage.arrowLeftIcon),
                        ), */
                _CountriesAndCitiesContent(controller),
                5.sH,
                Divider(color: KColors.textGray.withOpacity(0.25)),
                TextWidget(
                  Kstrings.category.tr,
                  padding: gPaddingSymmetric(vertical: 15),
                  style: gStyle16(fontWeight: FontWeight.w700),
                ),
                if (state.rx.isLoading && state.categories.isEmpty) ...[
                  Wrap(
                    children: [
                      ...List.generate(
                        8,
                        (i) => const ShimmerChickBox(),
                      ),
                    ],
                  )
                ] else if (state.categories.isNotEmpty) ...[
                  Wrap(
                    children: [
                      ...List.generate(
                        state.categories.length,
                        (index) => Visibility(
                          visible: state.categories[index].isActive ?? false,
                          child: _CheckBoxTextWidget(
                            text: state.categories[index].name,
                            value:
                                state.categoryId == state.categories[index].id,
                            onChanged: (p0) => controller.setCategory(
                              categoryId: state.categories[index].id,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  filterDivier(),
                ],
                ...[
                  TextWidget(
                    Kstrings.specialization.tr,
                    padding: gPaddingSymmetric(vertical: 15),
                    style: gStyle16(fontWeight: FontWeight.w700),
                  ),
                  if (state.rxSup.isLoading)
                    Wrap(
                      children: [
                        ...List.generate(
                          4,
                          (i) => const ShimmerChickBox(),
                        ),
                      ],
                    )
                  else if (state.supCategories.isNotEmpty) ...[
                    Wrap(
                      children: [
                        ...List.generate(
                          state.supCategories.length,
                          (index) => Visibility(
                            visible:
                                state.supCategories[index].isActive ?? false,
                            child: _CheckBoxTextWidget(
                              text: state.supCategories[index].name,
                              value: state.subCtegoriesIds
                                  .contains(state.supCategories[index].id),
                              onChanged: (p0) => controller.setSupCategory(
                                supCategoryId: state.supCategories[index].id,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ] else
                    TextWidget(
                      "There are no specializations currently!".tr,
                      textAlign: TextAlign.center,
                      padding: gPadding(bottom: 15),
                      style: gStyle14(),
                    ),
                ],
                /*TextWidget(
                          Kstrings.showMore.tr,
                          style: gStyle16(
                            color: KColors.borderColor2,
                            fontWeight: FontWeight.w700,
                          ),
                        ), */
                Divider(color: KColors.textGray.withOpacity(0.25)),
                TextWidget(
                  Kstrings.experienceYears.tr,
                  padding: gPaddingSymmetric(vertical: 15),
                  style: gStyle16(fontWeight: FontWeight.w700),
                ),
                ...state.years
                    .map(
                      (e) => _CheckBoxTextWidget(
                        text: e.tr,
                        value: state.yearsOfExper == e,
                        onChanged: (p0) => controller.setYearsOfExperience(
                          yearsOfExperience: e,
                        ),
                      ),
                    )
                    .toList(),
                15.sH,
                Divider(color: KColors.textGray.withOpacity(0.25)),
                TextWidget(
                  Kstrings.accreditation.tr,
                  padding: gPaddingSymmetric(vertical: 15),
                  style: gStyle16(fontWeight: FontWeight.w700),
                ),
                ...state.accreditations
                    .map(
                      (e) => _CheckBoxTextWidget(
                        text: e.tr,
                        value: e == state.verifyAccount,
                        onChanged: (p0) =>
                            controller.setVerifyAccount(verifyAccount: e),
                      ),
                    )
                    .toList(),
                Divider(color: KColors.textGray.withOpacity(0.25)),
                TextWidget(
                  Kstrings.usersRates.tr,
                  padding: gPaddingSymmetric(vertical: 15),
                  style: gStyle16(fontWeight: FontWeight.w700),
                ),
                ...state.rates
                    .map(
                      (e) => _RatingContent(
                        value: e,
                        title: Kstrings.aboveThan.tr,
                        radioValue: true,
                        radioGroupValue: e == state.rate,
                        onChanged: (p0) => controller.setVendorRate(rate: e),
                      ),
                    )
                    .toList(),
                50.sH,
                BtnWidget(
                  onTap: () => controller.setFilter(),
                  title: Kstrings.applyFiltter.tr,
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Divider filterDivier() => Divider(color: KColors.textGray.withOpacity(0.25));
}

class ShimmerChickBox extends StatelessWidget {
  const ShimmerChickBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: gPadding(bottom: 15, top: 15, right: 10),
      width: context.width / 2.25,
      child: Row(
        children: [
          ShimmerWidget(
            child: Container(
              height: 20,
              width: 20,
              decoration: BoxDecoration(
                borderRadius: 4.radius,
                color: KColors.fillColor,
              ),
            ),
          ),
          6.sW,
          ShimmerWidget(
            child: Container(
              height: 6.h,
              width: 55.w,
              decoration: BoxDecoration(
                borderRadius: 4.radius,
                color: KColors.fillColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _CountriesAndCitiesContent extends StatelessWidget {
  const _CountriesAndCitiesContent(this.controller);
  final FilterVendorControllerImp controller;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: controller.state.value.rx.isLoading
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextWidget(Kstrings.country.tr, style: gStyle14()),
                    15.sH,
                    ShimmerWidget(
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 1,
                            color: KColors.fillBorder,
                          ),
                          borderRadius: 6.radius,
                          color: KColors.fillColor,
                        ),
                        height: 50,
                        width: double.infinity,
                      ),
                    ),
                  ],
                )
              : DropDownButtonWidget<CountryData>(
                  items: controller.state.value.countries
                      .map(
                        (element) => DropdownMenuItem(
                          value: element,
                          child: TextWidget(
                            element.label,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      )
                      .toList(),
                  onChanged: (value) => controller.setCountry(country: value!),
                  value: controller.state.value.seclectedCountry,
                  title: Kstrings.country.tr,
                  subTitle: Kstrings.country.tr,
                ),
        ),
        12.sW,
        /*  Expanded(p
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextWidget(Kstrings.city.tr, style: gStyle14()),
                  15.sH,
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 1,
                        color: KColors.fillBorder,
                      ),
                      borderRadius: 6.radius,
                    ),
                    child: ListTile(
                      onTap: () {
                        Get.bottomSheet(
                          Container(
                            height: (context.height * .5),
                            decoration: BoxDecoration(
                              color: KColors.white,
                              borderRadius: BorderRadius.only(
                                topRight: 15.radiusCircular,
                                topLeft: 15.radiusCircular,
                              ),
                            ),
                            child: SingleChildScrollView(
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  HorizontalListWidget(
                                    wrapAlignment: WrapAlignment.start,
                                    scrollType: Axis.vertical,
                                    itemCount: 0,
                                    itemBuilder: (context, index) {
                                      return const SizedBox.shrink();
                                    },
                                    list: controller.state.value.cities.map(
                                      (item) {
                                        return Container(
                                          padding: gPadding(bottom: 5),
                                          width: context.width / 2.25,
                                          child: FilterChip(
                                            label: TextWidget(item.label),
                                            selected: controller
                                                .state.value.citiesIds
                                                .contains(item.id),
                                            onSelected: (value) =>
                                                controller.setCitiy(
                                              citiyId: item,
                                            ),
                                          ),
                                        );
                                      },
                                    ).toList(),
                                  ),
                                  /* Wrap(
                                    spacing: 8,
                                    children: controller.state.value.cities.map(
                                      (item) {
                                        return FilterChip(
                                          label: TextWidget(item.label),
                                          selected: controller
                                              .state.value.citiesIds
                                              .contains(item.id),
                                          onSelected: (value) =>
                                              controller.setCitiy(
                                            citiyId: item,
                                          ),
                                        );
                                      },
                                    ).toList(),
                                  ), */
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                      dense: true,
                      contentPadding: gPaddingSymmetric(horizontal: 12),
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextWidget(Kstrings.city.tr, style: gStyle14()),
                          const Icon(
                            Icons.keyboard_arrow_down,
                            color: KColors.black,
                          ),
                        ],
                      ),
                    ),
                  ),
                  /*  controller.isCityErr
                      ? Padding(
                          padding: gPadding(top: 8, right: 10),
                          child: TextWidget(
                            Kstrings.pleaseFillThisField.tr,
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                            color: Colors.red.shade900,
                          ),
                        )
                      : const SizedBox.shrink(), */
                ],
              ),
            ),
            */
        //  if(controller.state.value.cities.isNotEmpty)
        ...[
          Expanded(
            child: controller.state.value.rxCitiy.isLoading
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextWidget(Kstrings.city.tr, style: gStyle14()),
                      15.sH,
                      ShimmerWidget(
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 1,
                              color: KColors.fillBorder,
                            ),
                            borderRadius: 6.radius,
                            color: KColors.fillColor,
                          ),
                          height: 50,
                          width: double.infinity,
                        ),
                      ),
                    ],
                  )
                : DropDownButtonWidget<CountryData>(
                    items: controller.state.value.cities
                        .map(
                          (element) => DropdownMenuItem(
                            value: element,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                TextWidget(
                                  element.label,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                Visibility(
                                  visible: controller.state.value.seclectedCitiy
                                      .contains(element),
                                  child: Icon(
                                    Icons.circle,
                                    size: 16.h,
                                    color: KColors.primary,
                                  ),
                                )
                              ],
                            ),
                          ),
                        )
                        .toList(),
                    onChanged: (value) => controller.setCitiy(citiyId: value!),
                    value: null,
                    title: Kstrings.city.tr,
                    subTitle: Kstrings.city.tr,
                  ),
          ),
        ]
      ],
    );
  }
}

class DropDownButtonWidget<T> extends StatelessWidget {
  const DropDownButtonWidget({
    super.key,
    required this.title,
    required this.subTitle,
    required this.items,
    this.onChanged,
    this.value,
  });
  final String title;
  final String subTitle;
  final List<DropdownMenuItem<T>>? items;
  final ValueChanged<T?>? onChanged;
  final T? value;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextWidget(
          title,
          style: gStyle14(fontWeight: FontWeight.w500),
        ),
        15.sH,
        DropdownButtonFormField<T>(
          isExpanded: true,
          isDense: true,
          elevation: 2,
          icon: Icon(CupertinoIcons.chevron_down, size: 18.h),
          value: value,
          borderRadius: 10.radius,
          validator: (value) {
            if (value == null) {
              return 'The field is required.'.tr;
            }
            return null;
          },
          decoration: InputDecoration(
            contentPadding: gPaddingSymmetric(horizontal: 15, vertical: 15),
            border: OutlineInputBorder(
              borderRadius: 10.radius,
              borderSide: const BorderSide(
                color: KColors.fillBorder,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: 10.radius,
              borderSide: const BorderSide(color: KColors.fillBorder),
            ),
          ),
          style: gStyle14(),
          hint: TextWidget(
            subTitle,
            style: gStyle12(color: KColors.textGray),
          ),
          items: items,
          onChanged: onChanged,
        ),
      ],
    );
  }
}

class _CheckBoxTextWidget extends StatelessWidget {
  const _CheckBoxTextWidget({
    required this.text,
    required this.value,
    required this.onChanged,
    // ignore: unused_element
    this.padding,
  });
  final String text;
  final bool value;
  final EdgeInsetsGeometry? padding;
  final void Function(bool?)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding ?? gPadding(bottom: 5),
      width: context.width / 2.25,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Checkbox.adaptive(
            visualDensity: VisualDensity.adaptivePlatformDensity,
            value: value,
            fillColor: MaterialStateProperty.all(Colors.transparent),
            side: MaterialStateBorderSide.resolveWith((states) {
              if (states.contains(MaterialState.pressed)) {
                return BorderSide(
                    color: value ? KColors.primary : KColors.textGray);
              } else {
                return BorderSide(
                    color: value ? KColors.primary : KColors.textGray);
              }
            }),
            activeColor: KColors.primary,
            checkColor: KColors.primary,
            focusColor: KColors.transparent,
            hoverColor: KColors.transparent,
            overlayColor: MaterialStateProperty.all(KColors.transparent),
            shape: RoundedRectangleBorder(
              borderRadius: 4.radius,
              side: const BorderSide(color: KColors.primary),
            ),
            onChanged: onChanged,
          ),
          Expanded(
            child: TextWidget(
              text,
              overflow: TextOverflow.ellipsis,
              style: gStyle16(
                color: value ? KColors.black : KColors.textGray,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _RatingContent extends StatelessWidget {
  const _RatingContent({
    required this.value,
    required this.title,
    required this.radioValue,
    required this.radioGroupValue,
    required this.onChanged,
  });
  final double value;
  final String title;
  final bool radioValue, radioGroupValue;
  final void Function(bool?) onChanged;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        RatingBar.builder(
          initialRating: value,
          minRating: .5,
          direction: Axis.horizontal,
          ignoreGestures: true,
          itemCount: 5,
          itemSize: 20.r,
          itemBuilder: (context, _) =>
              const Icon(Icons.star, color: KColors.primary),
          onRatingUpdate: (rating) {
            //debugPrint(rating.toString());
          },
        ),
        10.sW,
        TextWidget(title, style: gStyle12()),
        const Spacer(),
        Radio(
          value: radioValue,
          groupValue: radioGroupValue,
          activeColor: KColors.primary,
          onChanged: onChanged,
        ),
      ],
    );
  }
}
