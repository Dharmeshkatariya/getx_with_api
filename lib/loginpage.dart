import 'package:flutter/material.dart';
import 'package:fluttergetx/common.dart';
import 'package:fluttergetx/controller/logincontroller.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);
  final _loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Obx(
      () => SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Common.textFiled(
                  text: "Email",
                  icon: const Icon(Icons.email),
                  controller: _loginController.emailController.value),
              const SizedBox(
                height: 20,
              ),
              Common.textFiled(
                  text: "password",
                  icon: const Icon(Icons.lock),
                  controller: _loginController.passController.value),
              _loginController.loading.value
                  ? const CircularProgressIndicator()
                  : Common.container(
                      text: "login",
                      color: Colors.red,


                      onTap: () {
                        _loginController.loginApi();
                      }),
            ],
          ),
        ),
      ),
    ));
  }
}
