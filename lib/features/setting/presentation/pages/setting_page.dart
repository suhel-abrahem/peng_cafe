import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
        ],
      ),
    );
  }
}
