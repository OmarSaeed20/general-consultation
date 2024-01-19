import '/index.dart';

class NotificationsState extends Equatable {
  const NotificationsState({
    this.rx = RequestState.loading,
    this.notifications = const [],
    this.currentPage = 1,
    this.meta,
    this.countUnread = 0,
    required this.scrCtrl,
  });

  final List<NotificationData> notifications;
  final MetaDataModel? meta;
  final ScrollController scrCtrl;
  final int currentPage, countUnread;
  final RequestState rx;

  NotificationsState copyWith({
    List<NotificationData>? notifications = const [],
    MetaDataModel? meta,
    ScrollController? scrCtrl,
    int? currentPage,
    int? countUnread,
    RequestState? rx,
  }) =>
      NotificationsState(
        meta: meta ?? this.meta,
        scrCtrl: scrCtrl ?? this.scrCtrl,
        notifications: notifications ?? this.notifications,
        countUnread: countUnread ?? this.countUnread,
        currentPage: currentPage ?? this.currentPage,
        rx: rx ?? this.rx,
      );

  @override
  List<Object?> get props =>
      [notifications, countUnread, rx, currentPage, scrCtrl, meta];
}
