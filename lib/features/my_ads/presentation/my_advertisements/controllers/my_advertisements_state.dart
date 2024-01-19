import '/index.dart';

class MyAdvertisementsState extends Equatable {
  const MyAdvertisementsState({
    this.rx = RequestState.loading,
    this.rxDelete = RequestState.none,
    this.allAds = const [],
    this.currentPage = 1,
    this.meta,
    required this.scrCtrl,
    required this.refCtrl,
  });
  final RequestState rx, rxDelete;

  final List<MyAdsEntity> allAds;
  final MetaDataModel? meta;
  final ScrollController scrCtrl;
  final EasyRefreshController refCtrl;

  final int currentPage;

  MyAdvertisementsState copyWith({
    RequestState? rx,
    RequestState? rxDelete,
    List<MyAdsEntity>? allAds,
    MetaDataModel? meta,
    ScrollController? scrCtrl,
    EasyRefreshController? refCtrl,
    int? currentPage,
  }) =>
      MyAdvertisementsState(
        rxDelete: rxDelete ?? this.rxDelete,
        currentPage: currentPage ?? this.currentPage,
        allAds: allAds ?? this.allAds,
        meta: meta ?? this.meta,
        scrCtrl: scrCtrl ?? this.scrCtrl,
        refCtrl: refCtrl ?? this.refCtrl,
        rx: rx ?? this.rx,
      );
  @override
  List<Object?> get props =>
      [allAds, scrCtrl, meta, currentPage, rxDelete, rx, refCtrl];
}
