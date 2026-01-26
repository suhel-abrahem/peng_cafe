// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:pengvery_dashboard/core/injection_container.dart';
// import 'package:pengvery_dashboard/core/resources/common_widget/actions_buttons/add_button.dart';
// import 'package:pengvery_dashboard/core/resources/common_widget/actions_buttons/select_button.dart';
// import 'package:pengvery_dashboard/core/resources/common_widget/title_bar_with_action_widget.dart';
// import 'package:pengvery_dashboard/core/usecase/usecase.dart';
// import 'package:pengvery_dashboard/features/setting/presentation/widgets/general_setting_feature_block_widget.dart';
// import 'package:pengvery_dashboard/features/setting/presentation/widgets/rules_groups_dialog.dart';

// import '../../../../core/resources/common_features/user_info/presentation/bloc/rules_groups_bloc.dart';
// import '../../../../core/resources/common_widget/actions_buttons/select_all_button.dart';
// import '../../../../core/resources/common_widget/expanded_with_hover_Container.dart';
// import '../../../../generated/locale_keys.g.dart';

// class GeneralSettingPage extends StatefulWidget {
//   const GeneralSettingPage({super.key});

//   @override
//   State<GeneralSettingPage> createState() => _GeneralSettingPageState();
// }

// class _GeneralSettingPageState extends State<GeneralSettingPage> {
//   bool isLastDepartmentsContainerHovered = false;
//   final ScrollController _departmentsScrollController =
//       ScrollController(keepScrollOffset: true);
//   bool isLastRulesGroupsContainerHovered = false;
//   final ScrollController _rulesGroupsScrollController =
//       ScrollController(keepScrollOffset: true);
//   bool rulesGroupsDialogIsShowed = false;
//   // @override
//   // void didUpdateWidget(covariant GeneralSettingPage oldWidget) {
//   //   isLastDepartmentsContainerHovered = isLastDepartmentsContainerHovered;
//   //   super.didUpdateWidget(oldWidget);
//   // }

//   @override
//   Widget build(BuildContext context) {
//     print(rulesGroupsDialogIsShowed);
//     return Stack(
//       key: ValueKey(rulesGroupsDialogIsShowed),
//       children: [
//         AnimatedOpacity(
//           duration: Duration(milliseconds: 300),
//           opacity: (rulesGroupsDialogIsShowed) ? 0.3 : 1,
//           child: ListView(
//             children: [
//               Center(
//                 child: Padding(
//                   padding:
//                       EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
//                   child: Text(
//                     '${LocaleKeys.settingPage_generalSetting.tr()}:',
//                     style: Theme.of(context).textTheme.labelLarge,
//                   ),
//                 ),
//               ),
//               GeneralSettingFeatureBlockWidget(
//                   isHovered: isLastDepartmentsContainerHovered,
//                   scrollController: _departmentsScrollController),
//               TitleBarWithActionWidget(
//                 title: LocaleKeys.rulesGroups.tr(),
//                 actions: [
//                   SelectButton(onPressed: () {}),
//                   SelectAllButton(onPressed: () {}),
//                   AddButtons(
//                       onPressed: () => rulesGroupsDialogIsShowed
//                           ? null
//                           : setState(() {
//                               rulesGroupsDialogIsShowed = true;
//                             }))
//                 ],
//               ),
//               BlocProvider(
//                 create: (context) => getItInstance<RulesGroupsBloc>()
//                   ..add(Get(UserRuleDataType(bypass: 0))),
//                 child: BlocBuilder<RulesGroupsBloc, RulesGroupsState>(
//                   builder: (context, state) {
//                     return state.when(
//                         initial: () => Text("ini"),
//                         haveData: (userRulesGroups) =>
//                             GeneralSettingFeatureBlockWidget(
//                                 isHovered: isLastRulesGroupsContainerHovered,
//                                 scrollController: _rulesGroupsScrollController),
//                         noData: () =>
//                             Center(child: Text(LocaleKeys.noThingToShow.tr())),
//                         noInternet: () =>
//                             Text(LocaleKeys.connection_noInternetError.tr()),
//                         groupsNameAlreadyExist: () => SizedBox(),
//                         failedToSaveDataLocally: () => SizedBox(),
//                         failedToGetDataLocally: () => SizedBox(),
//                         failedToGetGroupsName: () => SizedBox(),
//                         failedToSaveGroupsName: () => SizedBox(),
//                         uploaded: () => SizedBox(),
//                         updated: () => SizedBox(),
//                         error: () => Text(LocaleKeys.error.tr()));
//                   },
//                 ),
//               )
//             ],
//           ),
//         ),
//         if (rulesGroupsDialogIsShowed)
//           Center(
//               child: RulesGroupsDialog(
//             onShowStateChanged: (newState) => setState(() {
//               rulesGroupsDialogIsShowed = newState;
//             }),
//           ))
//       ],
//     );
//   }
// }
