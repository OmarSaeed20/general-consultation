// import 'dart:developer';
import 'dart:io';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import '/index.dart';
import 'package:permission_handler/permission_handler.dart';
import '/sl.dart' as di;
// import 'package:timeago/timeago.dart' as timeago;

class NotificationService extends GetxService with EquatableMixin {
  // static NotificationService get to => Get.find<NotificationService>();

  Future<NotificationService> init() async {
    if (Platform.isAndroid) {
      var status = await Permission.notification.request();
      if (status != PermissionStatus.granted) {
        status = await Permission.notification.request();
      }
    }
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
    FirebaseMessaging.onMessage.listen(showFlutterNotification);

    if (!kIsWeb) {
      await setupFlutterNotifications();
    }
    return this;
  }

  late AndroidNotificationChannel channel;
  late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;

  bool isFlutterLocalNotificationsInitialized = false;

  Map<String, dynamic>? data;
  Future<void> setupFlutterNotifications() async {
    if (isFlutterLocalNotificationsInitialized) {
      return;
    }
    channel = const AndroidNotificationChannel(
      'General Consultation',
      'General Consultation',
      importance: Importance.max,
      enableLights: true,
      playSound: true,
    );

    flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);

    final DarwinInitializationSettings initializationSettingsDarwin =
        DarwinInitializationSettings(
      requestAlertPermission: false,
      requestBadgePermission: false,
      requestSoundPermission: false,
      onDidReceiveLocalNotification: (
        int id,
        String? title,
        String? body,
        String? payload,
      ) async {},
    );

    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings("@mipmap/ic_launcher");
    final InitializationSettings initializationSettings =
        InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsDarwin,
    );
    await flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: notificationTapBackground,
      onDidReceiveBackgroundNotificationResponse: notificationTapBackground,
    );

    FirebaseMessaging messaging = FirebaseMessaging.instance;
    await messaging.requestPermission(
      sound: true,
      badge: true,
      alert: true,
      announcement: false,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
    );

    await messaging.setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );
    isFlutterLocalNotificationsInitialized = true;
  }

  void showFlutterNotification(RemoteMessage message) async {
    if (Get.currentRoute == Routes.chat ||
        Get.currentRoute == Routes.allChats) {
      return;
    }
    data = message.data;
    //debugPrint("========> ${Get.currentRoute}");

    RemoteNotification? notification = message.notification;
    AndroidNotification? android = message.notification?.android;
    if (notification != null && android != null && !kIsWeb) {
      flutterLocalNotificationsPlugin.show(
        notification.hashCode,
        notification.title,
        notification.body,
        NotificationDetails(
          android: AndroidNotificationDetails(
            channel.id,
            channel.name,
            channelDescription: channel.description,
            icon: "@mipmap/ic_launcher",
            importance: Importance.max,
            priority: Priority.high,
            playSound: true,
          ),
        ),
      );
    }
  }

  @override
  List<Object?> get props => [
        channel,
        flutterLocalNotificationsPlugin,
        isFlutterLocalNotificationsInitialized,
        data,
        // to,
      ];
}

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await di.injection();
  /* timeago.setLocaleMessages(
    LanguageService.to.savedLang.value ?? LocaleKeys.ar,
    timeago.ArMessages(),
  ); */
}

/* Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  await di.init();
  final instance = NotificationService.to;

  final NotificationDetails notificationDetails = NotificationDetails(
    android: AndroidNotificationDetails(
      instance.channel.id,
      instance.channel.name,
      channelDescription: instance.channel.description,
      // icon: "@mipmap/ic_launcher",
      importance: Importance.max,
      priority: Priority.high,
      playSound: true,
    ),
  );
  instance.flutterLocalNotificationsPlugin.show(
    message.data.hashCode,
    message.data["title"],
    message.data["body"],
    notificationDetails,
  );
} */

void notificationTapBackground(NotificationResponse notificationResponse) {
  // if (NotificationService.to.data != null) {
  //   log("NotificationService.to.data>>>> ${NotificationService.to.data}");
  // }
}
