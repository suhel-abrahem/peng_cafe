// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import '../../../../core/resources/common_widget/dropdown/dropdown.dart';

// class CustomSettingFieldWidget extends StatelessWidget {
//   final String title;
//   final String? currentSyncType;
//   final String tooltipMessage;
//   final List<String> dropdownItems;
//   final ValueChanged onChanged;
//   const CustomSettingFieldWidget(
//       {super.key,
//       required this.currentSyncType,
//       required this.onChanged,
//       required this.tooltipMessage,
//       required this.dropdownItems,
//       required this.title});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: 600.w,
//       constraints: const BoxConstraints(maxWidth: 450, minWidth: 300),
//       child: Row(
//         key: ValueKey(currentSyncType),
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Container(
//             constraints: const BoxConstraints(minWidth: 200, maxWidth: 250),
//             width: 350.w,
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Container(
//                   constraints:
//                       const BoxConstraints(maxWidth: 210, minWidth: 100),
//                   child: FittedBox(
//                     fit: BoxFit.scaleDown,
//                     child: Text(
//                       title,
//                       style: Theme.of(context).textTheme.bodyLarge,
//                       overflow: TextOverflow.ellipsis,
//                       textAlign: TextAlign.start,
//                     ).tr(),
//                   ),
//                 ),
//                 // SizedBox(
//                 //   width: 12.w,
//                 // ),
//                 Container(
//                   constraints: const BoxConstraints(maxWidth: 30, minWidth: 20),
//                   child: FittedBox(
//                     fit: BoxFit.scaleDown,
//                     child: Tooltip(
//                         message: tooltipMessage.tr(),
//                         child: const Icon(Icons.info_outline_rounded)),
//                   ),
//                 )
//               ],
//             ),
//           ),
//           DropDownWithLabel<String>(
//               dropDownWidth: 120.w,
//               dropDownMinWidth: 60,
//               dropDownHeight: 39.h,
//               value: currentSyncType,
//               isLoading: currentSyncType == null ? true : false,
//               items: dropdownItems,
//               onChange: onChanged,
//               stringConverter: (syncType) {
//                 return syncType;
//               })
//         ],
//       ),
//     );
//   }
// }
