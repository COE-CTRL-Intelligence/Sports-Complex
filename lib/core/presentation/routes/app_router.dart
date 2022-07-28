import 'package:auto_route/annotations.dart';
import 'package:sports_complex/splash/presentation/splash_page.dart';

@MaterialAutoRouter(
  routes: [
    MaterialRoute(page: SplashPage, initial: true),
    //All other pages go here in this format
  ],
  replaceInRouteName: "Page,Route",
)
class $AppRouter {}
