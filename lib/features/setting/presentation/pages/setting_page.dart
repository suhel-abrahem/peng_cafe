// import 'app_content_control_page.dart';
// import 'delivery_section_setting_page.dart';

// import 'account_setting_page.dart';
// import 'app_info_page.dart';
// import 'general_setting_page.dart';

// import 'sync_setting_page.dart';
// import '../widgets/custom_setting_button.dart';
// import '../../../../core/resources/common_page/main_costume_page.dart';
// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import '../../../../core/resources/common_widget/network_image/network_image.dart';
// import '../../../../generated/locale_keys.g.dart';

// class SettingPage extends StatefulWidget {
//   const SettingPage({super.key});

//   @override
//   State<SettingPage> createState() => _SettingPageState();
// }

// class _SettingPageState extends State<SettingPage> {
//   String? currentLanguage;
//   bool isHidden = true;
//   List<String> settingButtons = [
//     LocaleKeys.settingPage_accountSetting.tr(),
//     LocaleKeys.settingPage_syncSetting.tr(),
//     LocaleKeys.settingPage_generalSetting.tr(),
//     LocaleKeys.settingPage_deliverySectionSetting.tr(),
//     LocaleKeys.settingPage_appInfo.tr(),
//     LocaleKeys.settingPage_appContentControl.tr()
//   ];
//   int chosesIndex = 1;
//   PageController settingPageController = PageController(
//     initialPage: 1,
//     keepPage: true,
//   );
//   @override
//   Widget build(BuildContext context) {
//     return MainCostumePage(
//       haveDrawer: true,
//       appBarTitle: LocaleKeys.pages_setting.tr(),
//       body: Padding(
//         padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
//         child: Row(
//           children: [
//             Center(
//               child: Container(
//                   width: 400.w,
//                   height: 880.h,
//                   constraints: BoxConstraints(minWidth: 150, minHeight: 500),
//                   decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(30.r),
//                       color: Theme.of(context).colorScheme.primaryContainer),
//                   child: Column(
//                     children: [
//                       Expanded(
//                           flex: 2,
//                           child: Column(
//                             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                             children: [
//                               Center(
//                                 child: CustomNetworkImage(
//                                   width: 150.w,
//                                   radius:
//                                       BorderRadius.all(Radius.circular(150.r)),
//                                   imageRadius:
//                                       BorderRadius.all(Radius.circular(150.r)),
//                                 ),
//                               ),
//                               // SizedBox(height: 12.h),
//                               Center(
//                                 child: Text(
//                                   "suhelabrahem@gmail.com",
//                                   style: Theme.of(context)
//                                       .textTheme
//                                       .headlineMedium,
//                                 ),
//                               ),
//                               // SizedBox(
//                               //   height: 12.h,
//                               // )
//                             ],
//                           )),
//                       Expanded(
//                         flex: 4,
//                         child: ListView.builder(
//                             itemCount: settingButtons.length,
//                             itemBuilder: (context, index) =>
//                                 CustomSettingButton(
//                                     onPressed: (currentIndex) {
//                                       setState(() {
//                                         chosesIndex = currentIndex;
//                                         print(chosesIndex);
//                                       });
//                                       settingPageController.animateToPage(
//                                           chosesIndex,
//                                           duration:
//                                               const Duration(milliseconds: 300),
//                                           curve: Curves.easeInOut);
//                                     },
//                                     title: settingButtons[index],
//                                     haveBottomBorder:
//                                         index == settingButtons.length - 1
//                                             ? false
//                                             : true,
//                                     buttonIndex: index,
//                                     chosesIndex: chosesIndex)),
//                       ),
//                     ],
//                   )),
//             ),
//             Expanded(
//                 flex: 2,
//                 child: PageView(
//                   scrollDirection: Axis.vertical,
//                   onPageChanged: (value) {
//                     setState(() {
//                       chosesIndex = value;
//                     });
//                   },
//                   controller: settingPageController,
//                   children: [
//                     const AccountSettingPage(),
//                     SyncSettingPage(
//                       title: settingButtons[1],
//                     ),
//                     const GeneralSettingPage(),
//                     const DeliverySectionSettingPage(),
//                     const AppInfoPage(),
//                     const AppContentControlPage()
//                   ],
//                 ))
//           ],
//         ),
//       ),
//     );
//   }
// }
