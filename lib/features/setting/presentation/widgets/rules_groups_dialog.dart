// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_animate/flutter_animate.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:pengvery_dashboard/config/app/app_preferences.dart';
// import 'package:pengvery_dashboard/core/constants/app_parts_constants.dart';
// import 'package:pengvery_dashboard/core/enums/psition_enum.dart';
// import 'package:pengvery_dashboard/core/injection_container.dart';
// import 'package:pengvery_dashboard/core/resources/common_features/user_info/presentation/bloc/rules_groups_bloc.dart';
// import 'package:pengvery_dashboard/core/resources/common_widget/actions_buttons/select_all_button.dart';
// import 'package:pengvery_dashboard/core/resources/common_widget/common_Widget.dart';
// import 'package:pengvery_dashboard/core/resources/common_widget/dropdown/dropdown.dart';
// import 'package:pengvery_dashboard/core/resources/common_widget/input_field/input_field_widget.dart';
// import 'package:pengvery_dashboard/core/util/helper.dart';
// import 'package:pengvery_dashboard/features/setting/presentation/widgets/rule_selection_field.dart';
// import 'package:pengvery_dashboard/generated/locale_keys.g.dart';

// class RulesGroupsDialog extends StatefulWidget {
//   final ValueChanged<bool> onShowStateChanged;
//   const RulesGroupsDialog({super.key, required this.onShowStateChanged});

//   @override
//   State<RulesGroupsDialog> createState() => _RulesGroupsDialogState();
// }

// class _RulesGroupsDialogState extends State<RulesGroupsDialog> {
//   bool canSync = false;
//   bool isShowed = true;
//   bool isContainerInit = false;
//   int? defaultLanguage = 0;
//   String? arName;
//   String? enName;
//   String? krName;
//   bool isAddRuleActive = false;
//   List<String> rules = [
//     LocaleKeys.rules_canAcceptRequisiteFromAnotherUser,
//     LocaleKeys.rules_canAcceptRequisiteFromClient,
//     LocaleKeys.rules_canAddClients,
//     LocaleKeys.rules_canAddUsers,
//     LocaleKeys.rules_canBlockClients,
//     LocaleKeys.rules_canBlockUsers,
//     LocaleKeys.rules_canEditAppFeatures,
//     LocaleKeys.rules_canEditBills,
//     LocaleKeys.rules_canEditDepartments,
//     LocaleKeys.rules_canEditHisRulesGroups,
//     LocaleKeys.rules_canEditItems,
//     LocaleKeys.rules_canEditOffers,
//     LocaleKeys.rules_canEditRulesGroups,
//     LocaleKeys.rules_canMonitor,
//     LocaleKeys.rules_canOrder,
//     LocaleKeys.rules_canRemoveClient,
//     LocaleKeys.rules_canRemoveUsers,
//     LocaleKeys.rules_canShowBills,
//   ];

//   Map<String, dynamic> rulesEntity = {
//     "ruleName": ["", "", ""],
//     "defaultLanguage": 0,
//     'groupName': ["", "", ""],
//     "ruleId": '',
//     "canAcceptRequisiteFromAnotherUser": false,
//     "canAcceptRequisiteFromClient": false,
//     "canAddClients": false,
//     "canAddUsers": false,
//     "canBlockClients": false,
//     "canBlockUsers": false,
//     "canEditAppFeatures": false,
//     "canEditBills": false,
//     "canEditDepartments": false,
//     "canEditHisRulesGroups": false,
//     "canEditItems": false,
//     "canEditOffers": false,
//     "canEditRulesGroups": false,
//     "canMonitor": false,
//     "canOrder": false,
//     "canRemoveClient": false,
//     "canRemoveUsers": false,
//     "canShowBills": false,
//   };
//   bool isSelectionContainerHovered = false;
//   /*
//   bypass:
//   0-off
//   1-to locally
//   2-to cloudy
//   */
//   int bypass = 0;
//   double containerWidth = 0;
//   double containerHeight = 0;
//   Future initContainer() async {
//     Future.delayed(const Duration(milliseconds: 50), () {
//       setState(() {
//         containerHeight = 700.h;
//         containerWidth = 1000.w;
//       });
//     });
//     Future.delayed(const Duration(milliseconds: 350), () {
//       setState(() {
//         isContainerInit = true;
//       });
//     });
//   }

