import '/index.dart';

class MainState extends Equatable {
  const MainState({
    this.error = "",
    this.rx = RequestState.none,
    this.currentIndex = 0,
    this.currentScreen = const HomeView(),
    this.titl = const [
      Kstrings.home,
      Kstrings.msgs,
      Kstrings.advertisements,
      Kstrings.packages,
      Kstrings.myAccount,
    ],
    this.pages = const [
      HomeView(),
      AllChatsView(),
      AdvertisementsView(),
      VipView(),
      AccountView(),
    ],
    this.icons1 = const [
      Kimage.home,
      Kimage.messages1,
      Kimage.copy1,
      Kimage.discount1,
      Kimage.profile,
    ],
    this.icons2 = const [
      Kimage.home2,
      Kimage.messages2,
      Kimage.copy2,
      Kimage.discount2,
      Kimage.profile2,
    ],
  });
  final String error;
  final RequestState rx;
  final int currentIndex;
  final Widget currentScreen;
  final List<String> titl;
  final List<Widget> pages;
  final List<String> icons1;
  final List<String> icons2;

  MainState copyWith({
    String? error,
    RequestState? rx,
    int? currentIndex,
    Widget? currentScreen,
    List<String>? titl,
    List<Widget>? pages,
    List<String>? icons1,
    List<String>? icons2,
  }) =>
      MainState(
        error: error ?? this.error,
        rx: rx ?? this.rx,
        currentIndex: currentIndex ?? this.currentIndex,
        currentScreen: currentScreen ?? this.currentScreen,
        titl: titl ?? this.titl,
        pages: pages ?? this.pages,
        icons1: icons1 ?? this.icons1,
        icons2: icons2 ?? this.icons2,
      );

  @override
  List<Object?> get props =>
      [error, rx, currentIndex, currentScreen, titl, pages, icons1, icons2];
}
