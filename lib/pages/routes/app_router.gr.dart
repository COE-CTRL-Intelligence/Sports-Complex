// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i11;
import 'package:flutter/material.dart' as _i12;

import '../about_page.dart' as _i7;
import '../booking_page.dart' as _i3;
import '../check_booking_page.dart' as _i4;
import '../contact_us_page.dart' as _i8;
import '../gym_login_page.dart' as _i5;
import '../gym_signup_page.dart' as _i6;
import '../home_page.dart' as _i2;
import '../schedule_booking_page.dart' as _i9;
import '../select_sport_page.dart' as _i10;
import '../splash_page.dart' as _i1;

class AppRouter extends _i11.RootStackRouter {
  AppRouter([_i12.GlobalKey<_i12.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i11.PageFactory> pagesMap = {
    SplashRoute.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.SplashPage());
    },
    HomeRoute.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.HomePage());
    },
    BookingRoute.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.BookingPage());
    },
    CheckBookingRoute.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i4.CheckBookingPage());
    },
    GymLoginRoute.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i5.GymLoginPage());
    },
    GymSignUpRoute.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i6.GymSignUpPage());
    },
    AboutRoute.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i7.AboutPage());
    },
    ContactUsRoute.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i8.ContactUsPage());
    },
    ScheduleBookingRoute.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i9.ScheduleBookingPage());
    },
    SelectSportRoute.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i10.SelectSportPage());
    }
  };

  @override
  List<_i11.RouteConfig> get routes => [
        _i11.RouteConfig(SplashRoute.name, path: '/'),
        _i11.RouteConfig(HomeRoute.name, path: '/home'),
        _i11.RouteConfig(BookingRoute.name, path: '/booking'),
        _i11.RouteConfig(CheckBookingRoute.name, path: '/check_booking'),
        _i11.RouteConfig(GymLoginRoute.name, path: '/gym_login'),
        _i11.RouteConfig(GymSignUpRoute.name, path: '/gym_signup'),
        _i11.RouteConfig(AboutRoute.name, path: '/About'),
        _i11.RouteConfig(ContactUsRoute.name, path: '/Contact'),
        _i11.RouteConfig(ScheduleBookingRoute.name, path: '/schedule_booking'),
        _i11.RouteConfig(SelectSportRoute.name, path: '/select_sport_page')
      ];
}

/// generated route for
/// [_i1.SplashPage]
class SplashRoute extends _i11.PageRouteInfo<void> {
  const SplashRoute() : super(SplashRoute.name, path: '/');

  static const String name = 'SplashRoute';
}

/// generated route for
/// [_i2.HomePage]
class HomeRoute extends _i11.PageRouteInfo<void> {
  const HomeRoute() : super(HomeRoute.name, path: '/home');

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i3.BookingPage]
class BookingRoute extends _i11.PageRouteInfo<void> {
  const BookingRoute() : super(BookingRoute.name, path: '/booking');

  static const String name = 'BookingRoute';
}

/// generated route for
/// [_i4.CheckBookingPage]
class CheckBookingRoute extends _i11.PageRouteInfo<void> {
  const CheckBookingRoute()
      : super(CheckBookingRoute.name, path: '/check_booking');

  static const String name = 'CheckBookingRoute';
}

/// generated route for
/// [_i5.GymLoginPage]
class GymLoginRoute extends _i11.PageRouteInfo<void> {
  const GymLoginRoute() : super(GymLoginRoute.name, path: '/gym_login');

  static const String name = 'GymLoginRoute';
}

/// generated route for
/// [_i6.GymSignUpPage]
class GymSignUpRoute extends _i11.PageRouteInfo<void> {
  const GymSignUpRoute() : super(GymSignUpRoute.name, path: '/gym_signup');

  static const String name = 'GymSignUpRoute';
}

/// generated route for
/// [_i7.AboutPage]
class AboutRoute extends _i11.PageRouteInfo<void> {
  const AboutRoute() : super(AboutRoute.name, path: '/About');

  static const String name = 'AboutRoute';
}

/// generated route for
/// [_i8.ContactUsPage]
class ContactUsRoute extends _i11.PageRouteInfo<void> {
  const ContactUsRoute() : super(ContactUsRoute.name, path: '/Contact');

  static const String name = 'ContactUsRoute';
}

/// generated route for
/// [_i9.ScheduleBookingPage]
class ScheduleBookingRoute extends _i11.PageRouteInfo<void> {
  const ScheduleBookingRoute()
      : super(ScheduleBookingRoute.name, path: '/schedule_booking');

  static const String name = 'ScheduleBookingRoute';
}

/// generated route for
/// [_i10.SelectSportPage]
class SelectSportRoute extends _i11.PageRouteInfo<void> {
  const SelectSportRoute()
      : super(SelectSportRoute.name, path: '/select_sport_page');

  static const String name = 'SelectSportRoute';
}
