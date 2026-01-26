// import '../../../../core/enums/sync_type_enum.dart';

// import '../bloc/sync_setting_page/bloc/sync_setting_bloc_bloc.dart';
// import 'custom_settings_pages.dart';
// import '../../../../generated/locale_keys.g.dart';

// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// import '../widgets/custom_setting_field.dart';

// Map<String, String> tooltipsMessages = {
//   'auto': LocaleKeys.settingPage_syncSettingPage_autoSyncInTip,
//   'tables': LocaleKeys.settingPage_syncSettingPage_tableAutoSyncInTip,
//   'charts': LocaleKeys.settingPage_syncSettingPage_chartsAutoSyncInTip,
//   'items': LocaleKeys.settingPage_syncSettingPage_itemsAutoSyncInTip,
//   'deliveryNames':
//       LocaleKeys.settingPage_syncSettingPage_deliveryNameAutoSyncInTip,
//   'deliveryLocations':
//       LocaleKeys.settingPage_syncSettingPage_deliveryLocationAutoSyncInTip,
//   'deliveryClients':
//       LocaleKeys.settingPage_syncSettingPage_deliveryClientAutoSyncInTip,
//   "rule": LocaleKeys.settingPage_syncSettingPage_ruleAutoSyncInTip
// };
// List<String> timeOptions = [
//   SyncTypeEnum.always.formattedValue,
//   SyncTypeEnum.oneHour.formattedValue,
//   SyncTypeEnum.oneDay.formattedValue,
//   SyncTypeEnum.oneWeek.formattedValue,
//   SyncTypeEnum.oneMonth.formattedValue,
//   SyncTypeEnum.oneYear.formattedValue,
//   SyncTypeEnum.never.formattedValue,
// ];
// List<String> autoOptions = [
//   SyncTypeEnum.always.formattedValue,
//   SyncTypeEnum.oneHour.formattedValue,
//   SyncTypeEnum.oneDay.formattedValue,
//   SyncTypeEnum.oneWeek.formattedValue,
//   SyncTypeEnum.oneMonth.formattedValue,
//   SyncTypeEnum.oneYear.formattedValue,
//   SyncTypeEnum.never.formattedValue,
//   SyncTypeEnum.custom.formattedValue,
// ];

// class SyncSettingPage extends StatelessWidget {
//   final String title;
//   const SyncSettingPage({super.key, required this.title});

//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<SyncSettingBlocBloc, SyncSettingBlocState>(
//       builder: (blocContext, blocState) {
//         return SizedBox(
//           height: double.infinity,
//           child: CustomSettingsPages(title: title, bodyChild: [
//             CustomSettingFieldWidget(
//                 currentSyncType: blocState.states.auto,
//                 onChanged: (val) {
//                   BlocProvider.of<SyncSettingBlocBloc>(context).add(
//                       autoEvent(states: blocState.states.copyWith(auto: val)));
//                 },
//                 tooltipMessage: tooltipsMessages['auto'] ?? '',
//                 dropdownItems: autoOptions,
//                 title: LocaleKeys.settingPage_syncSettingPage_autoSyncIn),
//             CustomSettingFieldWidget(
//                 currentSyncType: blocState.states.tables,
//                 onChanged: (val) {
//                   BlocProvider.of<SyncSettingBlocBloc>(context).add(tableEvent(
//                       states: blocState.states.copyWith(tables: val)));
//                 },
//                 tooltipMessage: tooltipsMessages['tables'] ?? '',
//                 dropdownItems: timeOptions,
//                 title: LocaleKeys.settingPage_syncSettingPage_tableAutoSyncIn),
//             CustomSettingFieldWidget(
//                 currentSyncType: blocState.states.charts,
//                 onChanged: (val) {
//                   BlocProvider.of<SyncSettingBlocBloc>(context).add(chartEvent(
//                       states: blocState.states.copyWith(charts: val)));
//                 },
//                 tooltipMessage: tooltipsMessages['charts'] ?? '',
//                 dropdownItems: timeOptions,
//                 title: LocaleKeys.settingPage_syncSettingPage_chartsAutoSyncIn),
//             CustomSettingFieldWidget(
//                 currentSyncType: blocState.states.items,
//                 onChanged: (val) {
//                   BlocProvider.of<SyncSettingBlocBloc>(context).add(itemsEvent(
//                       states: blocState.states.copyWith(items: val)));
//                 },
//                 tooltipMessage: tooltipsMessages['items'] ?? '',
//                 dropdownItems: timeOptions,
//                 title: LocaleKeys.settingPage_syncSettingPage_itemsAutoSyncIn),
//             CustomSettingFieldWidget(
//                 currentSyncType: blocState.states.deliveryNames,
//                 onChanged: (val) {
//                   BlocProvider.of<SyncSettingBlocBloc>(context).add(
//                       deliveryNamesEvent(
//                           states:
//                               blocState.states.copyWith(deliveryNames: val)));
//                 },
//                 tooltipMessage: tooltipsMessages['deliveryNames'] ?? '',
//                 dropdownItems: timeOptions,
//                 title: LocaleKeys
//                     .settingPage_syncSettingPage_deliveryNameAutoSyncIn),
//             CustomSettingFieldWidget(
//                 currentSyncType: blocState.states.deliveryLocations,
//                 onChanged: (val) {
//                   BlocProvider.of<SyncSettingBlocBloc>(context).add(
//                       deliveryLocationsEvent(
//                           states: blocState.states
//                               .copyWith(deliveryLocations: val)));
//                 },
//                 tooltipMessage: tooltipsMessages['deliveryLocations'] ?? '',
//                 dropdownItems: timeOptions,
//                 title: LocaleKeys
//                     .settingPage_syncSettingPage_deliveryLocationAutoSyncIn),
//             CustomSettingFieldWidget(
//                 currentSyncType: blocState.states.deliveryClients,
//                 onChanged: (val) {
//                   BlocProvider.of<SyncSettingBlocBloc>(context).add(
//                       deliveryClientsEvent(
//                           states:
//                               blocState.states.copyWith(deliveryClients: val)));
//                 },
//                 tooltipMessage: tooltipsMessages['deliveryClients'] ?? '',
//                 dropdownItems: timeOptions,
//                 title: LocaleKeys
//                     .settingPage_syncSettingPage_deliveryClientAutoSyncIn),
//             CustomSettingFieldWidget(
//                 currentSyncType: blocState.states.rule,
//                 onChanged: (val) {
//                   BlocProvider.of<SyncSettingBlocBloc>(context).add(
//                       ruleEvent(states: blocState.states.copyWith(rule: val)));
//                 },
//                 tooltipMessage: tooltipsMessages['rule'] ?? '',
//                 dropdownItems: timeOptions,
//                 title: LocaleKeys.settingPage_syncSettingPage_ruleAutoSyncIn),
//           ]),
//         );
//       },
//     );
//   }
// }
