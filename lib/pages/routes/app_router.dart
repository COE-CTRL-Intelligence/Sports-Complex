import 'package:auto_route/annotations.dart';
import 'package:sports_complex/pages/booking_page_basketball.dart';
import 'package:sports_complex/pages/booking_page_soccer.dart';
import 'package:sports_complex/pages/booking_page_tennis.dart';
import 'package:sports_complex/pages/check_booking_page.dart';
import 'package:sports_complex/pages/gym_login_page.dart';
import 'package:sports_complex/pages/home_page.dart';
import 'package:sports_complex/pages/splash_page.dart';

@MaterialAutoRouter(
  routes: [
    MaterialRoute(page: SplashPage, initial: true),
    MaterialRoute(page: HomePage, path: "/home"),
    MaterialRoute(page: BasketballBookingPage, path: "/basketball_booking"),
    MaterialRoute(page: CheckBookingPage, path: "/check_booking_basketball"),
    MaterialRoute(page: GymLoginPage, path: "/gym"),
    MaterialRoute(page: TennisBookingPage, path: "/tennis_booking"),
    MaterialRoute(page: SoccerBookingPage, path: "/soccer_booking")
    //All other pages go here in this format
  ],
  replaceInRouteName: "Page,Route",
)
class $AppRouter {}


// Terminal command to register page
// Copy and paste the code below in terminal
// flutter pub run build_runner build --delete-conflicting-outputs