import 'core/languages/ar_translations.dart';
import 'core/languages/en_translations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import '/core/util/theme.dart';
import '/index.dart';

class ConsultationApp extends StatelessWidget {
  const ConsultationApp({super.key});

  @override
  Widget build(BuildContext context) {
    // //debugPrint(">>>> ${UserServiceImp.to.currentUser.value?.blockNotification}");
    return AnnotatedRegion(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
      child: ScreenUtilInit(
        designSize: MediaQuery.sizeOf(context),
        minTextAdapt: true,
        splitScreenMode: true,
        useInheritedMediaQuery: true,
        ensureScreenSize: true,
        builder: (context, child) => GetMaterialApp(
          title: Kstrings.projectName,
          // smartManagement: SmartManagement.keepFactory,
          // showPerformanceOverlay: true,
          debugShowCheckedModeBanner: false,
          translationsKeys: {Keys.ar: ar, Keys.en: en},
          locale: Locale(Get.find<AppPreferences>().getLang),
          fallbackLocale: const Locale(Keys.en),
          supportedLocales: const [Locale(Keys.en), Locale(Keys.ar)],
          localizationsDelegates: const [
            CountryLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          theme: getThemeData,
          themeMode: ThemeMode.light,
          initialRoute: Routes.init,
          getPages: AppPages.routes,
          // home: const Home(),
        ),
      ),
    );
  }
}
