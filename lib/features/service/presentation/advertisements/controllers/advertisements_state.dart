import '/index.dart';

class AdvertisementsState extends Equatable {
  const AdvertisementsState({ 
    this.rx = RequestState.loading,
    this.rxHideAds = RequestState.none,
    this.allAds = const [],
    this.currentPage = 1,
    this.meta,
    required this.scrCtrl,
    required this.refCtrl,
  });
  final RequestState rx, rxHideAds;

  final List<AdsEntity> allAds;
  final MetaDataModel? meta;
  final ScrollController scrCtrl;
  final EasyRefreshController refCtrl;
  final int currentPage;

  AdvertisementsState copyWith({
    AllAdsEntity? allAdsEntity,
    RequestState? rx,
    RequestState? rxHideAds,
    List<AdsEntity>? allAds,
    MetaDataModel? meta,
    ScrollController? scrCtrl,
    int? currentPage,
    EasyRefreshController? refCtrl,
  }) =>
      AdvertisementsState(
        refCtrl: refCtrl ?? this.refCtrl,
        currentPage: currentPage ?? this.currentPage,
        allAds: allAds ?? this.allAds,
        meta: meta ?? this.meta,
        scrCtrl: scrCtrl ?? this.scrCtrl,
        rxHideAds: rxHideAds ?? this.rxHideAds,
        rx: rx ?? this.rx,
      );
  @override
  List<Object?> get props => [
        rxHideAds,
        allAds,
        scrCtrl,
        meta,
        currentPage,
        rx,
        refCtrl,
      ];
}
