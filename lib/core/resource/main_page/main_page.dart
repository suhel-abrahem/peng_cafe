import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:easy_localization/easy_localization.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:go_router/go_router.dart';
import '../../injection_container.dart';

import '/core/resource/color_manager.dart';

import '../../../config/app/app_preferences.dart';
import '../../../config/route/routes_manager.dart';

import '../../constant/font_constants.dart';

import '../custom_widget/snake_bar_widget/snake_bar_widget.dart';

class MainPage extends StatefulWidget {
  final PreferredSizeWidget? appBar;
  final Widget body;
  final String? title;
  final Widget? floatingActionButton;
  final Widget? bottomNavigationBar;
  final bool? haveBottomBar;
  final Widget? navigationTaps;
  final Widget? drawer;
  final String? pagePath;
  final ValueChanged<bool>? onAnimationComplete;
  final List<Widget>? actions;
  final PreferredSizeWidget? bottom;
  const MainPage({
    super.key,
    required this.body,
    this.title,
    this.floatingActionButton,
    this.bottomNavigationBar,
    this.navigationTaps,
    this.actions,
    this.pagePath,
    this.drawer,
    this.haveBottomBar,
    this.appBar,
    this.bottom,
    this.onAnimationComplete,
  });

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  double yOffset = 0;
  bool animationDone = false;

  double startPosition = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  didChangeDependencies() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: Colors.transparent,
        systemNavigationBarIconBrightness:
            (getItInstance<AppPreferences>().getThemeBool())
            ? Brightness.dark
            : Brightness.light,
        statusBarIconBrightness:
            (getItInstance<AppPreferences>().getThemeBool())
            ? Brightness.dark
            : Brightness.light,
      ),
    );
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AnimatedPositioned(
          duration: 300.ms,
          curve: Curves.easeInOut,
          top: 0,
          left: 0,
          right: 0,
          bottom: 0,
          child: GestureDetector(
            onVerticalDragUpdate: (details) {
              setState(() {
                yOffset += details.delta.dy;
                if (yOffset < 0) {
                  yOffset = 0;
                } else if (yOffset > 100) {
                  yOffset = 100;
                }
              });
            },
            onVerticalDragCancel: () {
              setState(() {
                yOffset = 0;
              });
            },
            onVerticalDragEnd: (details) {
              if (yOffset > 90) {
                setState(() {
                  yOffset = 0;
                  animationDone = false;
                });
                print(
                  "user info: ${getItInstance<AppPreferences>().getUserInfo()}",
                );

                if (context.canPop()) {
                  context.pop();
                }
                context.push(currentPath ?? RoutesPath.homeRoute);
              }
              setState(() {
                yOffset = 0;
              });
            },
            child: ThemeSwitchingArea(
              child: Scaffold(
                backgroundColor: Theme.of(context).scaffoldBackgroundColor,

                body: RepaintBoundary(
                  child: widget.body
                      .animate()
                      .scaleXY(duration: 600.ms, curve: Curves.easeInOut)
                      .callback(
                        delay: Duration(milliseconds: 100),
                        callback: (_) {
                          if (!animationDone) {
                            animationDone = true;
                            if (widget.onAnimationComplete != null) {
                              widget.onAnimationComplete!(animationDone);
                            }
                          }
                        },
                      ),
                ),

                drawer: widget.drawer,
                floatingActionButton: widget.floatingActionButton,

                floatingActionButtonLocation:
                    FloatingActionButtonLocation.endFloat,
              ),
            ),
          ),
        ),
        AnimatedPositioned(
          duration: 300.ms,
          top: yOffset.h,
          left: 0,
          right: 0,

          child: AnimatedOpacity(
            duration: Duration(milliseconds: 300),
            opacity: yOffset == 0 ? 0.0 : 1.0,
            child: Center(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Theme.of(context).shadowColor,
                      blurRadius: 8.r,
                      offset: Offset(0, (4 * (yOffset / 100)).h),
                    ),
                  ],
                ),
                child: AnimatedRotation(
                  duration: Duration(milliseconds: 300),
                  turns: yOffset / 100,
                  child: Icon(Icons.refresh, size: 40.sp, color: Colors.white),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
