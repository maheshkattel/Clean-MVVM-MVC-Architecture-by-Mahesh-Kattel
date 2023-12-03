import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mvcmvvmstructure/resources/components/rounded_button.dart';
import 'package:mvcmvvmstructure/view/login/widgets/input_email_widgets.dart';
import 'package:mvcmvvmstructure/view/login/widgets/input_password_widget.dart';
import 'package:mvcmvvmstructure/view/login/widgets/login_button_widget.dart';
import 'package:mvcmvvmstructure/view_model/controller/login/login_view_model.dart';

import '../../utils/utils.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final loginVM = Get.put(LoginViewModel());
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('login'.tr),
          centerTitle: true,
          automaticallyImplyLeading: false),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    InputEmailWidget(),
                    const SizedBox(height: 10),
                    InputPasswordWidget()
                  ],
                ),
              ),
              const SizedBox(height: 20),
              LoginButton(formKey: _formKey)
            ],
          ),
        ),
      ),
    );
  }
}
