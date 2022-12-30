// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i4;
import 'package:flutter/material.dart' as _i5;

import '../presentation/screens/home.dart' as _i3;
import '../presentation/screens/login.dart' as _i1;
import '../presentation/screens/register.dart' as _i2;
import 'guard.dart' as _i6;

class AppRouter extends _i4.RootStackRouter {
  AppRouter({
    _i5.GlobalKey<_i5.NavigatorState>? navigatorKey,
    required this.authGuard,
  }) : super(navigatorKey);

  final _i6.AuthGuard authGuard;

  @override
  final Map<String, _i4.PageFactory> pagesMap = {
    LoginScreen.name: (routeData) {
      return _i4.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i1.LoginScreen(),
        opaque: true,
        barrierDismissible: false,
      );
    },
    RegisterScreen.name: (routeData) {
      return _i4.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i2.RegisterScreen(),
        opaque: true,
        barrierDismissible: false,
      );
    },
    HomeScreen.name: (routeData) {
      return _i4.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i3.HomeScreen(),
        opaque: true,
        barrierDismissible: false,
      );
    },
  };

  @override
  List<_i4.RouteConfig> get routes => [
        _i4.RouteConfig(
          LoginScreen.name,
          path: '/',
          guards: [authGuard],
        ),
        _i4.RouteConfig(
          RegisterScreen.name,
          path: '/register-screen',
        ),
        _i4.RouteConfig(
          HomeScreen.name,
          path: '/home-screen',
        ),
      ];
}

/// generated route for
/// [_i1.LoginScreen]
class LoginScreen extends _i4.PageRouteInfo<void> {
  const LoginScreen()
      : super(
          LoginScreen.name,
          path: '/',
        );

  static const String name = 'LoginScreen';
}

/// generated route for
/// [_i2.RegisterScreen]
class RegisterScreen extends _i4.PageRouteInfo<void> {
  const RegisterScreen()
      : super(
          RegisterScreen.name,
          path: '/register-screen',
        );

  static const String name = 'RegisterScreen';
}

/// generated route for
/// [_i3.HomeScreen]
class HomeScreen extends _i4.PageRouteInfo<void> {
  const HomeScreen()
      : super(
          HomeScreen.name,
          path: '/home-screen',
        );

  static const String name = 'HomeScreen';
}
