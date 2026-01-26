// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// import '../../../../core/resources/common_widget/expanded_with_hover_Container.dart';
// import '../../../../generated/locale_keys.g.dart';

// class GeneralSettingFeatureBlockWidget extends StatefulWidget {

//   final bool isHovered;
//   final ScrollController scrollController;
//   final List<Widget>? children;
//   const GeneralSettingFeatureBlockWidget(
//       {super.key,
//       required this.isHovered,
//       required this.scrollController,
//       this.children});

//   @override
//   State<GeneralSettingFeatureBlockWidget> createState() =>
//       _GeneralSettingFeatureBlockWidgetState();
// }

// class _GeneralSettingFeatureBlockWidgetState
//     extends State<GeneralSettingFeatureBlockWidget> {
//   bool isHovered = false;
//   ScrollController _scrollController = ScrollController();
//   List<Widget> _children = [];
//   listScrollToIndex(
//       {required ScrollController scrollController,
//       required int index,
//       required bool isHovered}) {
//     print(scrollController.position.pixels);
//     if (scrollController.position.pixels > (600) &&
//         scrollController.position.pixels < (900)) {
//       scrollController.animateTo(1500.w,
//           duration: const Duration(milliseconds: 300), curve: Curves.easeIn);
//     } else {
//       setState(() {
//         isHovered = false;
//       });
//     }
//   }

//   @override
//   void initState() {
//     isHovered = widget.isHovered;
//     _scrollController = widget.scrollController;
//     _children = widget.children ?? [];

//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         MouseRegion(
//           onExit: (event) => setState(() {
//             isHovered = false;
//           }),
//           child: Padding(
//             padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w),
//             child: SizedBox(
//               height: 250.h,
//               child: ListView(
//                 controller: _scrollController,
//                 scrollDirection: Axis.horizontal,
//                 children: (_children),
//               ),
//             ),
//           ),
//         )
//       ],
//     );
//   }
// }
