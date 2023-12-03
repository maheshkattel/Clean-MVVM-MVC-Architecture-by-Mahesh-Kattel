import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:mvcmvvmstructure/view_model/controller/user_preferences/user_preferences_view_model.dart';
import '../../resources/routes/routes_name.dart';

class SplashServices {
  UserPreferences userPreferences = UserPreferences();
  void isLogin() {
    userPreferences.getUser().then((value) {
      if (kDebugMode) {
        print(value.token.toString());
      }
      if (value.token.toString() == 'null' || value.token!.isEmpty) {
        Timer(
          const Duration(seconds: 2),
          () => Get.toNamed(RoutesName.loginScreen),
        );
      } else {
        Timer(
          const Duration(seconds: 2),
          () => Get.toNamed(RoutesName.homeScreen),
        );
      }
    });
  }
}
