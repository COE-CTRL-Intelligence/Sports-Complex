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

import '../booking_page.dart' as _i3;
import '../check_booking_page.dart' as _i4;
import '../gym_login_page.dart' as _i5;
import '../home_page.dart' as _i2;
import '../schedule_booking_page.dart' as _i6;
import '../select_sport_page.dart' as _i7;
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
          durationInMilliseconds: 1500,
          opaque: true,
          barrierDismissible: false);
    },
    BookingRoute.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.BookingPage());
    },
    CheckBookingRoute.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i4.CheckBookingPage());
    },
    GymLoginRoute.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i5.GymLoginPage());
    },
    ScheduleBookingRoute.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i6.ScheduleBookingPage());
    },
    SelectSportRoute.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i7.SelectSportPage());
    }
  };

  @override
  List<_i8.RouteConfig> get routes => [
        _i8.RouteConfig(SplashRoute.name, path: '/'),
        _i8.RouteConfig(HomeRoute.name, path: '/home'),
        _i8.RouteConfig(BookingRoute.name, path: '/booking'),
        _i8.RouteConfig(CheckBookingRoute.name, path: '/check_booking'),
        _i8.RouteConfig(GymLoginRoute.name, path: '/gym'),
        _i8.RouteConfig(ScheduleBookingRoute.name, path: '/schedule_booking'),
        _i8.RouteConfig(SelectSportRoute.name, path: '/select_sport_page')
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
/// [_i3.BookingPage]
class BookingRoute extends _i8.PageRouteInfo<void> {
  const BookingRoute() : super(BookingRoute.name, path: '/booking');

  static const String name = 'BookingRoute';
}

/// generated route for
/// [_i4.CheckBookingPage]
class CheckBookingRoute extends _i8.PageRouteInfo<void> {
  const CheckBookingRoute()
      : super(CheckBookingRoute.name, path: '/check_booking');

  static const String name = 'CheckBookingRoute';
}

/// generated route for
/// [_i5.GymLoginPage]
class GymLoginRoute extends _i8.PageRouteInfo<void> {
  const GymLoginRoute() : super(GymLoginRoute.name, path: '/gym');

  static const String name = 'GymLoginRoute';
}

/// generated route for
/// [_i6.ScheduleBookingPage]
class ScheduleBookingRoute extends _i8.PageRouteInfo<void> {
  const ScheduleBookingRoute()
      : super(ScheduleBookingRoute.name, path: '/schedule_booking');

  static const String name = 'ScheduleBookingRoute';
}

/// generated route for
/// [_i7.SelectSportPage]
class SelectSportRoute extends _i8.PageRouteInfo<void> {
  const SelectSportRoute()
      : super(SelectSportRoute.name, path: '/select_sport_page');

  static const String name = 'SelectSportRoute';
}
