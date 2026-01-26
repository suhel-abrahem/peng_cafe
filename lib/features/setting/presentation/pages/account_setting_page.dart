// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/gestures.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// class AccountSettingPage extends StatefulWidget {
//   const AccountSettingPage({super.key});

//   @override
//   State<AccountSettingPage> createState() => _AccountSettingPageState();
// }

// class _AccountSettingPageState extends State<AccountSettingPage> {
//   int accountSettingPageIndex = 0;
//   List<String> pagesTitles = [
//     LocaleKeys.settingPage_accountSettingPage_yourAccount,
//     LocaleKeys.settingPage_accountSettingPage_teammatesAccounts,
//     LocaleKeys.settingPage_accountSettingPage_deliveriesAccounts,
//     LocaleKeys.settingPage_accountSettingPage_clientsAccounts,
//   ];
//   List<String> pagesTitlesTips = [
//     LocaleKeys.settingPage_accountSettingPage_yourAccountTip,
//     LocaleKeys.settingPage_accountSettingPage_teammatesAccountsTip,
//     LocaleKeys.settingPage_accountSettingPage_deliveriesAccountsTip,
//     LocaleKeys.settingPage_accountSettingPage_clientsAccountsTip,
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return ListView(
//       children: [
//         Padding(
//           padding: EdgeInsets.symmetric(vertical: 20.h),
//           child: Center(
//             child: Text(
//               LocaleKeys.settingPage_accountSetting.tr(),
//               style: Theme.of(context).textTheme.headlineLarge,
//             ),
//           ),
//         ),
//         Padding(
//           padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 120.w),
//           child: Container(
//             width: double.maxFinite,
//             height: 60.h,
//             decoration: BoxDecoration(
//               color: Theme.of(context).primaryColor.withOpacity(0.3),
//               borderRadius: BorderRadius.circular(30.r),
//             ),
//             child: Align(
//               alignment: Alignment.center,
//               child: SingleChildScrollView(
//                 scrollDirection: Axis.horizontal,
//                 child: Row(
//                   children: List.generate(
//                     pagesTitles.length,
//                     (index) => Padding(
//                       padding: EdgeInsets.symmetric(horizontal: 20.w),
//                       child: AccountSettingPagesTapWidget(
//                         thisTapIndex: index,
//                         globalIndex: accountSettingPageIndex,
//                         title: pagesTitles[index].tr(),
//                         tooltipMessage: pagesTitlesTips[index].tr(),
//                         onChanged: (newPageIndex) => setState(() {
//                           accountSettingPageIndex = newPageIndex;
//                         }),
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ),
//         Padding(
//           padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
//           child: Text(
//             '${LocaleKeys.departments}:'.tr(),
//             style: Theme.of(context).textTheme.labelLarge,
//           ),
//         ),
//       ],
//     );
//   }
// }
