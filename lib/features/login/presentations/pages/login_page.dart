import 'package:animated_theme_switcher/animated_theme_switcher.dart';

import 'package:go_router/go_router.dart';

import '../../../../config/app/app_preferences.dart';

import '../../../../config/route/routes_manager.dart';
import '../../../../config/theme/app_theme.dart';
import '../../../../core/constant/font_constants.dart';
import '../../../../core/constant/language_constants.dart';
import '../../../../core/enums/assets_type_enum.dart';
import '../../../../core/enums/psition_enum.dart';
import '../../../../core/enums/theme_enums.dart';
import '../../../../core/extensions/screen_size.dart';
import '../../../../core/extensions/theme_data_extensions.dart';

import '../../../../core/injection_container.dart';

import '../../../../core/resource/assets_manager.dart';
import '../../../../core/resource/color_manager.dart';
import '../../../../core/resource/custom_widget/custom_input_field/custom_input_field.dart';
import '../../../../core/resource/custom_widget/dropdown/drop_down_with_label.dart';
import '../../../../core/util/helper/helper.dart';
import '../../../../core/util/validator/validator.dart';
import '../../domain/entities/login_entity.dart';
import '../bloc/login_bloc.dart';
import '../../../../generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final MediaQueryData mediaQuery = const MediaQueryData();

  final double actionContainerRadius = 42.r;
  String? currentLanguage;
  String? errorMessage;
  ThemeDataBrightness? currentTheme;
  late bool isDarkTheme;
  bool isHidden = true;
  IconData changeThemButtonIcon = Icons.dark_mode;
  String? selectedLanguage;
  IconData getThemeButtonText() {
    return (isDarkTheme) ? Icons.dark_mode : Icons.light_mode;
  }

  ThemeDataBrightness getCurrentThemeEnum() {
    return (isDarkTheme)
        ? ThemeDataBrightness.darkTheme
        : ThemeDataBrightness.lightTheme;
  }

  String? showErrorMessage(String? message) {
    if (message?.contains(
          '[firebase_auth/unknown] An unknown error occurred: FirebaseError: Firebase: The supplied auth credential is incorrect, malformed or has expired. (auth/invalid-credential).',
        ) ??
        false) {
      return LocaleKeys.auth_wrongEmailOrPassword.tr();
    }
    return message;
  }

  @override
  void initState() {
    currentLanguage = getItInstance<AppPreferences>().getLanguage();
    isDarkTheme = getItInstance<AppPreferences>().getThemeBool();
    currentTheme = getCurrentThemeEnum();
    changeThemButtonIcon = getThemeButtonText();
    getItInstance<AppPreferences>().setUserFirstUse();
    super.initState();
  }

  final loginFieldKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  RegExp emailRegex = RegExp(Validator.emailRegex);
  bool canLogin = true;
  @override
  Widget build(BuildContext context) {
    double actionContainerTopLeftRadius = context.locale.languageCode == 'ar'
        ? 0
        : actionContainerRadius;
    double actionContainerBottomLeftRadius = context.locale.languageCode == 'ar'
        ? 0
        : actionContainerRadius;
    double actionContainerTopRightRadius = context.locale.languageCode == 'en'
        ? 0
        : actionContainerRadius;
    double actionContainerBottomRightRadius =
        context.locale.languageCode == 'en' ? 0 : actionContainerRadius;

    return ThemeSwitchingArea(
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: <Color>[
                Color.fromARGB(255, 242, 3, 210),
                Color.fromARGB(255, 165, 0, 143),
                Color.fromARGB(255, 133, 0, 147),
              ],
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //image container
              SizedBox(
                width: mediaQuery.w * 0.48,
                height: mediaQuery.h,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                            LocaleKeys.auth_loginLabel.tr(),
                            style: Theme.of(context).textTheme.headlineLarge
                                ?.copyWith(fontSize: 52.sp),
                          )
                          .animate()
                          .fadeIn(curve: Curves.bounceIn)
                          .scale()
                          .move(delay: 300.ms, duration: 600.ms)
                          .slide()
                          .tint(color: ColorManager.textColor),
                      LottieBuilder.asset(
                        getAssetsPath(
                          assetsName: LottiesName.login,
                          assetsType: AssetsType.lotties,
                        ),
                        repeat: true,
                        width: mediaQuery.w * 0.36,
                        fit: BoxFit.contain,
                      ),
                    ],
                  ),
                ),
              ),
              //action container
              Container(
                width: mediaQuery.w * 0.52,
                height: mediaQuery.h,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Theme.of(context).colorScheme.shadow,
                      offset: const Offset(0.1, 0.1),
                      blurRadius: 5,
                    ),
                  ],
                  color: Theme.of(context).isDark
                      ? ColorManager.backgroundColor
                      : ColorManager.backgroundColor,
                  // border: Border.fromBorderSide(
                  //     Theme.of(context).defaultBorderSide.copyWith(width: 2)),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(actionContainerTopLeftRadius),
                    topRight: Radius.circular(actionContainerTopRightRadius),
                    bottomLeft: Radius.circular(
                      actionContainerBottomLeftRadius,
                    ),
                    bottomRight: Radius.circular(
                      actionContainerBottomRightRadius,
                    ),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    //upper action bar
                    Align(
                      alignment: Alignment.topCenter,
                      child:
                          Container(
                            width: double.infinity,
                            height: mediaQuery.h * 0.06,
                            padding: EdgeInsets.symmetric(horizontal: 24.w),
                            decoration: BoxDecoration(
                              color: Theme.of(
                                context,
                              ).primaryColor.withOpacity(.3),
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(
                                  actionContainerTopLeftRadius,
                                ),
                                topRight: Radius.circular(
                                  actionContainerTopRightRadius,
                                ),
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                DropDownWithLabel<String>(
                                  menuBoxShadow: BoxShadow(
                                    color: Theme.of(context).shadowColor,
                                    blurRadius: 4.r,
                                    offset: Offset(1.w, 2.h),
                                  ),
                                  boxShadow: BoxShadow(
                                    color: Theme.of(context).shadowColor,

                                    offset: Offset(0, 1.h),
                                  ),
                                  valueColor: ColorManager.darkTextColor,
                                  borderRadius: BorderRadius.circular(30.r),
                                  label: LocaleKeys.language_choose.tr(),
                                  labelStyle: Theme.of(context)
                                      .textTheme
                                      .labelLarge
                                      ?.copyWith(
                                        fontFamily: FontConstants.fontFamily(
                                          context.locale,
                                        ),
                                        color: ColorManager.darkTextColor,
                                      ),
                                  labelPadding: EdgeInsets.only(bottom: 4.h),
                                  labelPosition: Position.beside,
                                  backgroundColor: Theme.of(
                                    context,
                                  ).primaryColor,
                                  items:
                                      LanguageConstant.supportedLanguagesNames,
                                  onChange: (newLanguage) async {
                                    if (newLanguage != null) {
                                      setState(() {
                                        selectedLanguage = newLanguage;
                                      });
                                      context.setLocale(
                                        Helper.getLocaleByName(newLanguage),
                                      );
                                      await getItInstance<AppPreferences>()
                                          .setLanguage(
                                            languageCode: newLanguage,
                                          );

                                      setState(() {
                                        lastPath = newLanguage;
                                      });
                                    }
                                  },
                                  stringConverter: (string) {
                                    return string.toString();
                                  },
                                  contentPadding: EdgeInsets.symmetric(
                                    horizontal: 10.w,
                                  ),

                                  dropDownWidth: 100.w,
                                  dropDownHeight: 40.h,
                                  itemWidth: 120.w,
                                  isLoading: false,
                                  value: Helper.getLanguageName(
                                    selectedLanguage ??
                                        LanguageConstant.enLoacle.languageCode,
                                  ),
                                ),
                                ThemeSwitcher(
                                  builder: (context2) {
                                    return SizedBox(
                                      width: 70.w,

                                      child: FittedBox(
                                        fit: BoxFit.fitWidth,
                                        child: Switch.adaptive(
                                          value: isDarkTheme,
                                          inactiveTrackColor:
                                              ColorManager.backgroundColor,
                                          activeTrackColor:
                                              ColorManager.darkBackground,
                                          thumbIcon:
                                              WidgetStateProperty.resolveWith((
                                                states,
                                              ) {
                                                return Icon(
                                                  (isDarkTheme)
                                                      ? Icons.dark_mode
                                                      : Icons.light_mode,
                                                  size: 16.sp,
                                                  color: (isDarkTheme)
                                                      ? ColorManager
                                                            .darkBackground
                                                      : ColorManager
                                                            .darkBackground,
                                                );
                                              }),
                                          onChanged: (bool value) {
                                            setState(() {
                                              isDarkTheme = value;
                                            });
                                            getItInstance<AppPreferences>()
                                                .setAppTheme(
                                                  isDarkTheme: isDarkTheme,
                                                );
                                            ThemeSwitcher.of(
                                              context2,
                                            ).changeTheme(
                                              offset: Offset(-1, -1),
                                              theme: (isDarkTheme)
                                                  ? darkTheme()
                                                  : lightTheme(),
                                              isReversed: true,
                                            );
                                          },
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ],
                            ),
                          ).animate().slide(
                            delay: const Duration(milliseconds: 1600),
                            duration: const Duration(milliseconds: 1000),
                            begin: const Offset(-1, -1),
                            end: Offset.zero,
                            curve: Curves.bounceIn,
                          ),
                    ),
                    //form
                    SizedBox(
                      height: mediaQuery.h * 0.85,
                      child: BlocProvider<LoginBloc>(
                        create: (context) => getItInstance<LoginBloc>(),
                        child: BlocBuilder<LoginBloc, LoginState>(
                          builder: (blocContext, blocState) {
                            if (blocState is Logined) {
                              getItInstance<AppPreferences>()
                                  .setUserLoginState();
                              errorMessage = '';

                              context.go(RoutesPath.homeRoute);
                            }
                            if (blocState is LoginError) {
                              print(blocState.error);
                              errorMessage = blocState.error;
                            }
                            return Form(
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              key: loginFieldKey,
                              onChanged: () {
                                setState(() {});
                              },
                              child: SizedBox(
                                height: mediaQuery.h * 0.85,
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Container(
                                      width: mediaQuery.w * 0.33,
                                      height: mediaQuery.w * 0.33,
                                      padding: EdgeInsets.symmetric(
                                        horizontal: mediaQuery.w * 0.05,
                                        vertical: mediaQuery.w * 0.075,
                                      ),
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Theme.of(context).primaryColor,
                                      ),
                                      child: Center(
                                        child:
                                            Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  children: [
                                                    //email field
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional
                                                              .topStart,
                                                      child: Helper.labelText(
                                                        label: LocaleKeys
                                                            .auth_email
                                                            .tr(),
                                                        context: context,
                                                      ),
                                                    ),
                                                    CustomInputField(
                                                      controller:
                                                          emailController,
                                                      height:
                                                          mediaQuery.w * 0.03,
                                                      validator: (string) {
                                                        string ??= '';
                                                        if (!emailRegex
                                                            .hasMatch(string)) {
                                                          return LocaleKeys
                                                              .validation_emailField
                                                              .tr(
                                                                namedArgs: {
                                                                  "email": Validator
                                                                      .emailExample,
                                                                },
                                                              );
                                                        }
                                                        return null;
                                                      },
                                                    ),
                                                    //password field
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional
                                                              .topStart,
                                                      child: Helper.labelText(
                                                        label: LocaleKeys
                                                            .auth_password
                                                            .tr(),
                                                        context: context,
                                                      ),
                                                    ),
                                                    CustomInputField(
                                                      controller:
                                                          passwordController,
                                                      height:
                                                          mediaQuery.w * 0.03,
                                                      obscureText: isHidden,
                                                      prefix: SizedBox(
                                                        height:
                                                            mediaQuery.w * 0.02,
                                                        width:
                                                            mediaQuery.w * 0.02,
                                                        child: IconButton(
                                                          style: Theme.of(context)
                                                              .iconButtonTheme
                                                              .style
                                                              ?.copyWith(
                                                                padding:
                                                                    const MaterialStatePropertyAll(
                                                                      EdgeInsets
                                                                          .zero,
                                                                    ),
                                                              ),
                                                          icon: Icon(
                                                            isHidden
                                                                ? Icons
                                                                      .visibility_off
                                                                : Icons
                                                                      .visibility,
                                                          ),
                                                          onPressed: () {
                                                            setState(() {
                                                              isHidden =
                                                                  !isHidden;
                                                            });
                                                          },
                                                        ),
                                                      ),
                                                      validator: (string) {
                                                        string ??= '';
                                                        if (string.isEmpty) {
                                                          return LocaleKeys
                                                              .validation_passwordField
                                                              .tr();
                                                        }
                                                        return null;
                                                      },
                                                    ),
                                                    if (errorMessage
                                                            ?.isNotEmpty ??
                                                        false)
                                                      Text(
                                                        showErrorMessage(
                                                              errorMessage,
                                                            ) ??
                                                            '',
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .bodyLarge
                                                            ?.copyWith(
                                                              color:
                                                                  ColorManager
                                                                      .error,
                                                            ),
                                                        textAlign:
                                                            TextAlign.center,
                                                      ),
                                                  ],
                                                )
                                                .animate()
                                                .fade(
                                                  curve: Curves.easeInOut,
                                                  duration: const Duration(
                                                    milliseconds: 1000,
                                                  ),
                                                )
                                                .blur(
                                                  begin: const Offset(-1, -1),
                                                  end: Offset.zero,
                                                  curve: Curves.easeInOut,
                                                  duration: const Duration(
                                                    milliseconds: 550,
                                                  ),
                                                ),
                                      ),
                                    ).animate().slide(
                                      begin: const Offset(0, -1),
                                      end: Offset.zero,
                                      duration: const Duration(
                                        milliseconds: 2000,
                                      ),
                                      curve: Curves.bounceIn,
                                    ),
                                    // login button
                                    SizedBox(
                                      height: 45.h,
                                      width: 150.w,
                                      child: ElevatedButton(
                                        onPressed:
                                            (((loginFieldKey.currentState !=
                                                        null)
                                                    ? (loginFieldKey
                                                          .currentState!
                                                          .validate())
                                                    : false) &&
                                                (blocState is! LoginLoginIn))
                                            ? () {
                                                BlocProvider.of<LoginBloc>(
                                                  blocContext,
                                                ).add(
                                                  LoginEventLogin(
                                                    loginEntity: LoginEntity(
                                                      email:
                                                          emailController.text,
                                                      password:
                                                          passwordController
                                                              .text,
                                                    ),
                                                  ),
                                                );
                                              }
                                            : null,
                                        child: Text(LocaleKeys.auth_login.tr()),
                                      ),
                                    ).animate().slide(
                                      begin: const Offset(1, 0),
                                      end: Offset.zero,
                                      duration: const Duration(
                                        milliseconds: 1000,
                                      ),
                                      curve: Curves.easeInOut,
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
