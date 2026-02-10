import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/constant/language_constants.dart';
import '../../core/injection_container.dart';
import '../../generated/locale_keys.g.dart';
import '../route/routes_manager.dart';
import '../theme/app_theme.dart';
import 'app_preferences.dart';

String? lastPath;

class PengCafe extends StatelessWidget {
  const PengCafe({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(1920, 966),
      minTextAdapt: true,
      splitScreenMode: false,
      ensureScreenSize: true,
      builder: (context, child) {
        SystemChrome.setPreferredOrientations([
          DeviceOrientation.landscapeLeft,
          DeviceOrientation.landscapeRight,
        ]);
        // SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
        // SystemChrome.setSystemUIOverlayStyle(
        //   SystemUiOverlayStyle(
        //     statusBarColor: Colors.transparent,
        //     systemNavigationBarColor: Colors.transparent,
        //     systemNavigationBarIconBrightness:
        //         (getItInstance<AppPreferences>().getThemeBool())
        //         ? Brightness.dark
        //         : Brightness.light,
        //     statusBarIconBrightness:
        //         (getItInstance<AppPreferences>().getThemeBool())
        //         ? Brightness.dark
        //         : Brightness.light,
        //   ),
        // );
        return ThemeProvider(
          initTheme: lightTheme(),
          child: MaterialApp.router(
            key: ValueKey(lastPath),
            debugShowCheckedModeBanner: false,
            title: LocaleKeys.appName.tr(),
            themeMode: ThemeMode.light,
            theme: lightTheme(),

            supportedLocales: LanguageConstant.supportedLocales,
            routerConfig: goRouter,
            locale: context.locale,
            localizationsDelegates: context.localizationDelegates,
          ),
        );
      },
    );
  }
}
