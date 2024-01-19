import '/index.dart';

class ServiceCategoriesState extends Equatable {
  const ServiceCategoriesState({
    required this.filter,
    required this.scrCtrl,
    required this.refCtrl,
    this.allVendors = const [],
    this.currentPage = 1,
    this.meta,
    this.isVertical = true,
    this.rx = RequestState.loading,
  });
  final List<VendorEntity> allVendors;
  final MetaDataModel? meta;
  final ScrollController scrCtrl;
  final int currentPage;
  final EasyRefreshController refCtrl;
  final FilterVendorParameter filter;
  final RequestState rx;
  final bool isVertical;

  ServiceCategoriesState copyWith({
    List<VendorEntity>? allVendors,
    MetaDataModel? meta,
    ScrollController? scrCtrl,
    int? currentPage,
    FilterVendorParameter? filter,
    bool? isVertical,
    RequestState? rx,
    EasyRefreshController? refCtrl,
  }) =>
      ServiceCategoriesState(
        filter: filter ?? this.filter,
        isVertical: isVertical ?? this.isVertical,
        allVendors: allVendors ?? this.allVendors,
        rx: rx ?? this.rx,
        meta: meta ?? this.meta,
        refCtrl: refCtrl ?? this.refCtrl,
        scrCtrl: scrCtrl ?? this.scrCtrl,
        currentPage: currentPage ?? this.currentPage,
      );

  @override
  List<Object?> get props => [
        filter,
        rx,
        isVertical,
        allVendors,
        currentPage,
        meta,
        scrCtrl,
        refCtrl,
      ];
}
