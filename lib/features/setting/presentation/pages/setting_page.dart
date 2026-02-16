import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:glass/glass.dart';
import 'package:peng_cafe/config/theme/app_theme.dart';
import 'package:peng_cafe/core/constant/font_constants.dart';
import 'package:peng_cafe/core/enums/psition_enum.dart';
import 'package:peng_cafe/core/resource/custom_widget/custom_input_field/custom_input_field.dart';
import 'package:peng_cafe/features/setting/presentation/widgets/currency_widget.dart';

import '../../../../core/resource/main_page/main_page.dart';
import '../../../../generated/locale_keys.g.dart';
import '../widgets/tables_setting_widget.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MainPage(
      body: ListView(
        children: [
          //page title
          Padding(
            padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w),
            child: Text(
              LocaleKeys.settingsPage_title.tr(),
              style: Theme.of(context).textTheme.headlineLarge,
            ),
          ),
          Align(
            alignment: AlignmentDirectional.centerStart,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: TablesSettingWidget(),
            ),
          ),

          //end of tables setting
          Padding(
            padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w),
            child: Align(
              alignment: AlignmentDirectional.centerStart,
              child: CurrencyWidget(),
            ),
          ),
        ],
      ),
    );
  }
}
