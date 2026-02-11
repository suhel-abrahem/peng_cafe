import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:peng_cafe/core/constant/font_constants.dart';
import 'package:peng_cafe/features/login/data/model/login_model.dart';
import 'package:peng_cafe/generated/locale_keys.g.dart';

import '../bloc/login_bloc.dart';

class LoginButton extends StatelessWidget {
  final bool? isLoading;
  final LoginModel? loginModel;
  final GlobalKey<FormState>? formKey;
  const LoginButton({
    super.key,
    this.isLoading = false,
    this.loginModel,
    this.formKey,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 400.w,
      height: 50.h,
      child: Builder(
        builder: (context) {
          return ElevatedButton(
            style: Theme.of(context).elevatedButtonTheme.style?.copyWith(
              // backgroundColor: WidgetStatePropertyAll(Colors.blueAccent),
            ),
            onPressed: isLoading == true
                ? null
                : () {
                    if (formKey?.currentState?.validate() == true) {
                      print('Login Model: $loginModel');
                      BlocProvider.of<LoginBloc>(context).add(
                        LoginEventLogin(loginModel: loginModel ?? LoginModel()),
                      );
                    }
                  },
            child: isLoading == true
                ? SizedBox(
                    width: 20.w,
                    height: 20.h,
                    child: const CircularProgressIndicator(
                      color: Colors.white,
                      strokeWidth: 2,
                    ),
                  )
                : Text(
                    LocaleKeys.auth_login.tr(),
                    style: TextStyle(
                      fontFamily: FontConstants.fontFamily(context.locale),
                    ),
                  ),
          );
        },
      ),
    );
  }
}
