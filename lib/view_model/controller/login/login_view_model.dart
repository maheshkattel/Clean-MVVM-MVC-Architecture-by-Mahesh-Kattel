import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:mvcmvvmstructure/model/login/user_model.dart';
import 'package:mvcmvvmstructure/repository/login_repository/login_repository.dart';
import 'package:mvcmvvmstructure/resources/routes/routes_name.dart';
import 'package:mvcmvvmstructure/view_model/controller/user_preferences/user_preferences_view_model.dart';
import '../../../utils/utils.dart';

class LoginViewModel extends GetxController {
  final _api = LoginRepository();

  UserPreferences userPreferences = UserPreferences();
  final emailController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;
  final emailFocusNode = FocusNode().obs;
  final passwordFocusNode = FocusNode().obs;
  RxBool loading = false.obs;

  void loginApi() async {
    loading.value = true;
    Map data = {
      'email': emailController.value.text,
      'password': passwordController.value.text
    };

    await _api.loginApi(data).then(
      (value) {
        loading.value = false;
        if (value['error'] == 'user not found') {
          Utils.snackBar('Error', value['error']);
        } else {
          userPreferences.saveUser(UserModel.fromJson(value)).then((value) {
            Get.toNamed(RoutesName.homeScreen);
          }).onError((error, stackTrace) {});
          Utils.snackBar('Login', 'Login Successful');
        }
      },
    ).onError((error, stackTrace) {
      if (kDebugMode) {
        print(error.toString());
      }
      loading.value = false;
      Utils.snackBar('Error', error.toString());
    });
  }
}
