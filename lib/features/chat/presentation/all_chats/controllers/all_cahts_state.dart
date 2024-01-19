import '/index.dart';

class AllChatsState extends Equatable {
  const AllChatsState({
    this.rx = RequestState.loading,
    this.allChats = const [],
    this.currentPage = 1,
    this.meta,
    required this.scrCtrl,
    required this.refCtrl,
  });

  final List<AllChatData> allChats;
  final MetaDataModel? meta;
  final ScrollController scrCtrl;
  final int currentPage;
  final RequestState rx; 
  final EasyRefreshController refCtrl;

  AllChatsState copyWith({
    List<AllChatData>? allChats,
    MetaDataModel? meta,
    ScrollController? scrCtrl,
    EasyRefreshController? refCtrl,
    int? currentPage,
    RequestState? rx,
  }) =>
      AllChatsState(
        refCtrl: refCtrl ?? this.refCtrl,
        meta: meta ?? this.meta,
        scrCtrl: scrCtrl ?? this.scrCtrl,
        currentPage: currentPage ?? this.currentPage,
        allChats: allChats ?? this.allChats,
        rx: rx ?? this.rx,
      );
  @override
  List<Object?> get props => [
        allChats,
        rx,
        currentPage,
        scrCtrl,
        meta,
        refCtrl,
      ];
}
