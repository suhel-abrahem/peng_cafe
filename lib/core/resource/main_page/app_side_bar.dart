import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:glass/glass.dart';
import 'package:go_router/go_router.dart';
import 'package:peng_cafe/config/theme/app_theme.dart';
import 'package:peng_cafe/core/constant/font_constants.dart';
import 'package:peng_cafe/core/resource/assets_manager.dart';
import 'package:peng_cafe/generated/locale_keys.g.dart';

import '../../../config/app/app.dart';
import '../../../config/app/app_preferences.dart';
import '../../constant/language_constants.dart';
import '../../enums/psition_enum.dart';
import '../../injection_container.dart';
import '../../util/helper/helper.dart';
import '../color_manager.dart';
import '../custom_widget/dropdown/drop_down_with_label.dart';
import '../image_widget.dart';

class AppSideBar extends StatefulWidget {
  final StatefulNavigationShell navigationShell;

  const AppSideBar({super.key, required this.navigationShell});

  @override
  State<AppSideBar> createState() => _AppSideBarState();
}

class _AppSideBarState extends State<AppSideBar> {
  final double containerWidthCollapsed = 100.w;
  final double containerWidthExpanded = 220.w;

  bool isExpanded = false;
  bool isDarkTheme = getItInstance<AppPreferences>().getThemeBool();
  void toggleSidebar() {
    setState(() {
      isExpanded = !isExpanded;
    });
  }

