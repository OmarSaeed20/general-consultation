// ignore_for_file: unused_element

part of 'message_body.dart';

class CardTextFieldContent2 extends GetView<ChatControllerImp> {
  const CardTextFieldContent2({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          AnimatedSize(
            curve: Curves.easeOutQuint,
            duration: const Duration(milliseconds: 500),
            child: (controller.state.value.isImageDraft ||
                    controller.state.value.isRecordDraft)
                ? Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      // record && image
                      if (controller.state.value.isImageDraft) ...[
                        DraftedImage(controller: controller),
                        IsImageDraftAction(controller: controller),
                      ] else ...[
                        DraftedRecord(controller: controller),
                        IsRecordDraftAction(controller: controller),
                      ],
                    ],
                  )
                : // Text Field
                AnimatedContainer(
                    duration: const Duration(seconds: 1),
                    curve: Curves.fastLinearToSlowEaseIn,
                    margin: gPadding(right: 10, left: 10, bottom: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Expanded(
                          child: AnimatedSwitcher(
                            switchInCurve: Curves.fastLinearToSlowEaseIn,
                            switchOutCurve: Curves.fastEaseInToSlowEaseOut,
                            duration: const Duration(seconds: 1),
                            transitionBuilder: (child, animation) =>
                                FadeTransition(
                              opacity: animation,
                              child: SlideTransition(
                                position: Tween<Offset>(
                                  begin: const Offset(1.0, 5.0),
                                  end: Offset.zero,
                                ).animate(animation),
                                child: child,
                              ),
                            ),
                            child: AnimatedSize(
                              duration: const Duration(seconds: 1),
                              curve: Curves.fastLinearToSlowEaseIn,
                              child: controller.state.value.isRecording
                                  ? _IsRecordingState(ctrl: controller)
                                  : _ChatTextField(
                                      fillColor: KColors.fillColor2,
                                      borderRadius: 30,
                                      hintText: Kstrings.writeHere.tr,
                                      // enabled: !controller.state.value.isRecording,
                                      prefixIcon: ImageWidget(
                                        path: Kimage.gallery,
                                        onTap: () => controller.pickImage(),
                                      ),
                                      /*   onChanged: (p0) => controller.state(
                                          controller.state.value.copyWith(
                                        showSend: !p0.valide().isEmptyOrNul,
                                      )), */
                                      textEditingController:
                                          controller.state.value.msgCtrl,
                                      isTitle: false,
                                      suffixIcon: ImageWidget(
                                        path: Kimage.microphone,
                                        color:
                                            controller.state.value.isRecording
                                                ? KColors.primary
                                                : null,
                                        onTap: () =>
                                            controller.toggleRecorder(),
                                        height: 20,
                                      ),
                                    ),
                            ),
                          ),
                        ),
                        if (!controller.state.value.isRecording)
                          if (controller.state.value.showSend)
                            AnimatedContainer(
                              duration: const Duration(seconds: 1),
                              curve: Curves.fastLinearToSlowEaseIn,
                              padding: gPadding(
                                right: !controller.state.value.rxsend.isLoading
                                    ? 0
                                    : 10,
                                left: !controller.state.value.rxsend.isLoading
                                    ? 0
                                    : 10,
                              ),
                              child: !controller.state.value.rxsend.isLoading
                                  ? ImageWidget(
                                      onTap: () => controller.sendMessage(),
                                      path: Kimage.send,
                                      color: KColors.primary,
                                    )
                                  : const LoadingWidget(strokeWidth: 3.0),
                            ),
                      ],
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}

class _ChatTextField extends StatelessWidget {
  const _ChatTextField({
    this.prefixIcon,
    this.hintText,
    this.labelText,
    this.maxLength,
    this.prefixText,
    this.validator,
    this.suffixIcon,
    this.suffix,
    this.isMultiLine = false,
    this.expands = false,
    this.isObscure = false,
    this.textEditingController,
    this.hintStyle,
    this.prefixIconConstraints,
    this.isNumberOnly = false,
    this.onTap,
    this.onTapOutside,
    this.onChanged,
    this.readOnly = false,
    this.enabled = true,
    this.isTitle = false,
    this.keyboardType,
    this.fillColor,
    this.titleText,
    this.borderRadius = 8,
    this.borderColor = const Color(0xffE2E2E2),
  });
  final Widget? prefixIcon, labelText, suffixIcon, suffix;
  final String? hintText, prefixText, titleText;
  final int? maxLength;
  final String? Function(String?)? validator;
  final TextStyle? hintStyle;
  final BoxConstraints? prefixIconConstraints;
  final TextEditingController? textEditingController;
  final Function(String)? onChanged;
  final GestureTapCallback? onTap;
  final Function(PointerDownEvent)? onTapOutside;
  final TextInputType? keyboardType;
  final Color? fillColor, borderColor;
  final double? borderRadius;
  final bool isMultiLine,
      expands,
      isTitle,
      isNumberOnly,
      readOnly,
      enabled,
      isObscure;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (isTitle)
          Column(
            children: [
              TextWidget(
                titleText!,
                style: gStyle14(fontWeight: FontWeight.w500),
              ),
            ],
          ),
        12.sH,
        TextFormField(
          maxLines: isMultiLine ? null : 1,
          minLines: isMultiLine ? maxLength : null,
          validator: validator,
          controller: textEditingController,
          enabled: enabled,
          expands: expands,
          readOnly: readOnly,
          obscureText: isObscure,
          onChanged: onChanged,
          onTapOutside: onTapOutside,
          onTap: onTap,
          keyboardType: isNumberOnly
              ? const TextInputType.numberWithOptions(decimal: true)
              : keyboardType,
          inputFormatters: [
            if (isNumberOnly)
              FilteringTextInputFormatter.allow(RegExp(r'(^\d*\.?\d*)'))
          ],
          cursorColor: KColors.primary,
          decoration: InputDecoration(
            fillColor: fillColor,
            filled: fillColor == null ? false : true,
            suffixIcon: suffixIcon,
            errorStyle: Theme.of(context)
                .textTheme
                .labelMedium
                ?.copyWith(color: KColors.red),
            hintText: hintText,
            label: labelText,
            suffix: suffix,
            hintStyle: hintStyle ?? gStyle16(color: Colors.grey),
            contentPadding: gPaddingSymmetric(horizontal: 12, vertical: 13),
            prefixIcon: prefixIcon,
            prefixIconConstraints: prefixIconConstraints,
            prefixText: prefixText ?? "",
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: borderRadius!.radius,
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: borderRadius!.radius,
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: borderRadius!.radius,
            ),
          ),
        ),
      ],
    );
  }
}

