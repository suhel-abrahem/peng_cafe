// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:pengvery_dashboard/config/theme/app_themes.dart';

// class AccountSettingPagesTapWidget extends StatefulWidget {
//   final bool? canAccess;
//   final String? title;
//   final String? tooltipMessage;
//   final int thisTapIndex;
//   final int globalIndex;
//   final ValueChanged onChanged;
//   final double? tapWidth;
//   final double? tapHeight;
//   final double? minTapWidth;
//   final double? minTapHeight;
//   const AccountSettingPagesTapWidget({
//     super.key,
//     this.canAccess,
//     this.title,
//     this.tooltipMessage,
//     required this.thisTapIndex,
//     required this.globalIndex,
//     required this.onChanged,
//     this.tapWidth,
//     this.tapHeight,
//     this.minTapWidth,
//     this.minTapHeight,
//   });

//   @override
//   State<AccountSettingPagesTapWidget> createState() =>
//       _AccountSettingPagesTapWidgetState();
// }

// class _AccountSettingPagesTapWidgetState
//     extends State<AccountSettingPagesTapWidget> {
//   @override
//   Widget build(BuildContext context) {
//     return Tooltip(
//       message: widget.tooltipMessage ?? '',
//       child: AnimatedSwitcher(
//         key: ValueKey(widget.canAccess),
//         duration: Duration(milliseconds: 300),
//         child: Container(
//           width: widget.tapWidth ?? 200.w,
//           height: widget.tapHeight ?? 40.h,
//           // /constraints: BoxConstraints(minWidth: widget.minTapWidth ?? 150),
//           child: ElevatedButton(
//             onPressed: () => (widget.canAccess ?? false)
//                 ? widget.onChanged(widget.thisTapIndex)
//                 : null,
//             style: Theme.of(context).elevatedButtonTheme.style?.copyWith(
//                 backgroundColor: WidgetStatePropertyAll(
//                     (widget.canAccess ?? false)
//                         ? Theme.of(context).primaryColor
//                         : Theme.of(context).disabledColor),
//                 shape: WidgetStatePropertyAll(RoundedRectangleBorder(
//                     side: (widget.globalIndex == widget.thisTapIndex)
//                         ? Theme.of(context)
//                             .defaultBorderSideFocus
//                             .copyWith(width: 4.r)
//                         : Theme.of(context).defaultBorderSideDisable,
//                     borderRadius: BorderRadius.circular(12.r)))),
//             child: FittedBox(
//                 fit: BoxFit.scaleDown,
//                 child: Text(
//                   widget.title ?? '',
//                   style: Theme.of(context).textTheme.labelLarge,
//                 )),
//           ),
//         ),
//       ),
//     );
//   }
// }
