import 'package:general_consultation/index.dart';

class Commints extends StatelessWidget {
  const Commints({super.key, required this.controller});
  final ServiceDetailsControllerImp controller;
  @override
  Widget build(BuildContext context) {
    return !controller.state.value.rxCommints.isLoading
        ? ListView.builder(
            controller: controller.state.value.commintScrollContr,
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: controller.state.value.commints.length,
            itemBuilder: (context, i) =>
                _CommintWidget(commint: controller.state.value.commints[i]),
          )
        : const LoadingWidget();
  }
}

class _CommintWidget extends StatelessWidget {
  const _CommintWidget({required this.commint});

  final CommintData commint;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: gPaddingAll(16),
      decoration: BoxDecoration(
        border: Border.fromBorderSide(
          BorderSide(width: .3.w, color: KColors.fillBorder),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            dense: true,
            contentPadding: EdgeInsets.zero,
            leading: CircleImageNetWork(url: commint.image),
            title: TextWidget(
              commint.name,
              style: gStyle12(fontWeight: FontWeight.w700),
            ),
            subtitle: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextWidget(
                  commint.createdAt.formatDate,
                  style: gStyle14(
                    fontSize: 11,
                    color: KColors.textGray3,
                  ),
                ),
                RatingBar.builder(
                  initialRating: commint.rate!.toDouble(),
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  ignoreGestures: true,
                  itemCount: 5,
                  itemSize: 15.r,
                  itemPadding: gPadding(left: 2),
                  itemBuilder: (context, _) =>
                      const Icon(Icons.star, color: KColors.primary),
                  onRatingUpdate: (rating) {
                    //debugPrint(rating.toString());
                  },
                ),
              ],
            ),
          ),
          TextWidget(commint.message)
        ],
      ),
    );
  }
}
