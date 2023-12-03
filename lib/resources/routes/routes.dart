import 'package:get/get.dart';
import 'package:mvcmvvmstructure/resources/routes/routes_name.dart';
import 'package:mvcmvvmstructure/view/home/home_screen.dart';
import 'package:mvcmvvmstructure/view/login/login_screen.dart';
import 'package:mvcmvvmstructure/view/splash_screen.dart';

class AppRoutes {
  static appRoutes() => [
        GetPage(
            name: RoutesName.splashScreen,
            page: () => SplashScreen(),
            transition: Transition.downToUp,
            transitionDuration: const Duration(seconds: 3)),
        GetPage(
            name: RoutesName.loginScreen,
            page: () => LoginScreen(),
            transition: Transition.downToUp,
            transitionDuration: const Duration(seconds: 3)),
        GetPage(
            name: RoutesName.homeScreen,
            page: () => HomeScreen(),
            transition: Transition.downToUp,
            transitionDuration: const Duration(seconds: 3)),
      ];
}