//   @override
//   void initState() {
//     canSync =
//         getItInstance<AppPreferences>().getCanSync()[AppPartsConstants.rule];
//     initContainer();
//     super.initState();
//   }

//   Future<void> closeThisDialog() async {
//     Future.delayed(const Duration(milliseconds: 300), () {
//       setState(() {
//         isShowed = false;
//       });
//       widget.onShowStateChanged(isShowed);
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return AnimatedContainer(
//       duration: const Duration(milliseconds: 300),
//       width: isShowed ? containerWidth : 0,
//       height: isShowed ? containerHeight : 0,
//       decoration: BoxDecoration(
//           color: Theme.of(context).colorScheme.primaryContainer,
//           borderRadius: BorderRadius.circular(40.r)),
//       child: BlocProvider(
//         create: (context) => getItInstance<RulesGroupsBloc>(),
//         child: AnimatedSwitcher(
//           duration: const Duration(milliseconds: 100),
//           child: Visibility(
//             key: ValueKey(isShowed),
//             visible: isShowed && isContainerInit,
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 Flexible(
//                   flex: 7,
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                     children: [
//                       SingleChildScrollView(
//                         child: Column(
//                           key: ValueKey(defaultLanguage),
//                           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             //ar Groups name
//                             CustomInputField(
//                               haveOuterLabel: true,
//                               outerLabel: LocaleKeys
//                                   .settingPage_generalSettingPage_groupsNameAr
//                                   .tr(),
//                               outerLabelPadding: EdgeInsets.symmetric(
//                                   horizontal: 8.w, vertical: 8.h),
//                               width: 300.w,
//                               height: 45.h,
//                               contentPadding: EdgeInsets.symmetric(
//                                   vertical: 0.h, horizontal: 8.w),
//                               isRequired: defaultLanguage == 0,
//                             ),
//                             //en groups name
//                             CustomInputField(
//                               haveOuterLabel: true,
//                               outerLabel: LocaleKeys
//                                   .settingPage_generalSettingPage_groupsNameEn
//                                   .tr(),
//                               outerLabelPadding: EdgeInsets.symmetric(
//                                   horizontal: 8.w, vertical: 8.h),
//                               width: 300.w,
//                               height: 45.h,
//                               contentPadding: EdgeInsets.symmetric(
//                                   vertical: 0.h, horizontal: 8.w),
//                               isRequired: defaultLanguage == 1,
//                             ),
//                             //kr groups name
//                             CustomInputField(
//                               haveOuterLabel: true,
//                               outerLabel: LocaleKeys
//                                   .settingPage_generalSettingPage_groupsNameKr
//                                   .tr(),
//                               outerLabelPadding: EdgeInsets.symmetric(
//                                   horizontal: 8.w, vertical: 8.h),
//                               width: 300.w,
//                               height: 45.h,
//                               contentPadding: EdgeInsets.symmetric(
//                                   vertical: 0.h, horizontal: 8.w),
//                               isRequired: defaultLanguage == 2,
//                             ),
//                             Row(
//                               children: [
//                                 SizedBox(
//                                   width: 300.w,
//                                   child: TextButton(
//                                       key: ValueKey(isAddRuleActive),
//                                       onPressed: () => setState(() {
//                                             isAddRuleActive = !isAddRuleActive;
//                                           }),
//                                       style: Theme.of(context)
//                                           .textButtonTheme
//                                           .style
//                                           ?.copyWith(
//                                               side: WidgetStatePropertyAll(
//                                                 BorderSide.none,
//                                               ),
//                                               padding: WidgetStatePropertyAll(
//                                                   EdgeInsets.zero)),
//                                       child: AnimatedSwitcher(
//                                         duration: Duration(milliseconds: 300),
//                                         child: dividerWithTitle(
//                                             width: 300.w,
//                                             title: isAddRuleActive
//                                                 ? LocaleKeys.cancel.tr()
//                                                 : LocaleKeys
//                                                     .settingPage_generalSettingPage_addRules
//                                                     .tr()),
//                                       )),
//                                 ),
//                                 Tooltip(
//                                   message: LocaleKeys
//                                       .settingPage_generalSettingPage_youCanPressThisDividerToAddRules
//                                       .tr(),
//                                   child: Icon(Icons.info_outline_rounded),
//                                 )
//                               ],
//                             ),
//                             if (isAddRuleActive)
//                               Column(
//                                 children: [
//                                   CustomInputField(
//                                     haveOuterLabel: true,
//                                     outerLabel: LocaleKeys
//                                         .settingPage_generalSettingPage_rulesNameAr
//                                         .tr(),
//                                     outerLabelPadding: EdgeInsets.symmetric(
//                                         horizontal: 8.w, vertical: 8.h),
//                                     width: 300.w,
//                                     height: 45.h,
//                                     contentPadding: EdgeInsets.symmetric(
//                                         vertical: 0.h, horizontal: 8.w),
//                                     isRequired: defaultLanguage == 0,
//                                   ),
//                                   CustomInputField(
//                                     haveOuterLabel: true,
//                                     outerLabel: LocaleKeys
//                                         .settingPage_generalSettingPage_rulesNameEn
//                                         .tr(),
//                                     outerLabelPadding: EdgeInsets.symmetric(
//                                         horizontal: 8.w, vertical: 8.h),
//                                     width: 300.w,
//                                     height: 45.h,
//                                     contentPadding: EdgeInsets.symmetric(
//                                         vertical: 0.h, horizontal: 8.w),
//                                     isRequired: defaultLanguage == 1,
//                                   ),
//                                   CustomInputField(
//                                     haveOuterLabel: true,
//                                     outerLabel: LocaleKeys
//                                         .settingPage_generalSettingPage_rulesNameKr
//                                         .tr(),
//                                     outerLabelPadding: EdgeInsets.symmetric(
//                                         horizontal: 8.w, vertical: 8.h),
//                                     width: 300.w,
//                                     height: 45.h,
//                                     contentPadding: EdgeInsets.symmetric(
//                                         vertical: 0.h, horizontal: 8.w),
//                                     isRequired: defaultLanguage == 2,
//                                   ),
//                                 ],
//                               ),
//                             Row(
//                               crossAxisAlignment: CrossAxisAlignment.end,
//                               children: [
//                                 DropDownWithLabel(
//                                   items: [
//                                     LocaleKeys.ar,
//                                     LocaleKeys.en,
//                                     LocaleKeys.kr,
//                                   ],
//                                   value: LocaleKeys.ar,
//                                   onChange: (newState) {
//                                     setState(() {
//                                       defaultLanguage =
//                                           Helper.languageNameToInt(
//                                               newState ?? '');
//                                     });
//                                   },
//                                   stringConverter: (newString) =>
//                                       newString.tr(),
//                                   dropDownWidth: 150.w,
//                                   dropDownHeight: 45.h,
//                                   isLoading: false,
//                                   label:
//                                       '${LocaleKeys.servicesManagement_add_defaultLanguage.tr()}:',
//                                   labelPosition: Position.upper,
//                                   labelPadding: EdgeInsets.symmetric(
//                                       vertical: 8.h, horizontal: 8.w),
//                                 ),
//                                 Padding(
//                                   padding:
//                                       EdgeInsets.symmetric(horizontal: 12.w),
//                                   child: SizedBox(
//                                       height: 45.h,
//                                       child: Center(
//                                           child: Tooltip(
//                                               message: LocaleKeys
//                                                   .settingPage_generalSettingPage_youCanSetTheDefaultLanguageForOneTime
//                                                   .tr(),
//                                               child:
//                                                   Icon(Icons.info_outline)))),
//                                 )
//                               ],
//                             )
//                           ],
//                         ),
//                       ),
//                       MouseRegion(
//                         onEnter: (event) => isAddRuleActive
//                             ? setState(() {
//                                 isSelectionContainerHovered = true;
//                               })
//                             : null,
//                         onExit: (event) => isAddRuleActive
//                             ? setState(() {
//                                 isSelectionContainerHovered = false;
//                               })
//                             : null,
//                         child: ClipRRect(
//                           borderRadius: BorderRadius.circular(15.r),
//                           child: Stack(
//                             children: [
//                               AnimatedContainer(
//                                 duration: Duration(milliseconds: 400),
//                                 height: isAddRuleActive ? 600.h : 45.h,
//                                 width: 400.w,
//                                 padding: EdgeInsets.only(bottom: 8.h),
//                                 decoration: BoxDecoration(
//                                     color: Theme.of(context)
//                                         .scaffoldBackgroundColor,
//                                     borderRadius: BorderRadius.circular(15.r)),
//                                 child: isAddRuleActive
//                                     ? Center(
//                                         child: SizedBox(
//                                           key: ValueKey(isAddRuleActive),
//                                           child: SingleChildScrollView(
//                                             child: Column(
//                                               mainAxisAlignment:
//                                                   MainAxisAlignment.spaceEvenly,
//                                               children: [
//                                                 Padding(
//                                                   padding: EdgeInsets.only(
//                                                       top: 12.h),
//                                                   child: Text(LocaleKeys
//                                                       .settingPage_generalSettingPage_selectRulesToSetIt
//                                                       .tr()),
//                                                 ),
//                                                 Column(
//                                                   mainAxisAlignment:
//                                                       MainAxisAlignment.start,
//                                                   children: List.generate(
//                                                       rules.length,
//                                                       (index) =>
//                                                           RuleSelectionField(
//                                                               title:
//                                                                   rules[index]
//                                                                       .tr(),
//                                                               isSelect: rulesEntity[
//                                                                   Helper.ruleNameInEntityFromIndex(
//                                                                       index)],
//                                                               onChanged:
//                                                                   (newState) {
//                                                                 setState(() {
//                                                                   rulesEntity[Helper
//                                                                           .ruleNameInEntityFromIndex(
//                                                                               index)] =
//                                                                       newState;
//                                                                 });
//                                                               })),
//                                                 )
//                                               ],
//                                             ).animate().fadeIn(
//                                                 duration:
//                                                     Duration(milliseconds: 400),
//                                                 delay: Duration(
//                                                     milliseconds: 400)),
//                                           ),
//                                         ),
//                                       )
//                                     : Center(
//                                         child: Padding(
//                                         padding: EdgeInsets.symmetric(
//                                             horizontal: 12.w),
//                                         child: FittedBox(
//                                           fit: BoxFit.scaleDown,
//                                           child: Text(LocaleKeys
//                                               .settingPage_generalSettingPage_pressTheAddRuleDividerToActiveThis
//                                               .tr()),
//                                         ),
//                                       )).animate().fadeIn(
//                                         duration: Duration(milliseconds: 400),
//                                         delay: Duration(milliseconds: 400)),
//                               ),
//                               PositionedDirectional(
//                                   child: AnimatedContainer(
//                                 duration: Duration(milliseconds: 300),
//                                 height: isSelectionContainerHovered ? 50.h : 0,
//                                 width: 400.w,
//                                 decoration: BoxDecoration(
//                                     color: Theme.of(context)
//                                         .primaryColor
//                                         .withOpacity(0.3)),
//                                 child: Row(
//                                   mainAxisAlignment:
//                                       MainAxisAlignment.spaceEvenly,
//                                   children: [SelectAllButton(onPressed: () {})],
//                                 ),
//                               ))
//                             ],
//                           ),
//                         ),
//                       )
//                     ],
//                   ),
//                 ),
//                 //action row
//                 Flexible(
//                   flex: 2,
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                     children: [
//                       ElevatedButton(
//                           onPressed: () {},
//                           child: Text(LocaleKeys.upload.tr())),
//                       if (canSync)
//                         ElevatedButton(
//                             onPressed: () {},
//                             child: Text(LocaleKeys.save.tr())),
//                       ElevatedButton(
//                           onPressed: () async {
//                             await closeThisDialog();
//                             setState(() {
//                               isShowed = false;
//                               isContainerInit = false;
//                             });
//                           },
//                           child: Text(LocaleKeys.cancel.tr()))
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
