// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i6;
import 'package:flutter/material.dart' as _i7;

import '../booking_page.dart' as _i3;
import '../check_booking_page.dart' as _i4;
import '../gym_page.dart' as _i5;
import '../home_page.dart' as _i2;
import '../splash_page.dart' as _i1;

class AppRouter extends _i6.RootStackRouter {
  AppRouter([_i7.GlobalKey<_i7.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i6.PageFactory> pagesMap = {
    SplashRoute.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.SplashPage());
    },
    HomeRoute.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.HomePage());
    },
    BookingRoute.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.BookingPage());
    },
    CheckBookingRoute.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i4.CheckBookingPage());
    },
    GymRoute.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i5.GymPage());
    }
  };

  @override
  List<_i6.RouteConfig> get routes => [
        _i6.RouteConfig(SplashRoute.name, path: '/'),
        _i6.RouteConfig(HomeRoute.name, path: '/home'),
        _i6.RouteConfig(BookingRoute.name, path: '/booking'),
        _i6.RouteConfig(CheckBookingRoute.name, path: '/check_booking'),
        _i6.RouteConfig(GymRoute.name, path: '/gym')
      ];
}

/// generated route for
/// [_i1.SplashPage]
class SplashRoute extends _i6.PageRouteInfo<void> {
  const SplashRoute() : super(SplashRoute.name, path: '/');

  static const String name = 'SplashRoute';
}

/// generated route for
/// [_i2.HomePage]
class HomeRoute extends _i6.PageRouteInfo<void> {
  const HomeRoute() : super(HomeRoute.name, path: '/home');

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i3.BookingPage]
class BookingRoute extends _i6.PageRouteInfo<void> {
  const BookingRoute() : super(BookingRoute.name, path: '/booking');

  static const String name = 'BookingRoute';
}

/// generated route for
/// [_i4.CheckBookingPage]
class CheckBookingRoute extends _i6.PageRouteInfo<void> {
  const CheckBookingRoute()
      : super(CheckBookingRoute.name, path: '/check_booking');

  static const String name = 'CheckBookingRoute';
}

/// generated route for
/// [_i5.GymPage]
class GymRoute extends _i6.PageRouteInfo<void> {
  const GymRoute() : super(GymRoute.name, path: '/gym');

  static const String name = 'GymRoute';
}
