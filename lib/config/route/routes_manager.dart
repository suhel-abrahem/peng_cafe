import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:go_router/go_router.dart';
import 'package:peng_cafe/config/app/app_preferences.dart';

import 'package:peng_cafe/config/route/route_tracker.dart';
import 'package:peng_cafe/core/injection_container.dart';

import 'package:peng_cafe/features/setting/presentation/pages/setting_page.dart';

import '../../core/enums/tables_enum/table_type_enum.dart';
import '../../core/resource/main_page/app_side_bar.dart';
import '../../features/home_page/presentation/pages/home_page.dart';
import '../../features/login/presentations/pages/login_page.dart';
import '../../features/orders/presentation/pages/orders_page.dart';
import '../../features/products/presentation/pages/products_page.dart';
import '../../features/table_page/presentation/pages/table_page.dart';

String? currentPath = RoutesPath.loginPage;

class RoutesName {
  static String homePage = "homePage";
  static String loginPage = "loginPage";

  static String signupPage = "signupPage";
  static String productsPage = "productsPage";
  static String settingPage = "settingPage";
  static String ordersPage = "ordersPage";
  static String tablePage = "tablePage";
}

class RoutesPath {
  static String homeRoute = '/';
  static String loginPage = '/login';

  static String signupPage = '/signup';
  static String productsPage = '/products';
  static String settingPage = '/setting';
  static String ordersPage = '/orders';
  static String tablePage = '/table/:tableNumber/:tableType';
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
    return null;
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
            GoRoute(
              path: RoutesPath.tablePage,
              name: RoutesName.tablePage,
              redirect: (context, state) {
                final tableNumber = state.pathParameters['tableNumber'];
                final tableType = state.pathParameters['tableType'];

                if (tableNumber == null || tableType == null) {
                  return RoutesPath.homeRoute;
                }

                return null; // ✅ كل شيء تمام
              },
              pageBuilder: (context, state) {
                final tableNumber = int.parse(
                  state.pathParameters['tableNumber']!,
                );

                final tableType = TableTypeEnum.values.firstWhere(
                  (e) => e.name == state.pathParameters['tableType']!,
                );

                return _customTransitionPage(
                  child: TablePage(
                    tableNumber: tableNumber,
                    tableType: tableType,
                    userId: 0,
                  ),
                  state: state,
                );
              },
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
