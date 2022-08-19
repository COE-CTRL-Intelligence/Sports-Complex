import 'package:auto_route/annotations.dart';
import 'package:sports_complex/pages/booking_page.dart';
import 'package:sports_complex/pages/check_booking_page.dart';
import 'package:sports_complex/pages/gym_login_page.dart';
import 'package:sports_complex/pages/home_page.dart';
import 'package:sports_complex/pages/splash_page.dart';

@MaterialAutoRouter(
  routes: [
    MaterialRoute(page: SplashPage, initial: true),
    MaterialRoute(page: HomePage, path: "/home"),
    MaterialRoute(page: BookingPage, path: "/booking"),
    MaterialRoute(page: CheckBookingPage, path: "/check_booking"),
    MaterialRoute(page: GymLoginPage, path: "/gym")
    //All other pages go here in this format
  ],
  replaceInRouteName: "Page,Route",
)
class $AppRouter {}
