import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class LoginController extends GetxController {
  final emailController = TextEditingController().obs;
  final passController = TextEditingController().obs;
  RxBool loading = false.obs;

  loginApi() async {
    loading.value = true;
    try {
      var client = http.Client();
      var url = "https://reqres.in/api/login";
      var uri = Uri.parse(url);
      final response = await client.post(uri, body: {
        "email": emailController.value.text,
        "password": passController.value.text,
      });
      var data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        loading.value = false;
        Get.snackbar("login successful", "congrats");
      } else {
        loading.value = false;

        Get.snackbar("login failed", data["error"]);
      }
    } catch (e) {
      loading.value = false;

      Get.snackbar("Exception", e.toString());
      print(e);
    }
  }
}
