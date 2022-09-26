// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i13;
import 'package:flutter/material.dart' as _i14;
import 'package:syncfusion_flutter_calendar/calendar.dart' as _i15;

import '../about_page.dart' as _i7;
import '../booking_page.dart' as _i3;
import '../check_booking_page.dart' as _i4;
import '../contact_us_page.dart' as _i8;
import '../gym_dashboard_page.dart' as _i10;
import '../gym_login_page.dart' as _i5;
import '../gym_signup_page.dart' as _i6;
import '../home_page.dart' as _i2;
import '../payment_page.dart' as _i12;
import '../schedule_booking_page.dart' as _i11;
import '../select_sport_page.dart' as _i9;
import '../splash_page.dart' as _i1;

class AppRouter extends _i13.RootStackRouter {
  AppRouter([_i14.GlobalKey<_i14.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i13.PageFactory> pagesMap = {
    SplashRoute.name: (routeData) {
      return _i13.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.SplashPage());
    },
    HomeRoute.name: (routeData) {
      return _i13.CustomPage<dynamic>(
          routeData: routeData,
          child: const _i2.HomePage(),
          durationInMilliseconds: 1200,
          opaque: true,
          barrierDismissible: false);
    },
    BookingRoute.name: (routeData) {
      final args = routeData.argsAs<BookingRouteArgs>();
      return _i13.MaterialPageX<dynamic>(
          routeData: routeData,
          child:
              _i3.BookingPage(key: args.key, title: args.title, id: args.id));
    },
    CheckBookingRoute.name: (routeData) {
      return _i13.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i4.CheckBookingPage());
    },
    GymLoginRoute.name: (routeData) {
      return _i13.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i5.GymLoginPage());
    },
    GymSignUpRoute.name: (routeData) {
      return _i13.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i6.GymSignUpPage());
    },
    AboutRoute.name: (routeData) {
      return _i13.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i7.AboutPage());
    },
    ContactUsRoute.name: (routeData) {
      return _i13.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i8.ContactUsPage());
    },
    SelectSportRoute.name: (routeData) {
      return _i13.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i9.SelectSportPage());
    },
    GymDashboardRoute.name: (routeData) {
      return _i13.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i10.GymDashboardPage());
    },
    ScheduleBookingRoute.name: (routeData) {
      final args = routeData.argsAs<ScheduleBookingRouteArgs>();
      return _i13.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i11.ScheduleBookingPage(
              key: args.key,
              inputTime: args.inputTime,
              bookedDates: args.bookedDates));
    },
    PaymentRoute.name: (routeData) {
      return _i13.MaterialPageX<dynamic>(
          routeData: routeData, child: _i12.PaymentPage());
    }
  };

  @override
  List<_i13.RouteConfig> get routes => [
        _i13.RouteConfig(SplashRoute.name, path: '/'),
        _i13.RouteConfig(HomeRoute.name, path: '/home'),
        _i13.RouteConfig(BookingRoute.name, path: '/booking'),
        _i13.RouteConfig(CheckBookingRoute.name, path: '/check_booking'),
        _i13.RouteConfig(GymLoginRoute.name, path: '/gym_login'),
        _i13.RouteConfig(GymSignUpRoute.name, path: '/gym_signup'),
        _i13.RouteConfig(AboutRoute.name, path: '/About'),
        _i13.RouteConfig(ContactUsRoute.name, path: '/Contact'),
        _i13.RouteConfig(SelectSportRoute.name, path: '/select_sport_page'),
        _i13.RouteConfig(GymDashboardRoute.name, path: '/gym_dashboard'),
        _i13.RouteConfig(ScheduleBookingRoute.name, path: '/schedule_booking'),
        _i13.RouteConfig(PaymentRoute.name, path: '/payment')
      ];
}

/// generated route for
/// [_i1.SplashPage]
class SplashRoute extends _i13.PageRouteInfo<void> {
  const SplashRoute() : super(SplashRoute.name, path: '/');

  static const String name = 'SplashRoute';
}

