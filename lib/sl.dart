import 'index.dart';

// final GetIt sl = GetIt.instance;
Future<void> injection() async {
  final prefs = await SharedPreferences.getInstance();
  Get.lazyPut<SharedPreferences>(() => prefs, fenix: true);
  Get.lazyPut<AppPreferences>(() => AppPreferences(prefs), fenix: true);
  Get.lazyPut(() => InternetConnectionChecker(), fenix: true);

  Get.lazyPut<NetworkInfo>(
    () => NetworkInfoImpl(internetConnectionChecker: Get.find()),
    fenix: true,
  );
  // sl.registerSingletonAsync<NotificationService>(
  //   () => NotificationService().init(),
  // );
  // Get.putAsync(() => NotificationService().init());

//?   <<<<<<<<<<<<<<<<<<<<<<<<   Notification  >>>>>>>>>>>>>>>>>>>>>>>>>>>>>
  // register
  Get.lazyPut<GetNotificationUseCase>(
    () => GetNotificationUseCase(Get.find<NotificationRepositoryImp>()),
    fenix: true,
  );
  Get.lazyPut<CountUnreadNotificationsUseCase>(
    () =>
        CountUnreadNotificationsUseCase(Get.find<NotificationRepositoryImp>()),
    fenix: true,
  );
  Get.lazyPut<BlockNotificationUseCase>(
    () => BlockNotificationUseCase(Get.find<NotificationRepositoryImp>()),
    fenix: true,
  );
//?   <<<<<<<<<<<<<<<<<<<<<<<<   Authentication   >>>>>>>>>>>>>>>>>>>>>>>>>>>>>
  Get.lazyPut<ChangeLangUseCase>(
    () => ChangeLangUseCase(Get.find<AuthenticationRepositoryImp>()),
    fenix: true,
  );
  // register
  Get.lazyPut<RegisterUseCase>(
    () => RegisterUseCase(Get.find<AuthenticationRepositoryImp>()),
    fenix: true,
  );
  Get.lazyPut<VerifyRegisterCodeUseCase>(
    () => VerifyRegisterCodeUseCase(Get.find<AuthenticationRepositoryImp>()),
    fenix: true,
  );

  // login
  Get.lazyPut<LoginUseCase>(
    () => LoginUseCase(Get.find<AuthenticationRepositoryImp>()),
    fenix: true,
  );

  // forget_password
  Get.lazyPut<ResetPasswordUseCase>(
    () => ResetPasswordUseCase(Get.find<AuthenticationRepositoryImp>()),
    fenix: true,
  );
  Get.lazyPut<VerifyEmailUseCase>(
    () => VerifyEmailUseCase(Get.find<AuthenticationRepositoryImp>()),
    fenix: true,
  );
  Get.lazyPut<VerifyCodeUseCase>(
    () => VerifyCodeUseCase(Get.find<AuthenticationRepositoryImp>()),
    fenix: true,
  );
  Get.lazyPut<ResendCodeUseCase>(
    () => ResendCodeUseCase(Get.find<AuthenticationRepositoryImp>()),
    fenix: true,
  );
  Get.lazyPut<EmailAddressUseCase>(
    () => EmailAddressUseCase(Get.find<AuthenticationRepositoryImp>()),
    fenix: true,
  );
  Get.lazyPut<GetAboutUsUseCase>(
    () => GetAboutUsUseCase(Get.find<AuthenticationRepositoryImp>()),
    fenix: true,
  );

//*   <<<<<<<<<<<<<<<<<<<<<<<<   public >> My account   >>>>>>>>>>>>>>>>>>>>>>>>>>>>>
  Get.lazyPut<UpdatePasswordUsecase>(
    () => UpdatePasswordUsecase(Get.find<AuthenticationRepositoryImp>()),
    fenix: true,
  );
  Get.lazyPut<GetUserUseCase>(
    () => GetUserUseCase(repo: Get.find<AuthenticationRepositoryImp>()),
    fenix: true,
  );

  Get.lazyPut<UpdateProfileUseCase>(
    () => UpdateProfileUseCase(Get.find<AuthenticationRepositoryImp>()),
    fenix: true,
  );
//*  <<<<<<<<<<<<<<<<<<<<<<<<   Main >> ads   >>>>>>>>>>>>>>>>>>>>>>>>>>>>>
  Get.lazyPut<GetAllAdsUseCase>(
    () => GetAllAdsUseCase(Get.find<ServiceRepositoryImp>()),
    fenix: true,
  );
  Get.lazyPut<HideAdsUseCase>(
    () => HideAdsUseCase(Get.find<ServiceRepositoryImp>()),
    fenix: true,
  );
//*  <<<<<<<<<<<<<<<<<<<<<<<<   Main >> Home   >>>>>>>>>>>>>>>>>>>>>>>>>>>>>
  Get.lazyPut<GetHomeUseCase>(
    () => GetHomeUseCase(Get.find<HomeRepositoryImp>()),
    fenix: true,
  );
  Get.lazyPut<DeleteAccountUseCase>(
    () => DeleteAccountUseCase(Get.find<HomeRepositoryImp>()),
    fenix: true,
  );
  Get.lazyPut<LogOutUseCase>(
    () => LogOutUseCase(Get.find<HomeRepositoryImp>()),
    fenix: true,
  );
  Get.lazyPut<SendComplaintUseCase>(
    () => SendComplaintUseCase(Get.find<HomeRepositoryImp>()),
    fenix: true,
  );
//*  <<<<<<<<<<<<<<<<<<<<<<<<   Main >> Caht   >>>>>>>>>>>>>>>>>>>>>>>>>>>>>

  Get.lazyPut<GetChatByVendorUseCase>(
    () => GetChatByVendorUseCase(Get.find<ChatRepositoryImp>()),
    fenix: true,
  );
  Get.lazyPut<GetAllChatsUseCase>(
    () => GetAllChatsUseCase(Get.find<ChatRepositoryImp>()),
    fenix: true,
  );
  Get.lazyPut<SendMessageUseCase>(
    () => SendMessageUseCase(Get.find<ChatRepositoryImp>()),
    fenix: true,
  );
  Get.lazyPut<ContactUsUseCase>(
    () => ContactUsUseCase(Get.find<AuthenticationRepositoryImp>()),
    fenix: true,
  );

  //* <<<<<<<<<<<<<<<<<<<<<<<<   chat >> pusher   >>>>>>>>>>>>>>>>>>>>>>>>>>>>>

  Get.lazyPut<InitPusherUseCase>(
    () => InitPusherUseCase(repo: Get.find<PusherRepositoryImp>()),
    fenix: true,
  );
  Get.lazyPut<SubscribeChatUseCase>(
    () => SubscribeChatUseCase(repo: Get.find<PusherRepositoryImp>()),
    fenix: true,
  );
  Get.lazyPut<UnSubscribeChatUseCase>(
    () => UnSubscribeChatUseCase(repo: Get.find<PusherRepositoryImp>()),
    fenix: true,
  );
  Get.lazyPut<ListenToChatUseCase>(
    () => ListenToChatUseCase(repo: Get.find<PusherRepositoryImp>()),
    fenix: true,
  );
  Get.lazyPut<DisconnectPusherUseCase>(
    () => DisconnectPusherUseCase(repo: Get.find<PusherRepositoryImp>()),
    fenix: true,
  );

  //* <<<<<<<<<<<<<<<<<<<<<<<<   service >> AllVendors   >>>>>>>>>>>>>>>>>>>>>>>>>>>>>

  Get.lazyPut<GetAllVendorsUseCase>(
    () => GetAllVendorsUseCase(Get.find<ServiceRepositoryImp>()),
    fenix: true,
  );
  Get.lazyPut<GetOfficeConsultaionsUseCase>(
    () => GetOfficeConsultaionsUseCase(Get.find<ServiceRepositoryImp>()),
    fenix: true,
  );
  Get.lazyPut<GetAllCategoriesUseCase>(
    () => GetAllCategoriesUseCase(Get.find<ServiceRepositoryImp>()),
    fenix: true,
  );
  Get.lazyPut<GetSupCategoriesUseCase>(
    () => GetSupCategoriesUseCase(Get.find<ServiceRepositoryImp>()),
    fenix: true,
  );
  Get.lazyPut<GetCountryUseCase>(
    () => GetCountryUseCase(Get.find<ServiceRepositoryImp>()),
    fenix: true,
  );
  Get.lazyPut<GetCityByIdUseCase>(
    () => GetCityByIdUseCase(Get.find<ServiceRepositoryImp>()),
    fenix: true,
  );
  //* <<<<<<<<<<<<<<<<<<<<<<<<   service >> Vendors Detailes   >>>>>>>>>>>>>>>>>>>>>>>>>>>>>
  Get.lazyPut<GetVendorCommintsUseCase>(
    () => GetVendorCommintsUseCase(Get.find<ServiceRepositoryImp>()),
    fenix: true,
  );
  Get.lazyPut<AddVendorCommintsUseCase>(
    () => AddVendorCommintsUseCase(Get.find<ServiceRepositoryImp>()),
    fenix: true,
  );

  //* <<<<<<<<<<<<<<<<<<<<<<<<   service >> my ads   >>>>>>>>>>>>>>>>>>>>>>>>>>>>>
  Get.lazyPut<CreateAdsUseCase>(
    () => CreateAdsUseCase(Get.find<AdsRepositoryImp>()),
    fenix: true,
  );
  Get.lazyPut<UpdateAdvertisementsUseCase>(
    () => UpdateAdvertisementsUseCase(Get.find<AdsRepositoryImp>()),
    fenix: true,
  );
  Get.lazyPut<DeleteAdvertisementsUseCase>(
    () => DeleteAdvertisementsUseCase(Get.find<AdsRepositoryImp>()),
    fenix: true,
  );
  Get.lazyPut<GetMyAllAdsUseCase>(
    () => GetMyAllAdsUseCase(Get.find<AdsRepositoryImp>()),
    fenix: true,
  );

  //? RepositoryImp
  Get.lazyPut<NotificationRepositoryImp>(
    () => NotificationRepositoryImp(
        Get.find<NotificationClient>(), Get.find<AppPreferences>()),
    fenix: true,
  );
  Get.lazyPut<AuthenticationRepositoryImp>(
    () => AuthenticationRepositoryImp(
      Get.find<AuthClient>(),
      Get.find<AppPreferences>(),
    ),
    fenix: true,
  );
  Get.lazyPut<HomeRepositoryImp>(
    () => HomeRepositoryImp(Get.find<HomeClient>(), Get.find<AppPreferences>()),
    fenix: true,
  );
  Get.lazyPut<ChatRepositoryImp>(
    () => ChatRepositoryImp(Get.find<ChatClient>(), Get.find<AppPreferences>()),
    fenix: true,
  );
  Get.lazyPut<ServiceRepositoryImp>(
    () => ServiceRepositoryImp(
        Get.find<ServiceClient>(), Get.find<AppPreferences>()),
    fenix: true,
  );
  Get.lazyPut<PusherRepositoryImp>(
    () => PusherRepositoryImp(Get.find<PusherRemoteDataSourceImp>()),
    fenix: true,
  );
  Get.lazyPut<AdsRepositoryImp>(
    () => AdsRepositoryImp(Get.find<AdsClient>(), Get.find<AppPreferences>()),
    fenix: true,
  );

  //? Data sources
  Get.lazyPut<AuthClient>(
    () => AuthClient(intiDio),
    fenix: true,
  );
  Get.lazyPut<NotificationClient>(
    () => NotificationClient(intiDio),
    fenix: true,
  );
  Get.lazyPut<HomeClient>(
    () => HomeClient(intiDio),
    fenix: true,
  );
  Get.lazyPut<ChatClient>(
    () => ChatClient(intiDio),
    fenix: true,
  );
  Get.lazyPut<ServiceClient>(
    () => ServiceClient(intiDio),
    fenix: true,
  );
  Get.lazyPut<AdsClient>(
    () => AdsClient(intiDio),
    fenix: true,
  );

  final PusherChannelsFlutter pusher = PusherChannelsFlutter.getInstance();
  Get.lazyPut<PusherRemoteDataSourceImp>(
    () => PusherRemoteDataSourceImp(pusher: pusher),
    fenix: true,
  );
  await Get.putAsync<UserServiceImp>(
    () => UserServiceImp(getUserUseCase: Get.find<GetUserUseCase>()).init(),
  );
}
