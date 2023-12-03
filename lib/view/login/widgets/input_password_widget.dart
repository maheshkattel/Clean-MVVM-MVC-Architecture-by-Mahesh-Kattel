import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../utils/utils.dart';
import '../../../view_model/controller/login/login_view_model.dart';

class InputPasswordWidget extends StatelessWidget {
  InputPasswordWidget({super.key});
  final loginVM = Get.put(LoginViewModel());
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: true,
      controller: loginVM.passwordController.value,
      focusNode: loginVM.passwordFocusNode.value,
      validator: (value) {
        if (value!.isEmpty) {
          Utils.snackBar('Please Fill all Fields', 'Enter Password');
        }
      },
      onFieldSubmitted: (value) {},
      decoration: InputDecoration(
          hintText: 'password_hint'.tr, border: const OutlineInputBorder()),
    );
  }
}
