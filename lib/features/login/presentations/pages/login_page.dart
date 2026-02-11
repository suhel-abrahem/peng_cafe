import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:glass/glass.dart';

import 'package:go_router/go_router.dart';
import 'package:peng_cafe/core/resource/custom_widget/snake_bar_widget/snake_bar_widget.dart';
import 'package:peng_cafe/core/resource/data_state.dart';
import 'package:peng_cafe/core/resource/image_widget.dart';
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
import '../../../../core/resource/main_page/top_background_clip_path.dart';
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
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(iconPath + IconsName.cans),
              fit: BoxFit.cover,
            ),
          ),
        ),
        // Positioned(
        //   bottom: 0,
        //   child: Center(
        //     child: Image(image: AssetImage(iconPath + IconsName.coffeeMug)),
        //   ),
        // ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 00.h),
                child: Center(
                  child: Image(
                    image: AssetImage(iconPath + IconsName.byteXLogo),
                    width: 400.w,

                    fit: BoxFit.contain,
                  ),
                ),
              ),
              Spacer(),
              Form(
                key: formKey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Align(
                  alignment: Alignment.center,
                  child:
                      SizedBox(
                        height: 370.h,
                        width: 700.w,
                        child: ListView(
                          shrinkWrap: true,
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 30.h),
                              child: Center(
                                child: Text(
                                  LocaleKeys.loginPage_pleaseLoginToYourAccount
                                      .tr(),
                                  style: Theme.of(context).textTheme.labelLarge
                                      ?.copyWith(
                                        fontFamily: FontConstants.fontFamily(
                                          context.locale,
                                        ),
                                        fontSize: 42.sp,
                                        color: Colors.white,
                                        shadows: [
                                          Shadow(
                                            color: Colors.black,
                                            blurRadius: 4.r,
                                            offset: Offset(1.w, 2.h),
                                          ),
                                        ],
                                      ),
                                ),
                              ),
                            ),
                            //email input
                            Center(
                              child: CustomInputField(
                                borderRadius: BorderRadius.circular(30.r),
                                fillColor: Theme.of(context)
                                    .colorScheme
                                    .primaryContainer
                                    .withValues(alpha: 0.33),
                                errorStyle: TextStyle(
                                  fontFamily: FontConstants.fontFamily(
                                    context.locale,
                                  ),
                                  shadows: [
                                    Shadow(
                                      color: Colors.black,
                                      blurRadius: 4.r,
                                      offset: Offset(1.w, 2.h),
                                    ),
                                  ],
                                  fontSize: 16.sp,
                                  color: ColorManager.darkTextColor,
                                ),
                                width: 600.w,
                                height: 60.h,
                                label: LocaleKeys.auth_email.tr(),
                                validator: (value) {
                                  if (!RegExp(
                                    Validator.emailRegex,
                                  ).hasMatch(value.toString().trim())) {
                                    return LocaleKeys.auth_emailIsRequired.tr();
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

                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 20.h),
                              child: Center(
                                child: CustomInputField(
                                  fillColor: Theme.of(context)
                                      .colorScheme
                                      .primaryContainer
                                      .withValues(alpha: 0.33),
                                  errorStyle: TextStyle(
                                    fontFamily: FontConstants.fontFamily(
                                      context.locale,
                                    ),
                                    shadows: [
                                      Shadow(
                                        color: Colors.black,
                                        blurRadius: 4.r,
                                        offset: Offset(1.w, 2.h),
                                      ),
                                    ],
                                    fontSize: 16.sp,
                                    color: ColorManager.darkTextColor,
                                  ),
                                  obscureText: true,
                                  height: 60.h,
                                  width: 600.w,
                                  label: LocaleKeys.auth_password.tr(),
                                  validator: (value) {
                                    if (value.toString().trim().isEmpty) {
                                      return LocaleKeys.auth_passwordIsRequired
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
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 10.h),
                              child: BlocProvider<LoginBloc>(
                                create: (context) =>
                                    getItInstance<LoginBloc>()
                                      ..add(LoginEvent.started()),
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
                                            message: LocaleKeys.common_success
                                                .tr(),
                                            context: context,
                                            messageColor:
                                                ColorManager.textColor,
                                          );
                                          context.go(RoutesPath.homeRoute);
                                        }
                                      },

                                      error: (e) {
                                        showMessage(
                                          message: LocaleKeys
                                              .auth_wrongEmailOrPassword
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
                      ).asGlass(
                        blurX: 10,
                        blurY: 10,

                        frosted: true,
                        border: Theme.of(
                          context,
                        ).defaultBorderSide.copyWith(width: 2.r),
                        clipBorderRadius: BorderRadius.circular(30.r),
                      ),
                ),
              ),
              Spacer(),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20.w,
                    vertical: 12.h,
                  ),
                  child: Center(
                    child:
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 20.w,
                            vertical: 8.h,
                          ),
                          decoration: BoxDecoration(),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Align(
                                alignment: AlignmentDirectional.centerStart,
                                child: DropDownWithLabel<String>(
                                  menuBoxShadow: BoxShadow(
                                    color: Theme.of(context).shadowColor,
                                    blurRadius: 4.r,
                                    offset: Offset(1.w, 2.h),
                                  ),
                                  boxShadow: BoxShadow(
                                    color: Theme.of(context).shadowColor,

                                    offset: Offset(0, 1.h),
                                  ),
                                  valueColor: Colors.black,
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
                                  labelPadding: EdgeInsets.symmetric(
                                    horizontal: 10.w,
                                  ),
                                  labelPosition: Position.beside,
                                  backgroundColor: ColorManager.darkTextColor,
                                  items:
                                      LanguageConstant.supportedLanguagesNames,
                                  onChange: (newLanguage) async {
                                    if (newLanguage != null) {
                                      context.setLocale(
                                        Helper.getLocaleByName(newLanguage),
                                      );
                                      await getItInstance<AppPreferences>()
                                          .setLanguage(
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
                              ),
                              Center(
                                child: Text(
                                  "Made with ❤️ by ByteX",
                                  style: Theme.of(context).textTheme.labelLarge
                                      ?.copyWith(
                                        fontFamily: FontConstants.fontFamily(
                                          context.locale,
                                        ),
                                        fontSize: 22.sp,
                                        color: ColorManager.darkTextColor,
                                      ),
                                ),
                              ),
                            ],
                          ),
                        ).asGlass(
                          blurX: 10,
                          blurY: 10,
                          tintColor: Theme.of(context).primaryColor,
                          frosted: true,
                          border: Theme.of(
                            context,
                          ).defaultBorderSide.copyWith(width: 2.r),
                          clipBorderRadius: BorderRadius.circular(30.r),
                        ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
