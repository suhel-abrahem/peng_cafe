// import 'package:bloc/bloc.dart';
// import '../../../../../../config/app/app_preferences.dart';

// import '../../../../../../core/constant/app_parts_constants.dart';
// import '../../../../../../core/enums/sync_type_enum.dart';
// import '../../../../../../core/injection_container.dart';
// import '../../../../domain/entities/sync_setting_model.dart';
// import 'package:freezed_annotation/freezed_annotation.dart';

// part 'sync_setting_bloc_event.dart';
// part 'sync_setting_bloc_state.dart';
// part 'sync_setting_bloc_bloc.freezed.dart';

// class SyncSettingBlocBloc
//     extends Bloc<SyncSettingBlocEvent, SyncSettingBlocState> {
//   SyncSettingBlocBloc()
//     : super(
//         Initial(
//           SyncSettingModel.fromJson(
//             getItInstance<AppPreferences>().getSyncType(),
//           ),
//         ),
//       ) {
//     Map<String, String?> statesAsJson = setStatesAsJson(state.states);
//     on<autoEvent>((event, emit) {
//       statesAsJson = setStatesAsJson(event.states);

//       if (event.states.auto != SyncTypeEnum.custom.formattedValue) {
//         statesAsJson.forEach(
//           (key, value) => statesAsJson[key] = event.states.auto,
//         );
//         if (event.states.auto == SyncTypeEnum.always.formattedValue) {
//           emit(
//             SyncSettingBlocState.always(
//               states: SyncSettingModel.fromJson(statesAsJson),
//             ),
//           );
//         } else {
//           emit(
//             SyncSettingBlocState.never(
//               states: SyncSettingModel.fromJson(statesAsJson),
//             ),
//           );
//         }
//       } else {
//         statesAsJson['auto'] = SyncTypeEnum.custom.formattedValue;
//         emit(
//           SyncSettingBlocState.custom(
//             states: SyncSettingModel.fromJson(statesAsJson),
//           ),
//         );
//       }
//       saveStates(statesAsJson);
//     });
//     on<tableEvent>((event, emit) {
//       statesAsJson = setStatesAsJson(event.states);
//       statesAsJson['auto'] = SyncTypeEnum.custom.formattedValue;

//       emit(
//         SyncSettingBlocState.custom(
//           states: SyncSettingModel.fromJson(statesAsJson),
//         ),
//       );
//       saveStates(statesAsJson);
//     });
//     on<ruleEvent>((event, emit) {
//       statesAsJson = setStatesAsJson(event.states);
//       statesAsJson['auto'] = SyncTypeEnum.custom.formattedValue;

//       emit(
//         SyncSettingBlocState.custom(
//           states: SyncSettingModel.fromJson(statesAsJson),
//         ),
//       );
//       saveStates(statesAsJson);
//     });
//     on<chartEvent>((event, emit) {
//       statesAsJson = setStatesAsJson(event.states);
//       statesAsJson['auto'] = SyncTypeEnum.custom.formattedValue;

//       emit(
//         SyncSettingBlocState.custom(
//           states: SyncSettingModel.fromJson(statesAsJson),
//         ),
//       );
//       saveStates(statesAsJson);
//     });
//     on<itemsEvent>((event, emit) {
//       statesAsJson = setStatesAsJson(event.states);
//       statesAsJson['auto'] = SyncTypeEnum.custom.formattedValue;

//       emit(
//         SyncSettingBlocState.custom(
//           states: SyncSettingModel.fromJson(statesAsJson),
//         ),
//       );
//       saveStates(statesAsJson);
//     });
//     on<deliveryNamesEvent>((event, emit) {
//       statesAsJson = setStatesAsJson(event.states);
//       statesAsJson['auto'] = SyncTypeEnum.custom.formattedValue;

//       emit(
//         SyncSettingBlocState.custom(
//           states: SyncSettingModel.fromJson(statesAsJson),
//         ),
//       );
//       saveStates(statesAsJson);
//     });
//     on<deliveryLocationsEvent>((event, emit) {
//       statesAsJson = setStatesAsJson(event.states);
//       statesAsJson['auto'] = SyncTypeEnum.custom.formattedValue;

//       emit(
//         SyncSettingBlocState.custom(
//           states: SyncSettingModel.fromJson(statesAsJson),
//         ),
//       );
//       saveStates(statesAsJson);
//     });
//     on<deliveryClientsEvent>((event, emit) {
//       statesAsJson = setStatesAsJson(event.states);
//       statesAsJson['auto'] = SyncTypeEnum.custom.formattedValue;

//       emit(
//         SyncSettingBlocState.custom(
//           states: SyncSettingModel.fromJson(statesAsJson),
//         ),
//       );
//       saveStates(statesAsJson);
//     });
//   }
// }

// Map<String, String?> setStatesAsJson(SyncSettingModel source) {
//   return {
//     "auto": source.auto,
//     AppPartsConstants.tables: source.tables,
//     AppPartsConstants.charts: source.charts,
//     AppPartsConstants.items: source.items,
//     AppPartsConstants.deliveryNames: source.deliveryNames,
//     AppPartsConstants.deliveryLocations: source.deliveryLocations,
//     AppPartsConstants.deliveryClients: source.deliveryClients,
//     AppPartsConstants.rule: source.rule,
//   };
// }

// saveStates(Map<String, dynamic> states) {
//   getItInstance<AppPreferences>().setSyncType(
//     syncModel: SyncSettingModel.fromJson(states),
//   );
// }
