// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i8;
import 'package:flutter/material.dart' as _i9;

import '../booking_page_basketball.dart' as _i3;
import '../booking_page_soccer.dart' as _i7;
import '../booking_page_tennis.dart' as _i6;
import '../check_booking_page.dart' as _i4;
import '../gym_login_page.dart' as _i5;
import '../home_page.dart' as _i2;
import '../splash_page.dart' as _i1;

class AppRouter extends _i8.RootStackRouter {
  AppRouter([_i9.GlobalKey<_i9.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i8.PageFactory> pagesMap = {
    SplashRoute.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.SplashPage());
    },
    HomeRoute.name: (routeData) {
      return _i8.CustomPage<dynamic>(
          routeData: routeData,
          child: const _i2.HomePage(),
          durationInMilliseconds: 1000,
          opaque: true,
          barrierDismissible: false);
    },
    BasketballBookingRoute.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.BasketballBookingPage());
    },
    CheckBookingRoute.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i4.CheckBookingPage());
    },
    GymLoginRoute.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i5.GymLoginPage());
    },
    TennisBookingRoute.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i6.TennisBookingPage());
    },
    SoccerBookingRoute.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i7.SoccerBookingPage());
    }
  };

  @override
  List<_i8.RouteConfig> get routes => [
        _i8.RouteConfig(SplashRoute.name, path: '/'),
        _i8.RouteConfig(HomeRoute.name, path: '/home'),
        _i8.RouteConfig(BasketballBookingRoute.name,
            path: '/basketball_booking'),
        _i8.RouteConfig(CheckBookingRoute.name,
            path: '/check_booking_basketball'),
        _i8.RouteConfig(GymLoginRoute.name, path: '/gym'),
        _i8.RouteConfig(TennisBookingRoute.name, path: '/tennis_booking'),
        _i8.RouteConfig(SoccerBookingRoute.name, path: '/soccer_booking')
      ];
}

/// generated route for
/// [_i1.SplashPage]
class SplashRoute extends _i8.PageRouteInfo<void> {
  const SplashRoute() : super(SplashRoute.name, path: '/');

  static const String name = 'SplashRoute';
}

/// generated route for
/// [_i2.HomePage]
class HomeRoute extends _i8.PageRouteInfo<void> {
  const HomeRoute() : super(HomeRoute.name, path: '/home');

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i3.BasketballBookingPage]
class BasketballBookingRoute extends _i8.PageRouteInfo<void> {
  const BasketballBookingRoute()
      : super(BasketballBookingRoute.name, path: '/basketball_booking');

  static const String name = 'BasketballBookingRoute';
}

/// generated route for
/// [_i4.CheckBookingPage]
class CheckBookingRoute extends _i8.PageRouteInfo<void> {
  const CheckBookingRoute()
      : super(CheckBookingRoute.name, path: '/check_booking_basketball');

  static const String name = 'CheckBookingRoute';
}

/// generated route for
/// [_i5.GymLoginPage]
class GymLoginRoute extends _i8.PageRouteInfo<void> {
  const GymLoginRoute() : super(GymLoginRoute.name, path: '/gym');

  static const String name = 'GymLoginRoute';
}

/// generated route for
/// [_i6.TennisBookingPage]
class TennisBookingRoute extends _i8.PageRouteInfo<void> {
  const TennisBookingRoute()
      : super(TennisBookingRoute.name, path: '/tennis_booking');

  static const String name = 'TennisBookingRoute';
}

/// generated route for
/// [_i7.SoccerBookingPage]
class SoccerBookingRoute extends _i8.PageRouteInfo<void> {
  const SoccerBookingRoute()
      : super(SoccerBookingRoute.name, path: '/soccer_booking');

  static const String name = 'SoccerBookingRoute';
}