/// generated route for
/// [_i2.HomePage]
class HomeRoute extends _i13.PageRouteInfo<void> {
  const HomeRoute() : super(HomeRoute.name, path: '/home');

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i3.BookingPage]
class BookingRoute extends _i13.PageRouteInfo<BookingRouteArgs> {
  BookingRoute({_i14.Key? key, required String title, required String id})
      : super(BookingRoute.name,
            path: '/booking',
            args: BookingRouteArgs(key: key, title: title, id: id));

  static const String name = 'BookingRoute';
}

class BookingRouteArgs {
  const BookingRouteArgs({this.key, required this.title, required this.id});

  final _i14.Key? key;

  final String title;

  final String id;

  @override
  String toString() {
    return 'BookingRouteArgs{key: $key, title: $title, id: $id}';
  }
}

/// generated route for
/// [_i4.CheckBookingPage]
class CheckBookingRoute extends _i13.PageRouteInfo<void> {
  const CheckBookingRoute()
      : super(CheckBookingRoute.name, path: '/check_booking');

  static const String name = 'CheckBookingRoute';
}

/// generated route for
/// [_i5.GymLoginPage]
class GymLoginRoute extends _i13.PageRouteInfo<void> {
  const GymLoginRoute() : super(GymLoginRoute.name, path: '/gym_login');

  static const String name = 'GymLoginRoute';
}

/// generated route for
/// [_i6.GymSignUpPage]
class GymSignUpRoute extends _i13.PageRouteInfo<void> {
  const GymSignUpRoute() : super(GymSignUpRoute.name, path: '/gym_signup');

  static const String name = 'GymSignUpRoute';
}

/// generated route for
/// [_i7.AboutPage]
class AboutRoute extends _i13.PageRouteInfo<void> {
  const AboutRoute() : super(AboutRoute.name, path: '/About');

  static const String name = 'AboutRoute';
}

/// generated route for
/// [_i8.ContactUsPage]
class ContactUsRoute extends _i13.PageRouteInfo<void> {
  const ContactUsRoute() : super(ContactUsRoute.name, path: '/Contact');

  static const String name = 'ContactUsRoute';
}

/// generated route for
/// [_i9.SelectSportPage]
class SelectSportRoute extends _i13.PageRouteInfo<void> {
  const SelectSportRoute()
      : super(SelectSportRoute.name, path: '/select_sport_page');

  static const String name = 'SelectSportRoute';
}

/// generated route for
/// [_i10.GymDashboardPage]
class GymDashboardRoute extends _i13.PageRouteInfo<void> {
  const GymDashboardRoute()
      : super(GymDashboardRoute.name, path: '/gym_dashboard');

  static const String name = 'GymDashboardRoute';
}

/// generated route for
/// [_i11.ScheduleBookingPage]
class ScheduleBookingRoute
    extends _i13.PageRouteInfo<ScheduleBookingRouteArgs> {
  ScheduleBookingRoute(
      {_i14.Key? key,
      required DateTime? inputTime,
      List<_i15.Appointment>? bookedDates})
      : super(ScheduleBookingRoute.name,
            path: '/schedule_booking',
            args: ScheduleBookingRouteArgs(
                key: key, inputTime: inputTime, bookedDates: bookedDates));

  static const String name = 'ScheduleBookingRoute';
}

class ScheduleBookingRouteArgs {
  const ScheduleBookingRouteArgs(
      {this.key, required this.inputTime, this.bookedDates});

  final _i14.Key? key;

  final DateTime? inputTime;

  final List<_i15.Appointment>? bookedDates;

  @override
  String toString() {
    return 'ScheduleBookingRouteArgs{key: $key, inputTime: $inputTime, bookedDates: $bookedDates}';
  }
}

/// generated route for
/// [_i12.PaymentPage]
class PaymentRoute extends _i13.PageRouteInfo<void> {
  const PaymentRoute() : super(PaymentRoute.name, path: '/payment');

  static const String name = 'PaymentRoute';
}
