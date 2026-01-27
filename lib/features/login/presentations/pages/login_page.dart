import 'package:animated_theme_switcher/animated_theme_switcher.dart';

import 'package:go_router/go_router.dart';
import 'package:peng_cafe/core/resource/custom_widget/snake_bar_widget/snake_bar_widget.dart';
import 'package:peng_cafe/core/resource/data_state.dart';
import 'package:peng_cafe/features/login/data/model/login_model.dart';
import 'package:peng_cafe/features/login/presentations/widget/login_button.dart';

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
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  LoginModel loginModel = LoginModel();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Row(
        children: [
          Expanded(
            child: Container(
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadiusDirectional.horizontal(
                  end: Radius.circular(32.r),
                ),
              ),
              child: ListView(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 16.w,
                      vertical: 8.h,
                    ),
                    decoration: BoxDecoration(
                      color: Theme.of(
                        context,
                      ).scaffoldBackgroundColor.withValues(alpha: 0.6),
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
                          labelStyle: Theme.of(context).textTheme.labelLarge
                              ?.copyWith(
                                fontFamily: FontConstants.fontFamily(
                                  context.locale,
                                ),
                                color: ColorManager.darkTextColor,
                              ),
                          labelPadding: EdgeInsets.symmetric(horizontal: 10.w),
                          labelPosition: Position.beside,
                          backgroundColor: Theme.of(context).primaryColor,
                          items: LanguageConstant.supportedLanguagesNames,
                          onChange: (newLanguage) async {
                            if (newLanguage != null) {
                              context.setLocale(
                                Helper.getLocaleByName(newLanguage),
                              );
                              await getItInstance<AppPreferences>().setLanguage(
                                languageCode: newLanguage,
                              );

                              lastPath = newLanguage;
                            }
                          },
                          stringConverter: (string) {
                            return string.toString();
                          },
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 10.w,
                          ),

                          dropDownWidth: 150.w,
                          dropDownHeight: 40.h,
                          itemWidth: 140.w,
                          isLoading: false,
                          value: Helper.getLanguageName(
                            context.locale.countryCode ??
                                LanguageConstant.arLoacle.languageCode,
                          ),
                        ),
                        ThemeSwitcher(
                          builder: (context2) {
                            final isDarkTheme = getItInstance<AppPreferences>()
                                .getThemeBool();
                            return SizedBox(
                              width: 70.w,

                              child: FittedBox(
                                fit: BoxFit.fitWidth,
                                child: Switch.adaptive(
                                  value: isDarkTheme,
                                  inactiveTrackColor:
                                      ColorManager.backgroundColor,
                                  activeTrackColor: ColorManager.darkBackground,
                                  thumbIcon: WidgetStateProperty.resolveWith((
                                    states,
                                  ) {
                                    return Icon(
                                      (isDarkTheme)
                                          ? Icons.dark_mode
                                          : Icons.light_mode,
                                      size: 16.sp,
                                      color: (isDarkTheme)
                                          ? ColorManager.darkBackground
                                          : ColorManager.darkBackground,
                                    );
                                  }),
                                  onChanged: (bool value) {
                                    getItInstance<AppPreferences>().setAppTheme(
                                      isDarkTheme: value,
                                    );
                                    ThemeSwitcher.of(context2).changeTheme(
                                      offset: Offset(-1, -1),
                                      theme: (value)
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
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 20.w,
                      vertical: 20.h,
                    ),
                    child: Center(
                      child: Text(
                        LocaleKeys.loginPage_pleaseLoginToYourAccount.tr(),
                        style: Theme.of(context).textTheme.labelLarge?.copyWith(
                          fontFamily: FontConstants.fontFamily(context.locale),
                          fontSize: 42.sp,
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 40.w),
                      child:
                          Container(
                            width: 600.w,
                            height: 600.h,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Theme.of(
                                context,
                              ).colorScheme.primaryContainer,
                            ),
                            child: Center(
                              child: Form(
                                key: formKey,
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                child: ListView(
                                  shrinkWrap: true,
                                  children: [
                                    //email input
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 100.w,
                                      ),
                                      child: CustomInputField(
                                        height: 50.h,
                                        label: LocaleKeys.auth_email.tr(),
                                        validator: (value) {
                                          if (!RegExp(
                                            Validator.emailRegex,
                                          ).hasMatch(value.toString().trim())) {
                                            return LocaleKeys
                                                .auth_emailIsRequired
                                                .tr();
                                          }
                                        },
                                        onChanged: (value) {
                                          setState(() {
                                            loginModel = loginModel.copyWith(
                                              email: value.toString().trim(),
                                            );
                                            print(
                                              'Login Model from input: $loginModel',
                                            );
                                          });
                                        },
                                      ),
                                    ),
                                    //email input
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 100.w,
                                        vertical: 20.h,
                                      ),
                                      //password input
                                      child: CustomInputField(
                                        obscureText: true,
                                        height: 50.h,
                                        label: LocaleKeys.auth_password.tr(),
                                        validator: (value) {
                                          if (value.toString().trim().isEmpty) {
                                            return LocaleKeys
                                                .auth_passwordIsRequired
                                                .tr();
                                          }
                                        },
                                        onChanged: (value) {
                                          setState(() {
                                            loginModel = loginModel.copyWith(
                                              password: value.toString().trim(),
                                            );
                                          });
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ).animate().scaleXY(
                            duration: 1200.ms,
                            curve: Curves.bounceInOut,
                          ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10.h),
                    child: BlocProvider<LoginBloc>(
                      create: (context) =>
                          getItInstance<LoginBloc>()..add(LoginEvent.started()),
                      child: BlocListener<LoginBloc, LoginState>(
                        listener: (context, state) {
                          print('Login State: $state');
                          state.maybeWhen(
                            initial: () {},
                            succeed: () async {
                              await getItInstance<AppPreferences>()
                                  .setUserLoginState(state: true);
                              if (context.mounted) {
                                showMessage(
                                  message: LocaleKeys.common_success.tr(),
                                  context: context,
                                );
                                context.go(RoutesPath.homeRoute);
                              }
                            },

                            error: (e) {
                              showMessage(
                                message: LocaleKeys.auth_wrongEmailOrPassword
                                    .tr(),
                                context: context,
                              );
                            },
                            orElse: () {},
                          );
                        },
                        child: BlocBuilder<LoginBloc, LoginState>(
                          builder: (context, state) {
                            return Center(
                              child: state.when(
                                initial: () => LoginButton(
                                  key: ValueKey(loginModel),
                                  isLoading: false,
                                  loginModel: loginModel,
                                  formKey: formKey,
                                ),
                                loading: () => LoginButton(
                                  isLoading: true,
                                  formKey: formKey,
                                ),
                                succeed: () => LoginButton(
                                  loginModel: loginModel,
                                  formKey: formKey,
                                ),
                                loggedOut: () => LoginButton(
                                  isLoading: false,
                                  formKey: formKey,
                                ),
                                error: (e) => LoginButton(
                                  isLoading: false,
                                  loginModel: loginModel,
                                  formKey: formKey,
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ).animate().scaleXY(duration: 1000.ms, curve: Curves.easeInOut),
          ),
          Expanded(
            child: Container(
              child: ListView(
                shrinkWrap: true,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 20.w,
                      vertical: 20.h,
                    ),
                    child: Center(
                      child: Text(
                        LocaleKeys.loginPage_welcomeBack.tr(),
                        style: Theme.of(context).textTheme.labelLarge?.copyWith(
                          fontFamily: FontConstants.fontFamily(context.locale),
                          fontSize: 64.sp,
                        ),
                      ),
                    ),
                  ),
                  LottieBuilder.asset(
                    getAssetsPath(
                      assetsName: LottiesName.login,
                      assetsType: AssetsType.lotties,
                    ),
                  ),
                ],
              ),
            ).animate().scaleXY(duration: 1000.ms, curve: Curves.easeInOut),
          ),
        ],
      ),
    );
  }
}
