import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:native_splash_screen/native_splash_screen.dart' as nss;

import '../../core/constant/language_constants.dart';
import '../../core/injection_container.dart';
import '../../core/util/helper/helper.dart';
import '../../generated/locale_keys.g.dart';
import '../route/routes_manager.dart';
import '../theme/app_theme.dart';
import 'app_preferences.dart';

String? lastPath;

class PengCafe extends StatefulWidget {
  const PengCafe({super.key});

  @override
  State<PengCafe> createState() => _PengCafeState();
}

class _PengCafeState extends State<PengCafe> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      nss.close(animation: nss.CloseAnimation.fade);
    });
  }

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
          initTheme: (getItInstance<AppPreferences>().getThemeBool())
              ? darkTheme()
              : lightTheme(),
          child: MaterialApp.router(
            key: ValueKey(lastPath),
            debugShowCheckedModeBanner: false,
            title: LocaleKeys.appName.tr(),
            themeMode: (getItInstance<AppPreferences>().getThemeBool())
                ? ThemeMode.dark
                : ThemeMode.light,
            theme: (getItInstance<AppPreferences>().getThemeBool())
                ? darkTheme()
                : lightTheme(),

            supportedLocales: LanguageConstant.supportedLocales,
            routerConfig: goRouter,
            locale: Helper.getLocaleByName(
              getItInstance<AppPreferences>().getLanguage() ??
                  LanguageConstant.arName,
            ),
            localizationsDelegates: context.localizationDelegates,
          ),
        );
      },
    );
  }
}
