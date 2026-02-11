import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:go_router/go_router.dart';
import 'package:peng_cafe/config/app/app_preferences.dart';

import 'package:peng_cafe/config/route/route_tracker.dart';
import 'package:peng_cafe/core/injection_container.dart';
import 'package:peng_cafe/core/resource/color_manager.dart';
import 'package:peng_cafe/features/setting/presentation/pages/setting_page.dart';

import '../../core/resource/main_page/app_side_bar.dart';
import '../../features/home_page/presentation/pages/home_page.dart';
import '../../features/login/presentations/pages/login_page.dart';
import '../../features/orders/presentation/pages/orders_page.dart';
import '../../features/products/presentation/pages/products_page.dart';

String? currentPath = RoutesPath.loginPage;

class RoutesName {
  static String homePage = "homePage";
  static String loginPage = "loginPage";

  static String signupPage = "signupPage";
  static String productsPage = "productsPage";
  static String settingPage = "settingPage";
  static String ordersPage = "ordersPage";
}

class RoutesPath {
  static String homeRoute = '/';
  static String loginPage = '/login';

  static String signupPage = '/signup';
  static String productsPage = '/products';
  static String settingPage = '/setting';
  static String ordersPage = '/orders';
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
  initialLocation: RoutesPath.homeRoute,
  navigatorKey: navigatorKey,
  routes: [
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) => ThemeSwitchingArea(
        child: Scaffold(
          body: state.uri.toString().endsWith(RoutesPath.loginPage)
              ? navigationShell
              : Row(
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.only(start: 12.w),
                      child: AppSideBar(navigationShell: navigationShell),
                    ),

                    Expanded(child: navigationShell),
                  ],
                ),
        ),
      ),

      branches: [
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
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: RoutesPath.ordersPage,
              name: RoutesName.ordersPage,
              pageBuilder: (context, state) => _customTransitionPage(
                child: const OrdersPage(),
                state: state,
              ),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: RoutesPath.productsPage,
              name: RoutesName.productsPage,
              pageBuilder: (context, state) => _customTransitionPage(
                child: const ProductsPage(),
                state: state,
              ),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: RoutesPath.settingPage,
              name: RoutesName.settingPage,
              pageBuilder: (context, state) => _customTransitionPage(
                child: const SettingPage(),
                state: state,
              ),
            ),
          ],
        ),
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
