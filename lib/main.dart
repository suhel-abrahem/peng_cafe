import 'package:easy_localization/easy_localization.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:peng_cafe/config/app/app.dart';
import 'package:peng_cafe/config/app/app_preferences.dart';
import 'package:peng_cafe/core/constant/language_constants.dart';
import 'package:peng_cafe/core/injection_container.dart';
import 'package:peng_cafe/core/util/helper/helper.dart';
import 'package:peng_cafe/features/login/presentations/bloc/login_bloc.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  BackgroundIsolateBinaryMessenger.ensureInitialized(
    RootIsolateToken.instance!,
  );
  await initializeDependencies();
  
  await EasyLocalization.ensureInitialized();

  runApp(
    EasyLocalization(
      supportedLocales: [
        LanguageConstant.arLoacle,
        LanguageConstant.enLoacle,
        LanguageConstant.faLocale,
      ],
      path: 'assets/translations',
      fallbackLocale: LanguageConstant.arLoacle,
      startLocale: Helper.getLocaleByName(
        getItInstance<AppPreferences>().getLanguage() ??
            LanguageConstant.arName,
      ),
      child: const PengCafe(),
    ),
  );
}
