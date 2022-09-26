// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i12;
import 'package:flutter/material.dart' as _i13;

import '../about_page.dart' as _i7;
import '../booking_page.dart' as _i3;
import '../check_booking_page.dart' as _i4;
import '../contact_us_page.dart' as _i8;
import '../gym_dashboard_page.dart' as _i10;
import '../gym_login_page.dart' as _i5;
import '../gym_signup_page.dart' as _i6;
import '../home_page.dart' as _i2;
import '../schedule_booking_page.dart' as _i11;
import '../select_sport_page.dart' as _i9;
import '../splash_page.dart' as _i1;

class AppRouter extends _i12.RootStackRouter {
  AppRouter([_i13.GlobalKey<_i13.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i12.PageFactory> pagesMap = {
    SplashRoute.name: (routeData) {
      return _i12.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.SplashPage());
    },
    HomeRoute.name: (routeData) {
      return _i12.CustomPage<dynamic>(
          routeData: routeData,
          child: const _i2.HomePage(),
          durationInMilliseconds: 1200,
          opaque: true,
          barrierDismissible: false);
    },
    BookingRoute.name: (routeData) {
      final args = routeData.argsAs<BookingRouteArgs>();
      return _i12.MaterialPageX<dynamic>(
          routeData: routeData,
          child:
              _i3.BookingPage(key: args.key, title: args.title, id: args.id));
    },
    CheckBookingRoute.name: (routeData) {
      return _i12.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i4.CheckBookingPage());
    },
    GymLoginRoute.name: (routeData) {
      return _i12.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i5.GymLoginPage());
    },
    GymSignUpRoute.name: (routeData) {
      return _i12.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i6.GymSignUpPage());
    },
    AboutRoute.name: (routeData) {
      return _i12.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i7.AboutPage());
    },
    ContactUsRoute.name: (routeData) {
      return _i12.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i8.ContactUsPage());
    },
    SelectSportRoute.name: (routeData) {
      return _i12.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i9.SelectSportPage());
    },
    GymDashboardRoute.name: (routeData) {
      return _i12.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i10.GymDashboardPage());
    },
    ScheduleTimingRoute.name: (routeData) {
      final args = routeData.argsAs<ScheduleTimingRouteArgs>();
      return _i12.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i11.ScheduleTimingPage(
              key: args.key, inputTime: args.inputTime));
    }
  };

  @override
  List<_i12.RouteConfig> get routes => [
        _i12.RouteConfig(SplashRoute.name, path: '/'),
        _i12.RouteConfig(HomeRoute.name, path: '/home'),
        _i12.RouteConfig(BookingRoute.name, path: '/booking'),
        _i12.RouteConfig(CheckBookingRoute.name, path: '/check_booking'),
        _i12.RouteConfig(GymLoginRoute.name, path: '/gym_login'),
        _i12.RouteConfig(GymSignUpRoute.name, path: '/gym_signup'),
        _i12.RouteConfig(AboutRoute.name, path: '/About'),
        _i12.RouteConfig(ContactUsRoute.name, path: '/Contact'),
        _i12.RouteConfig(SelectSportRoute.name, path: '/select_sport_page'),
        _i12.RouteConfig(GymDashboardRoute.name, path: '/gym_dashboard'),
        _i12.RouteConfig(ScheduleTimingRoute.name, path: '/schedule_timing')
      ];
}

/// generated route for
/// [_i1.SplashPage]
class SplashRoute extends _i12.PageRouteInfo<void> {
  const SplashRoute() : super(SplashRoute.name, path: '/');

  static const String name = 'SplashRoute';
}

/// generated route for
/// [_i2.HomePage]
class HomeRoute extends _i12.PageRouteInfo<void> {
  const HomeRoute() : super(HomeRoute.name, path: '/home');

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i3.BookingPage]
class BookingRoute extends _i12.PageRouteInfo<BookingRouteArgs> {
  BookingRoute({_i13.Key? key, required String title, required String id})
      : super(BookingRoute.name,
            path: '/booking',
            args: BookingRouteArgs(key: key, title: title, id: id));

  static const String name = 'BookingRoute';
}

class BookingRouteArgs {
  const BookingRouteArgs({this.key, required this.title, required this.id});

  final _i13.Key? key;

  final String title;

  final String id;

  @override
  String toString() {
    return 'BookingRouteArgs{key: $key, title: $title, id: $id}';
  }
}

/// generated route for
/// [_i4.CheckBookingPage]
class CheckBookingRoute extends _i12.PageRouteInfo<void> {
  const CheckBookingRoute()
      : super(CheckBookingRoute.name, path: '/check_booking');

  static const String name = 'CheckBookingRoute';
}

/// generated route for
/// [_i5.GymLoginPage]
class GymLoginRoute extends _i12.PageRouteInfo<void> {
  const GymLoginRoute() : super(GymLoginRoute.name, path: '/gym_login');

  static const String name = 'GymLoginRoute';
}

/// generated route for
/// [_i6.GymSignUpPage]
class GymSignUpRoute extends _i12.PageRouteInfo<void> {
  const GymSignUpRoute() : super(GymSignUpRoute.name, path: '/gym_signup');

  static const String name = 'GymSignUpRoute';
}

/// generated route for
/// [_i7.AboutPage]
class AboutRoute extends _i12.PageRouteInfo<void> {
  const AboutRoute() : super(AboutRoute.name, path: '/About');

  static const String name = 'AboutRoute';
}

/// generated route for
/// [_i8.ContactUsPage]
class ContactUsRoute extends _i12.PageRouteInfo<void> {
  const ContactUsRoute() : super(ContactUsRoute.name, path: '/Contact');

  static const String name = 'ContactUsRoute';
}

/// generated route for
/// [_i9.SelectSportPage]
class SelectSportRoute extends _i12.PageRouteInfo<void> {
  const SelectSportRoute()
      : super(SelectSportRoute.name, path: '/select_sport_page');

  static const String name = 'SelectSportRoute';
}

/// generated route for
/// [_i10.GymDashboardPage]
class GymDashboardRoute extends _i12.PageRouteInfo<void> {
  const GymDashboardRoute()
      : super(GymDashboardRoute.name, path: '/gym_dashboard');

  static const String name = 'GymDashboardRoute';
}

/// generated route for
/// [_i11.ScheduleTimingPage]
class ScheduleTimingRoute extends _i12.PageRouteInfo<ScheduleTimingRouteArgs> {
  ScheduleTimingRoute({_i13.Key? key, required DateTime? inputTime})
      : super(ScheduleTimingRoute.name,
            path: '/schedule_timing',
            args: ScheduleTimingRouteArgs(key: key, inputTime: inputTime));

  static const String name = 'ScheduleTimingRoute';
}

class ScheduleTimingRouteArgs {
  const ScheduleTimingRouteArgs({this.key, required this.inputTime});

  final _i13.Key? key;

  final DateTime? inputTime;

  @override
  String toString() {
    return 'ScheduleTimingRouteArgs{key: $key, inputTime: $inputTime}';
  }
}
