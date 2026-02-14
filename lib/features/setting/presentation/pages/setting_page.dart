import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:glass/glass.dart';
import 'package:peng_cafe/config/theme/app_theme.dart';
import 'package:peng_cafe/core/constant/font_constants.dart';
import 'package:peng_cafe/core/enums/tables_enum/table_type_enum.dart';
import 'package:peng_cafe/core/injection_container.dart';
import 'package:peng_cafe/core/resource/custom_widget/custom_input_field/custom_input_field.dart';
import 'package:peng_cafe/core/resource/custom_widget/snake_bar_widget/snake_bar_widget.dart';
import 'package:peng_cafe/core/resource/main_page/main_page.dart';
import 'package:flutter/material.dart';
import 'package:peng_cafe/features/setting/presentation/widgets/tables_setting_row.dart';

import '../../../../config/app/app_preferences.dart';
import '../../../../generated/locale_keys.g.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  int tablesQuantity = 0;
  int poolTablesQuantity = 0;
  int videoGamesTablesQuantity = 0;
  int fishaTablesQuantity = 0;
  int tableBallTablesQuantity = 0;
  List<String> tablesType = [
    TableType.cafe.name,
    TableType.pool.name,
    TableType.videoGame.name,
    TableType.fisha.name,
    TableType.tableBall.name,
  ];
  List<String> activatedTablesType = [];

  bool tablesSettingsEditMode = false;
  GlobalKey<FormState> tablesQuantityFormKey = GlobalKey<FormState>();

  @override
  void initState() {
    tablesQuantity = getItInstance<AppPreferences>().getTablesQuantity();
    poolTablesQuantity = getItInstance<AppPreferences>()
        .getPoolTablesQuantity();
    videoGamesTablesQuantity = getItInstance<AppPreferences>()
        .getVideoGamesTablesQuantity();
    fishaTablesQuantity = getItInstance<AppPreferences>()
        .getFishaTablesQuantity();
    tableBallTablesQuantity = getItInstance<AppPreferences>()
        .getTableBallTablesQuantity();
    activatedTablesType = getItInstance<AppPreferences>().getTablesType();

    super.initState();
    print(
      "setting page initState: tablesQuantity: $tablesQuantity, poolTablesQuantity: $poolTablesQuantity",
    );
  }

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

          // tables setting

          //fields
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
            child: Align(
              alignment: AlignmentDirectional.centerStart,
              child: Form(
                key: tablesQuantityFormKey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child:
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      height: tablesSettingsEditMode
                          ? 650.h
                          : activatedTablesType.length * 110.h + 20.h,
                      width: tablesSettingsEditMode ? 550.w : 500.w,

                      padding: EdgeInsets.symmetric(
                        horizontal: 20.w,
                        vertical: 10.h,
                      ),
                      decoration: BoxDecoration(color: Colors.transparent),
                      child: AnimatedSwitcher(
                        duration: const Duration(milliseconds: 400),
                        child: Column(
                          key: ValueKey(
                            "tablesSettingsColumn$tablesSettingsEditMode",
                          ),
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Center(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    LocaleKeys.settingsPage_tablesSettings_title
                                        .tr(),
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineMedium
                                        ?.copyWith(
                                          fontFamily: FontConstants.fontFamily(
                                            context.locale,
                                          ),
                                        ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 12.w,
                                    ),
                                    child: SizedBox(
                                      width: 30.w,
                                      height: 30.h,
                                      child: IconButton(
                                        onPressed: () {
                                          setState(() {
                                            tablesSettingsEditMode =
                                                !tablesSettingsEditMode;
                                          });
                                        },
                                        icon: Icon(
                                          Icons.edit_rounded,
                                          size: 24.sp,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            // tables quantity field
                            TablesSettingRow(
                              key: ValueKey(
                                "cafeTablesQuantityField$tablesSettingsEditMode$tablesQuantity",
                              ),
                              title: LocaleKeys.settingsPage_tablesQuantity
                                  .tr(),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return LocaleKeys
                                      .settingsPage_tablesSettings_tablesQuantityMustBeGreaterThanZero
                                      .tr();
                                }
                                final intValue = int.tryParse(value);
                                if (intValue == null || intValue <= 0) {
                                  return LocaleKeys
                                      .settingsPage_tablesSettings_tablesQuantityMustBeGreaterThanZero
                                      .tr();
                                }
                                return null;
                              },
                              isActive: activatedTablesType.contains(
                                TableType.cafe.name,
                              ),
                              canEdit: tablesSettingsEditMode,
                              quantity: tablesQuantity,
                              onEdit: (newValue) {
                                tablesQuantity = newValue;
                              },
                              onActivationChanged: (status) {
                                setState(() {
                                  if (status) {
                                    activatedTablesType.add(
                                      TableType.cafe.name,
                                    );
                                  } else {
                                    activatedTablesType.removeWhere(
                                      (element) =>
                                          element == TableType.cafe.name,
                                    );
                                  }
                                });
                              },
                            ),
                            // pool tables quantity field
                            TablesSettingRow(
                              key: ValueKey(
                                "poolTablesQuantityField$tablesSettingsEditMode$poolTablesQuantity",
                              ),
                              title: LocaleKeys.settingsPage_poolTablesQuantity
                                  .tr(),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return LocaleKeys
                                      .settingsPage_tablesSettings_poolTablesQuantityMustBeGreaterThanZero
                                      .tr();
                                }
                                final intValue = int.tryParse(value);
                                if (intValue == null || intValue <= 0) {
                                  return LocaleKeys
                                      .settingsPage_tablesSettings_poolTablesQuantityMustBeGreaterThanZero
                                      .tr();
                                }
                                return null;
                              },
                              isActive: activatedTablesType.contains(
                                TableType.pool.name,
                              ),
                              canEdit: tablesSettingsEditMode,
                              quantity: poolTablesQuantity,
                              onEdit: (newValue) {
                                poolTablesQuantity = newValue;
                              },
                              onActivationChanged: (status) {
                                setState(() {
                                  if (status) {
                                    activatedTablesType.add(
                                      TableType.pool.name,
                                    );
                                  } else {
                                    activatedTablesType.removeWhere(
                                      (element) =>
                                          element == TableType.pool.name,
                                    );
                                  }
                                });
                              },
                            ),
                            // video games tables quantity field
                            TablesSettingRow(
                              key: ValueKey(
                                "videoGamesTablesQuantityField$tablesSettingsEditMode$videoGamesTablesQuantity",
                              ),
                              title: LocaleKeys
                                  .settingsPage_videoGamesTablesQuantity
                                  .tr(),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return LocaleKeys
                                      .settingsPage_tablesSettings_videoGamesTablesQuantityMustBeGreaterThanZero
                                      .tr();
                                }
                                final intValue = int.tryParse(value);
                                if (intValue == null || intValue <= 0) {
                                  return LocaleKeys
                                      .settingsPage_tablesSettings_videoGamesTablesQuantityMustBeGreaterThanZero
                                      .tr();
                                }
                                return null;
                              },
                              isActive: activatedTablesType.contains(
                                TableType.videoGame.name,
                              ),
                              canEdit: tablesSettingsEditMode,
                              quantity: videoGamesTablesQuantity,
                              onEdit: (newValue) {
                                videoGamesTablesQuantity = newValue;
                              },
                              onActivationChanged: (status) {
                                setState(() {
                                  if (status) {
                                    activatedTablesType.add(
                                      TableType.videoGame.name,
                                    );
                                  } else {
                                    activatedTablesType.removeWhere(
                                      (element) =>
                                          element == TableType.videoGame.name,
                                    );
                                  }
                                });
                              },
                            ),
                            // fisha tables quantity field
                            TablesSettingRow(
                              key: ValueKey(
                                "fishaTablesQuantityField$tablesSettingsEditMode$fishaTablesQuantity",
                              ),
                              title: LocaleKeys.settingsPage_fishaTablesQuantity
                                  .tr(),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return LocaleKeys
                                      .settingsPage_tablesSettings_fishaTablesQuantityMustBeGreaterThanZero
                                      .tr();
                                }
                                final intValue = int.tryParse(value);
                                if (intValue == null || intValue <= 0) {
                                  return LocaleKeys
                                      .settingsPage_tablesSettings_fishaTablesQuantityMustBeGreaterThanZero
                                      .tr();
                                }
                                return null;
                              },
                              isActive: activatedTablesType.contains(
                                TableType.fisha.name,
                              ),
                              canEdit: tablesSettingsEditMode,
                              quantity: fishaTablesQuantity,
                              onEdit: (newValue) {
                                fishaTablesQuantity = newValue;
                              },
                              onActivationChanged: (status) {
                                setState(() {
                                  if (status) {
                                    activatedTablesType.add(
                                      TableType.fisha.name,
                                    );
                                  } else {
                                    activatedTablesType.removeWhere(
                                      (element) =>
                                          element == TableType.fisha.name,
                                    );
                                  }
                                });
                              },
                            ),
                            // table ball tables quantity field
                            TablesSettingRow(
                              key: ValueKey(
                                "tableBallTablesQuantityField$tablesSettingsEditMode$tableBallTablesQuantity",
                              ),
                              title: LocaleKeys
                                  .settingsPage_tableBallTablesQuantity
                                  .tr(),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return LocaleKeys
                                      .settingsPage_tablesSettings_tableBallTablesQuantityMustBeGreaterThanZero
                                      .tr();
                                }
                                final intValue = int.tryParse(value);
                                if (intValue == null || intValue <= 0) {
                                  return LocaleKeys
                                      .settingsPage_tablesSettings_tableBallTablesQuantityMustBeGreaterThanZero
                                      .tr();
                                }
                                return null;
                              },
                              isActive: activatedTablesType.contains(
                                TableType.tableBall.name,
                              ),
                              canEdit: tablesSettingsEditMode,
                              quantity: tableBallTablesQuantity,
                              onEdit: (newValue) {
                                tableBallTablesQuantity = newValue;
                              },
                              onActivationChanged: (status) {
                                setState(() {
                                  if (status) {
                                    activatedTablesType.add(
                                      TableType.tableBall.name,
                                    );
                                  } else {
                                    activatedTablesType.removeWhere(
                                      (element) =>
                                          element == TableType.tableBall.name,
                                    );
                                  }
                                });
                              },
                            ),
                            Visibility(
                              key: ValueKey(
                                "tablesSettingsEditModeVisibility$tablesSettingsEditMode",
                              ),
                              visible: tablesSettingsEditMode,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  ElevatedButton(
                                    onPressed:
                                        tablesQuantityFormKey.currentState
                                                ?.validate() ==
                                            true
                                        ? () async {
                                            try {
                                              await getItInstance<
                                                    AppPreferences
                                                  >()
                                                  .setTablesType(
                                                    type: activatedTablesType,
                                                  );
                                              for (var element
                                                  in activatedTablesType) {
                                                switch (element) {
                                                  case "cafe":
                                                    getItInstance<
                                                          AppPreferences
                                                        >()
                                                        .setTablesQuantity(
                                                          quantity:
                                                              tablesQuantity,
                                                        );
                                                  case 'pool':
                                                    getItInstance<
                                                          AppPreferences
                                                        >()
                                                        .setPoolTablesQuantity(
                                                          quantity:
                                                              poolTablesQuantity,
                                                        );
                                                  case 'videoGame':
                                                    getItInstance<
                                                          AppPreferences
                                                        >()
                                                        .setVideoGamesTablesQuantity(
                                                          quantity:
                                                              videoGamesTablesQuantity,
                                                        );
                                                    getItInstance<
                                                          AppPreferences
                                                        >()
                                                        .setVideoGamesTablesQuantity(
                                                          quantity:
                                                              videoGamesTablesQuantity,
                                                        );
                                                  case 'fisha':
                                                    getItInstance<
                                                          AppPreferences
                                                        >()
                                                        .setFishaTablesQuantity(
                                                          quantity:
                                                              fishaTablesQuantity,
                                                        );
                                                  case 'tableBall':
                                                    getItInstance<
                                                          AppPreferences
                                                        >()
                                                        .setTableBallTablesQuantity(
                                                          quantity:
                                                              tableBallTablesQuantity,
                                                        );
                                                }
                                              }
                                              if (context.mounted) {
                                                showMessage(
                                                  message: LocaleKeys
                                                      .common_success
                                                      .tr(),
                                                  context: context,
                                                );
                                              }
                                              setState(() {
                                                tablesSettingsEditMode = false;
                                              });
                                            } catch (e) {
                                              if (context.mounted) {
                                                showMessage(
                                                  message: LocaleKeys
                                                      .common_error
                                                      .tr(),
                                                  context: context,
                                                );
                                              }
                                            }
                                          }
                                        : null,
                                    child: Text(
                                      LocaleKeys.settingsPage_save.tr(),
                                      style: Theme.of(
                                        context,
                                      ).textTheme.labelLarge,
                                    ),
                                  ),

                                  ElevatedButton(
                                    onPressed: () {
                                      tablesSettingsEditMode = false;
                                      setState(() {});
                                    },
                                    child: Text(
                                      LocaleKeys.settingsPage_cancel.tr(),
                                      style: Theme.of(
                                        context,
                                      ).textTheme.labelLarge,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ).asGlass(
                      tintColor: Theme.of(context).scaffoldBackgroundColor,
                      blurX: 10,
                      blurY: 10,
                      frosted: true,
                      border: Theme.of(context).defaultBorderSide,
                      clipBorderRadius: BorderRadius.circular(20.r),
                    ),
              ),
            ),
          ),
          //end of tables setting
        ],
      ),
    );
  }
}
