import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';
import 'package:peng_cafe/config/app/app_preferences.dart';

import 'package:peng_cafe/config/route/route_tracker.dart';
import 'package:peng_cafe/core/injection_container.dart';

import '../../features/home_page/presentation/pages/home_page.dart';
import '../../features/login/presentations/pages/login_page.dart';

String? currentPath = RoutesPath.loginPage;

class RoutesName {
  static String homePage = "homePage";
  static String loginPage = "loginPage";
  static String firstUsePage = "firstUsePage";
  static String signupPage = "signupPage";
}

class RoutesPath {
  static String homeRoute = '/';
  static String loginPage = '/login';

  static String signupPage = '/signup';
}

GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
String? lastPath;
GoRouter goRouter = GoRouter(
  observers: [RouteTracker()],
  redirect: (context, state) {
    currentPath = state.uri.toString();
    // if (currentPath?.endsWith(lastPath ?? "") == false) {
    //   return lastPath;
    // }
    if (!getItInstance<AppPreferences>().getUserLoginState()) {
      return RoutesPath.loginPage;
    }
  },
  initialLocation: RoutesPath.loginPage,
  navigatorKey: navigatorKey,
  routes: [
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) =>
          ThemeSwitchingArea(child: Scaffold(body: navigationShell)),

      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: RoutesPath.loginPage,
              name: RoutesName.loginPage,
              pageBuilder: (context, state) =>
                  _customTransitionPage(child: const LoginPage(), state: state),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: RoutesPath.homeRoute,
              name: RoutesName.homePage,
              pageBuilder: (context, state) =>
                  _customTransitionPage(child: const HomePage(), state: state),
            ),
          ],
        ),
      ],
    ),
  ],
);
CustomTransitionPage _customTransitionPage({
  required Widget child,
  GoRouterState? state,
}) {
  return CustomTransitionPage(
    transitionDuration: Duration(milliseconds: 300),
    reverseTransitionDuration: Duration(milliseconds: 300),
    child: child,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return FadeTransition(
        key: state?.pageKey,
        opacity: animation.drive(CurveTween(curve: Curves.easeInOut)),
        // opacity: animation,
        child: child,
      );
    },
  );
}
