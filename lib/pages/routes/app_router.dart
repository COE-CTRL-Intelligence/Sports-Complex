import 'package:auto_route/annotations.dart';
import 'package:sports_complex/pages/about_page.dart';
import 'package:sports_complex/pages/booking_page.dart';
import 'package:sports_complex/pages/check_booking_page.dart';
import 'package:sports_complex/pages/contact_us_page.dart';
import 'package:sports_complex/pages/gym_login_page.dart';
import 'package:sports_complex/pages/gym_signup_page.dart';
import 'package:sports_complex/pages/home_page.dart';
import 'package:sports_complex/pages/splash_page.dart';

@MaterialAutoRouter(
  routes: [
    MaterialRoute(page: SplashPage, initial: true),
    MaterialRoute(page: HomePage, path: "/home"),
    MaterialRoute(page: BookingPage, path: "/booking"),
    MaterialRoute(page: CheckBookingPage, path: "/check_booking"),
    MaterialRoute(page: GymLoginPage, path: "/gym_login"),
    MaterialRoute(page: GymSignUpPage, path: "/gym_signup"),
    MaterialRoute(page: AboutPage, path: "/About"),
    MaterialRoute(page: ContactUsPage, path: "/Contact")
    //All other pages go here in this format
  ],
  replaceInRouteName: "Page,Route",
)
class $AppRouter {}
