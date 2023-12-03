import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../resources/components/rounded_button.dart';
import '../../../view_model/controller/login/login_view_model.dart';

class LoginButton extends StatelessWidget {
  LoginButton({super.key, required this.formKey});
  final formKey;
  final loginVM = Get.put(LoginViewModel());
  @override
  Widget build(BuildContext context) {
    return Obx(() => RoundedButton(
          loading: loginVM.loading.value,
          title: 'login'.tr,
          width: double.infinity,
          onPress: () {
            if (formKey.currentState!.validate()) {
              loginVM.loginApi();
            }
          },
        ));
  }
}
