import 'package:flutter/widgets.dart';

class RouteTracker extends NavigatorObserver {
  @override
  void didPush(Route route, Route? previousRoute) {}

  @override
  void didPop(Route route, Route? previousRoute) {}

  @override
  void didReplace({Route? newRoute, Route? oldRoute}) {}
}
