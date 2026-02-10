import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class AppSideBar extends StatefulWidget {
  final StatefulNavigationShell navigationShell;

  const AppSideBar({super.key, required this.navigationShell});

  @override
  State<AppSideBar> createState() => _AppSideBarState();
}

class _AppSideBarState extends State<AppSideBar> {
  double containerWidth = 100.w;
  double containerWidthCollapsed = 100.w;
  double containerWidthExpanded = 200.w;
  bool isExpanded = false;
  changeContainerWidth() {
    setState(() {
      isExpanded = !isExpanded;
      containerWidth = isExpanded
          ? containerWidthExpanded
          : containerWidthCollapsed;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      width: containerWidth,
      color: Theme.of(context).colorScheme.surface,
      child: ListView(
        children: [
          const SizedBox(height: 20),
          const Center(
            child: Text(
              'Peng Cafe',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          const Divider(),

          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Home'),
            onTap: () => widget.navigationShell.goBranch(0),
          ),

          ListTile(
            leading: const Icon(Icons.inventory),
            title: const Text('Products'),
            onTap: () => widget.navigationShell.goBranch(1),
          ),

          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Settings'),
            onTap: () => widget.navigationShell.goBranch(2),
          ),
        ],
      ),
    );
  }
}