class _IsRecordingState extends StatelessWidget {
  const _IsRecordingState({required this.ctrl});

  final ChatControllerImp ctrl;

  @override
  Widget build(BuildContext context) => Material(
        type: MaterialType.card,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 350),
          margin: gPadding(right: 10, left: 10),
          decoration: BoxDecoration(
            borderRadius: 30.radius,
            color: KColors.fillColor,
            border: Border.all(width: 0.3.w, color: KColors.fillBorder),
          ),
          padding: gPadding(right: 10),
          child: Row(
            children: [
              Expanded(
                child: TextWidget(
                  '00:${ctrl.state.value.counter.toString().padLeft(2, '0')}',
                  style: gStyle14(
                    fontWeight: FontWeight.w600,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ),
              /* Expanded(
                child: TxtBtn(
                  Icon(
                    CupertinoIcons.delete_solid,
                    color: KColors.redAccount,
                    size: 20.h,
                  ),
                  shape: const WidgetStatePropertyAll(CircleBorder()),
                  onTap: () => ctrl.removeRecorder(),
                ),
              ), */
              Expanded(
                flex: 4,
                child: AudioWaveforms(
                  enableGesture: true,
                  size: Size(context.width, 45.h),
                  recorderController: ctrl.state.value.recCtrl,
                  shouldCalculateScrolledPosition: true,
                  waveStyle: const WaveStyle(
                    waveColor: KColors.primaryDark,
                    extendWaveform: true,
                    showMiddleLine: false,
                  ),
                  decoration: const BoxDecoration(color: KColors.transparent),
                ),
              ),
              Expanded(
                child: TxtBtn(
                  const Icon(CupertinoIcons.pause_fill),
                  shape: const WidgetStatePropertyAll(CircleBorder()),
                  onTap: () => ctrl.toggleRecorder(),
                ),
              ),
            ],
          ),
        ),
      );
}

class IsImageDraftAction extends StatelessWidget {
  const IsImageDraftAction({super.key, required this.controller});

