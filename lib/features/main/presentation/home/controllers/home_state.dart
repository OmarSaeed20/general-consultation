import '/features/main/data/model/home_model.dart';
import '/index.dart';

class HomeState extends Equatable {
  const HomeState({
    required this.refCtrl,
    required this.scrCtrl,
    this.error = "",
    this.homeData,
    this.rx = RequestState.loading,
  });
  final String error;
  final RequestState rx;
  final HomeModel? homeData;
  final ScrollController scrCtrl;
  // final RefreshController refrController;
  final EasyRefreshController refCtrl;
  HomeState copyWith({
    String? error,
    RequestState? rx,
    HomeModel? homeData,
    // RefreshController? refrController,
    EasyRefreshController? refCtrl,
    ScrollController? scrCtrl,
  }) =>
      HomeState(
        scrCtrl: scrCtrl ?? this.scrCtrl,
        refCtrl: refCtrl ?? this.refCtrl,
        error: error ?? this.error,
        rx: rx ?? this.rx,
        homeData: homeData ?? this.homeData,
      );

  @override
  List<Object?> get props => [error, rx, homeData, refCtrl, scrCtrl];
}