  Widget _menuItem({
    required int index,
    required IconData icon,
    required String title,
  }) {
    return Padding(
      padding: EdgeInsets.only(top: 50.h),
      child: SizedBox(
        height: 56.h,

        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          child: LayoutBuilder(
            key: ValueKey(
              "menuItem$index-$isExpanded",
            ), // 🔑 unique key for each item & state
            builder: (context, constraints) {
              return constraints.maxWidth == containerWidthExpanded
                  ? Padding(
                      padding: EdgeInsetsDirectional.only(start: 20.w),
                      child: InkWell(
                        onTap: () {
                          widget.navigationShell.goBranch(index);
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(
                              icon,
                              size: 40.sp,
                              color:
                                  index == widget.navigationShell.currentIndex
                                  ? Theme.of(context).primaryColor
                                  : Theme.of(
                                      context,
                                    ).textTheme.labelLarge?.color,
                            ),

                            Visibility(
                              key: ValueKey(
                                "icon$index-$isExpanded",
                              ), // 🔑 unique key for each item & state
                              visible: isExpanded,
                              child: Padding(
                                padding: EdgeInsetsDirectional.only(
                                  start: 20.w,
                                ),
                                child: Text(
                                  title,
                                  style: Theme.of(context).textTheme.labelLarge
                                      ?.copyWith(
                                        fontFamily: FontConstants.fontFamily(
                                          context.locale,
                                        ),
                                        color:
                                            index ==
                                                widget
                                                    .navigationShell
                                                    .currentIndex
                                            ? Theme.of(context).primaryColor
                                            : Theme.of(
                                                context,
                                              ).textTheme.labelLarge?.color,
                                      ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  : InkWell(
                      onTap: () {
                        widget.navigationShell.goBranch(index);
                      },
                      child: Center(
                        child: Icon(
                          icon,
                          size: 40.sp,
                          color: index == widget.navigationShell.currentIndex
                              ? Theme.of(context).primaryColor
                              : Theme.of(context).textTheme.labelLarge?.color,
                        ),
                      ),
                    );
            },
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 20.h),
        child:
            AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              width: isExpanded
                  ? containerWidthExpanded
                  : containerWidthCollapsed,

              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.only(start: 12.w, top: 12.h),
                    child: Align(
                      alignment: AlignmentDirectional.centerStart,
                      child: SizedBox(
                        width: 30.w,
                        height: 30.h,
                        child: IconButton(
                          icon: const Icon(
                            CupertinoIcons.arrow_right_arrow_left,
                          ),
                          onPressed: toggleSidebar,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 20.h),
                    child: IconButton(
                      onPressed: () {
                        if (context.canPop()) {
                          context.pop();
                        }
                      },
                      icon: Icon(
                        context.locale == LanguageConstant.arLoacle ||
                                context.locale == LanguageConstant.faLocale
                            ? CupertinoIcons.arrow_right
                            : CupertinoIcons.arrow_left,
                      ),
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 20.h),
                    child: Center(
                      child: AnimatedSwitcher(
                        duration: const Duration(milliseconds: 400),
                        child: ImageWidget(
                          key: ValueKey(isExpanded),
                          imageUrl: isExpanded
                              ? "${iconPath}${IconsName.byteXLogo}"
                              : "${iconPath}${IconsName.bytexLogoSmall}",
                          width: isExpanded ? 150.w : 50.w,
                        ),
                      ),
                    ),
                  ),

                  Divider(
                    color: Theme.of(context).textTheme.labelLarge?.color,
                    thickness: 1.h,
                  ),

                  Center(
                    child: _menuItem(
                      index: 0,
                      icon: Icons.home_rounded,
                      title: LocaleKeys.homePage_title.tr(),
                    ),
                  ),

                  Center(
                    child: _menuItem(
                      index: 1,
                      icon: Icons.history_rounded,
                      title: LocaleKeys.ordersPage_title.tr(),
                    ),
                  ),

                  Center(
                    child: _menuItem(
                      index: 2,
                      icon: Icons.inventory,
                      title: LocaleKeys.productsPage_title.tr(),
                    ),
                  ),

                  Center(
                    child: _menuItem(
                      index: 3,
                      icon: Icons.settings,
                      title: LocaleKeys.sittingsPage_title.tr(),
                    ),
                  ),

                  Spacer(),
                  Center(
                    child: ThemeSwitcher(
                      builder: (context2) {
                        return Switch.adaptive(
                          value: isDarkTheme ?? false,
                          inactiveTrackColor: ColorManager.darkBackground,
                          activeTrackColor: ColorManager.backgroundColor,
                          activeThumbColor: ColorManager.darkBackground,
                          inactiveThumbColor: ColorManager.backgroundColor,
                          thumbIcon: WidgetStateProperty.resolveWith((states) {
                            return Icon(
                              (isDarkTheme ?? false)
                                  ? Icons.dark_mode
                                  : Icons.light_mode,
                              size: 16.sp,
                              color: (isDarkTheme ?? false)
                                  ? ColorManager.backgroundColor
                                  : ColorManager.darkBackground,
                            );
                          }),
                          onChanged: (bool value) {
                            setState(() {
                              isDarkTheme = value;
                            });
                            getItInstance<AppPreferences>().setAppTheme(
                              isDarkTheme: isDarkTheme,
                            );
                            ThemeSwitcher.of(context2).changeTheme(
                              offset: Offset(-1, -1),
                              theme: (isDarkTheme ?? false)
                                  ? darkTheme()
                                  : lightTheme(),
                              isReversed: true,
                            );
                          },
                        );
                      },
                    ),
                  ),

                  // 🌍 Language (only when expanded)
                  AnimatedSwitcher(
                    duration: const Duration(milliseconds: 400),
                    child: Visibility(
                      key: ValueKey(
                        "languageDropdown-$isExpanded",
                      ), // 🔑 unique key for state
                      visible: isExpanded,
                      child: Padding(
                        padding: EdgeInsetsDirectional.only(
                          start: 24.w,
                          top: 20.h,
                          bottom: 20.h,
                        ),
                        child: DropDownWithLabel<String>(
                          dropDownWidth: 170.w,
                          dropDownHeight: 40.h,
                          isLoading: false,
                          items: LanguageConstant.supportedLanguagesNames,
                          value: Helper.getLanguageName(
                            context.locale.countryCode ??
                                LanguageConstant.arLoacle.languageCode,
                          ),
                          onChange: (lang) async {
                            if (lang != null) {
                              context.setLocale(Helper.getLocaleByName(lang));
                              await getItInstance<AppPreferences>().setLanguage(
                                languageCode: lang,
                              );
                            }
                          },
                          stringConverter: (e) => e,
                        ),
                      ),
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.only(bottom: 20.h),
                    child: Center(
                      child: IconButton(
                        icon: const Icon(Icons.logout_rounded),
                        onPressed: () {},
                      ),
                    ),
                  ),
                ],
              ),
            ).asGlass(
              blurX: 10,
              blurY: 10,
              frosted: true,
              border: Theme.of(context).defaultBorderSide.copyWith(width: 2.r),
              clipBorderRadius: BorderRadius.circular(20.r),
            ),
      ),
    );
  }
}
