import 'package:auto_route/annotations.dart';
import 'package:sports_complex/pages/about_page.dart';
import 'package:sports_complex/pages/booking_page.dart';
import 'package:sports_complex/pages/check_booking_page.dart';
import 'package:sports_complex/pages/contact_us_page.dart';
import 'package:sports_complex/pages/gym_dashboard_page.dart';
import 'package:sports_complex/pages/gym_login_page.dart';
import 'package:sports_complex/pages/gym_signup_page.dart';
import 'package:sports_complex/pages/home_page.dart';
import 'package:sports_complex/pages/schedule_booking_page.dart';
import 'package:sports_complex/pages/select_sport_page.dart';
import 'package:sports_complex/pages/splash_page.dart';

@MaterialAutoRouter(
  routes: [
    //All other pages go here in this format

    MaterialRoute(page: SplashPage, initial: true),
    // CustomRoute(page: HomePage, path: "/home", durationInMilliseconds: 1500),
    MaterialRoute(page: HomePage, path: "/home"),
    MaterialRoute(page: BookingPage, path: "/booking"),
    MaterialRoute(page: CheckBookingPage, path: "/check_booking"),
    MaterialRoute(page: GymLoginPage, path: "/gym_login"),
    MaterialRoute(page: GymSignUpPage, path: "/gym_signup"),
    MaterialRoute(page: AboutPage, path: "/About"),
    MaterialRoute(page: ContactUsPage, path: "/Contact"),
    MaterialRoute(page: SelectSportPage, path: "/select_sport_page"),
    MaterialRoute(page: GymDashboardPage, path: "/gym_dashboard"),
    MaterialRoute(page: ScheduleTimingPage, path: "/schedule_timing"),
  ],
  replaceInRouteName: "Page,Route",
)
class $AppRouter {}


// Terminal command to register page
// Copy and paste the code below in terminal
// flutter pub run build_runner build --delete-conflicting-outputs