  final ChatControllerImp controller;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(seconds: 1),
      curve: Curves.fastLinearToSlowEaseIn,
      // height: controller.state.value.imgHeightAction.h,
      child: AnimatedSize(
        duration: const Duration(seconds: 1),
        curve: Curves.fastLinearToSlowEaseIn,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            if (controller.state.value.isImageDraft) ...[
              Expanded(
                child: BtnWidget(
                  textStyle: gStyle14(
                    color: KColors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                  onTap: () => controller.removeImage(),
                  backgroundColor: KColors.transparent,
                  border: Border.all(),
                  child: Icon(
                    CupertinoIcons.delete_solid,
                    color: KColors.redAccount,
                    size: 20.h,
                  ),
                ),
              ),
              Expanded(
                child: BtnWidget(
                  textStyle: gStyle14(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                  rx: controller.state.value.rxsend,
                  onTap: () => controller.sendMessage(),
                  child: ImageWidget(
                    path: Kimage.send,
                    color: KColors.primary,
                    height: 20.h,
                  ),
                ),
              ),
            ]
          ],
        ),
      ),
    );
  }
}

class IsRecordDraftAction extends StatelessWidget {
  const IsRecordDraftAction({super.key, required this.controller});

  final ChatControllerImp controller;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(seconds: 1),
      curve: Curves.fastLinearToSlowEaseIn,
      // height: controller.state.value.recHeightAction.h,
      child: AnimatedSize(
        duration: const Duration(seconds: 1),
        curve: Curves.fastLinearToSlowEaseIn,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            if (controller.state.value.isRecordDraft) ...[
              Expanded(
                child: BtnWidget(
                  onTap: () => controller.removeRecorder(),
                  backgroundColor: KColors.transparent,
                  border: Border.all(),
                  child: Icon(
                    CupertinoIcons.delete_solid,
                    color: KColors.redAccount,
                    size: 20.h,
                  ),
                ),
              ),
              Expanded(
                child: BtnWidget(
                  rx: controller.state.value.rxsend,
                  onTap: () => controller.sendMessage(),
                  child: ImageWidget(
                    path: Kimage.send,
                    color: KColors.primary,
                    height: 20.h,
                  ),
                ),
              ),
            ]
          ],
        ),
      ),
    );
  }
}

class DraftedRecord extends StatelessWidget {
  const DraftedRecord({super.key, required this.controller});

  final ChatControllerImp controller;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(seconds: 1),
      curve: Curves.fastLinearToSlowEaseIn,
      decoration: BoxDecoration(
        // color: KColors.fillColor,
        border: Border.all(width: .5.w, color: KColors.transparent),
      ),
      height: controller.state.value.isRecordDraft ? 80.h : 0,
      margin: gPadding(top: 10),
      alignment: Alignment.center,
      child: AnimatedSize(
        duration: const Duration(seconds: 1),
        curve: Curves.fastLinearToSlowEaseIn,
        child: ChatVoiceBody(
          audioSrc: controller.state.value.voice?.value?.path,
          isMe: true,
          dateTime: DateTime.now().toString(),
          isFile: true,
        ),
      ),
    );
  }
}

class DraftedImage extends StatelessWidget {
  const DraftedImage({super.key, required this.controller});

  final ChatControllerImp controller;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(seconds: 1),
      curve: Curves.fastLinearToSlowEaseIn,
      decoration: BoxDecoration(
        color: KColors.fillColor,
        borderRadius: BorderRadius.only(
          topRight: 8.radiusCircular,
          topLeft: 8.radiusCircular,
        ),
      ),
      height: controller.state.value.imgHeight.h,
      padding: gPadding(
        top: 8,
        right: 8,
        left: 8,
      ),
      child: AnimatedSize(
        duration: const Duration(seconds: 1),
        curve: Curves.fastLinearToSlowEaseIn,
        child: Stack(
          children: [
            if (controller.state.value.isImageDraft)
              ClipRRect(
                borderRadius: BorderRadius.only(
                  topRight: 8.radiusCircular,
                  topLeft: 8.radiusCircular,
                ),
                child: PhotoView(
                  maxScale: PhotoViewComputedScale.covered * 2.0,
                  minScale: PhotoViewComputedScale.contained * 0.8,
                  initialScale: PhotoViewComputedScale.covered,
                  imageProvider:
                      FileImage(controller.state.value.image!.value!),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
