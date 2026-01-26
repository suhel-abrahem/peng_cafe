// import '../../../../config/theme/app_themes.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// class CustomSettingButton extends StatelessWidget {
//   final String title;
//   final bool haveBottomBorder;
//   final int chosesIndex;
//   final ValueChanged onPressed;
//   final int buttonIndex;
//   const CustomSettingButton(
//       {super.key,
//       required this.title,
//       this.haveBottomBorder = true,
//       required this.chosesIndex,
//       required this.buttonIndex,
//       required this.onPressed});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//         clipBehavior: Clip.antiAlias,
//         height: 97.h,
//         decoration: BoxDecoration(
//             borderRadius: BorderRadius.only(
//                 bottomLeft:
//                     !haveBottomBorder ? Radius.circular(30.r) : Radius.zero,
//                 bottomRight:
//                     !haveBottomBorder ? Radius.circular(30.r) : Radius.zero),
//             border: Border(
//                 bottom: haveBottomBorder
//                     ? Theme.of(context)
//                         .defaultBorderSideDisable
//                         .copyWith(width: 2)
//                     : BorderSide.none,
//                 top: buttonIndex == 0
//                     ? Theme.of(context)
//                         .defaultBorderSideDisable
//                         .copyWith(width: 2)
//                     : BorderSide.none)),
//         child: OutlinedButton(
//           style: Theme.of(context).outlinedButtonTheme.style?.copyWith(
//               shape: const MaterialStatePropertyAll(RoundedRectangleBorder(
//                   borderRadius: BorderRadius.all(Radius.zero))),
//               backgroundColor: MaterialStatePropertyAll(
//                   chosesIndex == buttonIndex
//                       ? Theme.of(context).focusColor
//                       : Colors.transparent),
//               foregroundColor: MaterialStatePropertyAll(
//                   Theme.of(context).textTheme.headlineLarge?.color),
//               side: const MaterialStatePropertyAll(BorderSide.none),
//               textStyle: MaterialStateProperty.resolveWith((states) {
//                 if (states.contains(MaterialState.hovered)) {
//                   return Theme.of(context)
//                       .textTheme
//                       .headlineLarge
//                       ?.copyWith(fontSize: 30.sp);
//                 }
//                 return Theme.of(context).textTheme.headlineLarge;
//               })),
//           onPressed: () => onPressed(buttonIndex),
//           child: Text(title),
//         ));
//   }
// }
