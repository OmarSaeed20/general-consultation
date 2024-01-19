import 'package:general_consultation/index.dart';

RequestState handleRxError(
  NetworkExceptions exceptions, {
  bool showTost = true,
  bool showError = false,
}) {
  String error = NetworkExceptions.getErrorMessage(exceptions);
  if (showTost) ToastManager.showError(error);
  if (showError) log("error is >>>> $error");
  return switch (exceptions) {
    NoInternetConnection() => RequestState.offLineFailure,
    _ => RequestState.error,
  };
}

RequestState handleRxLoading({bool isRef = false, int page = 1}) =>
    switch (isRef) {
      true => RequestState.loadingRef,
      false => switch (page) {
          1 => RequestState.loading,
          _ => RequestState.loadMore
        },
    };

RequestState handleRxSuccess({
  bool isRef = false,
  EasyRefreshController? refCtrl,
}) =>
    RequestState.success;

RequestState handleRxList<T>(List<T> responseList) => switch (responseList) {
      [] => RequestState.empty,
      _ => RequestState.success,
    };

List<T> handlePagenationResponse<T>({
  required List<T> responselist,
  required List<T> currentList,
  required int currentPage,
}) {
  if (currentList.isEmpty || currentPage == 1) return responselist;
  currentList.addAll(responselist);
  return currentList;
}

void handleScrListener({
  required ScrollController scrCtrl,
  required Function() fun,
  MetaDataModel? meta,
  int? last,
  int? current,
}) async {
  if (scrCtrl.offset >= scrCtrl.position.maxScrollExtent &&
      !scrCtrl.position.outOfRange) {
    if (meta != null) {
      if (meta.lastPage! > meta.currentPage!) await fun();
    } else {
      if (last! > current!) await fun();
    }
  }
}

void handleDisposeScrAndRefCtrl({
  required ScrollController scrCtrl,
  required void Function() fun,
  EasyRefreshController? refCtrl,
}) {
  scrCtrl.removeListener(fun);
  scrCtrl.dispose();
  if (refCtrl != null) refCtrl.dispose();
}

Future<void> handleOnRefresh({
  required EasyRefreshController controller,
  required Future<void> fun,
}) async {
  await controller.callRefresh();
  await fun;
  controller.resetHeader();
  // controller.resetFooter();
}

Future<void> handleOnLoad({required EasyRefreshController refCtrl}) async =>
// ? need mor handle
    refCtrl.finishLoad(IndicatorResult.noMore);

void handleRefFinish(
  bool isRef, {
  required EasyRefreshController refCtrl,
  bool success = true,
}) =>
    switch (isRef) {
      true => refCtrl.finishRefresh(
          switch (success) {
            true => IndicatorResult.success,
            false => IndicatorResult.fail,
          },
          true,
        ),
      false => () {},
    };
