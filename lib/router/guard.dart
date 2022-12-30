import 'package:auto_route/auto_route.dart';
import 'package:hive_flutter/adapters.dart';

import 'package:iattened/router/app_router.gr.dart';


class AuthGuard extends AutoRouteGuard {
  final Box settingBox = Hive.box('setting');
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    // the navigation is paused until resolver.next() is called with either
    // true to resume/continue navigation or false to abort navigation
    if (settingBox.get('login') == null || false) {
      // if user is authenticated we continue
      resolver.next(true);
    } else {
      // we redirect the user to our login page
      router.replaceAll([const HomeScreen()]);
      // resolver.next(true);
    }
  }

}