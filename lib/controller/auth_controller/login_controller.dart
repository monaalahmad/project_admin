import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:get_storage/get_storage.dart';

import '../../main.dart';
import '../../model/login_model.dart';

class LoginController extends GetxController {
  final emailController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;

  RxBool loading = false.obs;

  void loginApi() async {
    loading.value = true;
    final box = GetStorage();
    try {
      final response = await post(
          Uri.parse('$baseUrl/api/Authentication/Employee/login'),
          body: {
            'email': emailController.value.text,
            'password': passwordController.value.text,
          });
      var data = jsonDecode(response.body);

      print(response.statusCode);
      print(data);

      if (response.statusCode == 200) {
        if (data['message'] != null) {
          LoginModel loginData = LoginModel.fromJson(data);
          await box.write('token', loginData.token);

          // Check the role and navigate to the corresponding page
          String role = loginData.role; // assuming loginData has a role field
          if (role == 'admin') {
            Get.toNamed('/HomePage');
          } else if (role == 'store') {
            Get.toNamed('/HomePageStore');
          } else if (role == 'storehouse') {
            Get.toNamed('/HomePageStorehouse');
          } else {
            Get.snackbar('Login Successful', 'Unknown role.');
          }

          loading.value = false;
        } else {
          loading.value = false;
          Get.snackbar('Login Successful', 'No message received.');
        }
      } else if (response.statusCode == 401) {
        loading.value = false;
        if (data['message'] != null) {
          Get.snackbar('Login Failed', data['message']);
        } else {
          Get.snackbar('Login Failed', 'An error occurred.');
        }
      } else {
        loading.value = false;
        if (data['error'] != null) {
          Get.snackbar('Login Failed', data['error']);
        } else {
          Get.snackbar('Login Failed', 'An unknown error occurred.');
        }
      }
    } catch (e) {
      loading.value = false;
      print(e.toString());
      Get.snackbar('Exception', e.toString());
    }
  }
}
