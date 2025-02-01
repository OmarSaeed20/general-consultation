import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'core/consts/app_strings.dart';
import 'core/languages/ar_translations.dart';
import 'core/languages/en_translations.dart';
import 'core/util/theme.dart';
import 'core/routes/app_pages.dart';
import 'core/util/app_prefs.dart';
import 'core/util/keys.dart';

class ConsultationApp extends StatelessWidget {
  const ConsultationApp({super.key});

  @override
  Widget build(BuildContext context) {
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
