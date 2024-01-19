import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:nb_utils/nb_utils.dart';

import '/index.dart';

class CustomerInquiriesView extends StatelessWidget {
  const CustomerInquiriesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const _BottomNavigationBar(),
      appBar: BuildAppBar(title: Kstrings.customerInquiries.tr),
      body: SafeArea(
        child: ListView(
          padding: gPadding(top: 30, right: 16, left: 16),
          children: [
            AuthHeader(
              title: Kstrings.customerInquiriesTitle.tr,
              supTitle: Kstrings.customerInquiriesSup.tr,
              padLef: 0,
              padding: gPadding(left: 0, bottom: 34),
            ),
            const _BuildCustomerInquiriesBody(),
          ],
        ),
      ),
    );
  }
}

class _BottomNavigationBar extends GetView<CustomerInquiriesControllerImp> {
  const _BottomNavigationBar();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          BtnWidget(
            margin: gPaddingAll(16),
            title: Kstrings.send.tr,
            rx: controller.state.value.rx,
            onTap: () => controller.sendComplaint(),
          ),
        ],
      ),
    );
  }
}

class _BuildCustomerInquiriesBody
    extends GetView<CustomerInquiriesControllerImp> {
  const _BuildCustomerInquiriesBody();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Form(
        key: controller.state.value.formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomDropDownButton<CategoriesEntity>(
              title: Kstrings.choseService.tr,
              subTitle: Kstrings.choseService.tr,
              value: controller.state.value.selectedService,
              items: UserServiceImp.to.categories.value
                  .map(
                    (e) => DropdownMenuItem(
                      value: e,
                      enabled: e.isActive ?? false,
                      child: TextWidget(
                        e.name.capitalizeFirst,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  )
                  .toList(),
              onChanged: (service) =>
                  controller.selectedService(service: service),
            ),
            16.sH,
            TextInputWidget(
              Kstrings.complaintText.tr,
              controller: controller.state.value.complaint,
              hintText: Kstrings.writeHere.tr,
              keyboardType: TextInputType.text,
              fillColor: KColors.transparent,
              maxLines: 10,
              validator: (value) => Utils.inputValidator("$value"),
            ),
            16.sH,
            SelectImagesContent(
              title: Kstrings.addImage.tr,
              cancelCallback: () => controller.cancelImg(),
              image: controller.state.value.selectedImage?.value,
              selectCallback: () => controller.pickPicture(),
              // isError: ,
            ),
            24.sH,
          ],
        ),
      ),
    );
  }
}

class BuildAppBar extends StatelessWidget implements PreferredSizeWidget {
  const BuildAppBar({
    super.key,
    required this.title,
    this.actions,
    this.centerTitle = true,
    this.padding,
  });
  final String title;
  final bool centerTitle;
  final List<Widget>? actions;
  final EdgeInsetsGeometry? padding;
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: TextWidget(
        title,
        style: gStyle16(fontWeight: FontWeight.w700),
      ),
      centerTitle: centerTitle,
      actions: actions,
    );
  }
}

class BuildSilverAppBar extends StatelessWidget implements PreferredSizeWidget {
  const BuildSilverAppBar({
    super.key,
    required this.title,
    this.actions,
    this.padding,
  });
  final String title;
  final List<Widget>? actions;
  final EdgeInsetsGeometry? padding;
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
  @override
  Widget build(BuildContext context) => SliverAppBar(
        expandedHeight: 0,
        pinned: false,
        actions: actions,
        flexibleSpace: FlexibleSpaceBar(
          centerTitle: true,
          title: TextWidget(
            title,
            style: gStyle16(fontWeight: FontWeight.w700),
          ),
        ),
      );
}

class SelectImagesContent extends StatelessWidget {
  const SelectImagesContent({
    super.key,
    required this.title,
    this.subTitle,
    this.image,
    this.adsImage,
    this.selectCallback,
    this.cancelCallback,
    this.isError = false,
  });
  final String title;
  final String? subTitle, adsImage;
  final File? image;
  final VoidCallback? selectCallback, cancelCallback;
  final bool isError;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextWidget(
              title.tr,
              style: gStyle14(
                fontWeight: FontWeight.w500,
                color: isError ? Colors.red.shade800 : KColors.textColor,
              ),
            ),
            if (image != null)
              ImageWidget(
                path: Kimage.cancel,
                onTap: cancelCallback,
                height: 16,
                color: KColors.red,
              ),
          ],
        ),
        15.height,
        InkWell(
          onTap: selectCallback,
          child: DottedBorder(
            strokeWidth: 1.5.w,
            dashPattern: const [3],
            radius: 8.radiusCircular,
            color: isError ? Colors.red.shade800 : KColors.primary,
            child: DecoratedBox(
              decoration: BoxDecoration(borderRadius: 8.radius),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 500),
                curve: Curves.fastOutSlowIn,
                padding: image != null || adsImage != null
                    ? gPadding()
                    : gPaddingSymmetric(vertical: 40),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: isError
                      ? KColors.red.withOpacity(0.075)
                      : KColors.primary.withOpacity(0.075),
                ),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.fastOutSlowIn,
                  // switchOutCurve: Curves.easeInBack,
                  // transitionBuilder: (child, animation) =>
                  //     ScaleTransition(scale: animation, child: child,),
                  child: Container(
                    constraints: !(image != null || adsImage != null)
                        ? const BoxConstraints()
                        : BoxConstraints(
                            maxHeight: ScreenUtil().screenHeight / 3,
                            maxWidth: double.infinity,
                          ),
                    child: image != null
                        ? Image.file(image!, fit: BoxFit.fill)
                        : adsImage != null
                            ? ImageWidget(path: adsImage, fit: BoxFit.fill)
                            : Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  ImageWidget(
                                    path: Kimage.galleryAdd,
                                    height: 25.h,
                                    width: 25.w,
                                  ),
                                  10.sH,
                                  TextWidget(
                                    subTitle ??
                                        Kstrings.addImageSup.tr.toLowerCase(),
                                    textAlign: TextAlign.center,
                                    style: gStyle12(color: KColors.textGray2),
                                  ),
                                ],
                              ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
