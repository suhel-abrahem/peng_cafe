import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:glass/glass.dart';
import 'package:peng_cafe/config/theme/app_theme.dart';
import 'package:peng_cafe/core/resource/main_page/main_page.dart';

import '../../../../generated/locale_keys.g.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MainPage(
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w),
            child: Text(LocaleKeys.homePage_title.tr()),
          ),
          Row(
            children: [
              //buttons container
              Expanded(
                flex: 1,
                child:
                    Container(
                      decoration: BoxDecoration(color: Colors.transparent),
                      child: GridView(
                        shrinkWrap: true,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisSpacing: 10,
                              crossAxisSpacing: 10,
                            ),
                        children: [
                          Container(color: Colors.red),
                          Container(color: Colors.green),
                          Container(color: Colors.blue),
                          Container(color: Colors.yellow),
                        ],
                      ),
                    ).asGlass(
                      tintColor: Theme.of(context).scaffoldBackgroundColor,
                      clipBorderRadius: BorderRadius.circular(20.r),
                      border: Theme.of(context).defaultBorderSide,
                      blurX: 10,
                      blurY: 10,
                      frosted: true,
                    ),
              ),
              // tables container
              Expanded(
                flex: 2,
                child:
                    Container(
                      decoration: BoxDecoration(color: Colors.transparent),
                    ).asGlass(
                      tintColor: Theme.of(context).scaffoldBackgroundColor,
                      clipBorderRadius: BorderRadius.circular(20.r),
                      border: Theme.of(context).defaultBorderSide,
                      blurX: 10,
                      blurY: 10,
                      frosted: true,
                    ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
