import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../main.dart';

class SignUpController extends GetxController {
  final firstNameController = TextEditingController().obs;
  final emailController = TextEditingController().obs;
  final phoneController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;
  final branchController = ValueNotifier<String>('');
  final selectedOption = ValueNotifier<String>('');

  RxBool loading = false.obs;

  void signUpApi() async {
    loading.value = true;
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/api/Authentication/Employee/register'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
        body: jsonEncode({
          'name': firstNameController.value.text,
          'role': selectedOption.value,
          'email': emailController.value.text,
          'password': phoneController.value.text,
          'password_confirmation': passwordController.value.text,
          'responsible_id': int.tryParse(branchController.value), // Ensure this is an integer
        }),
      );

      print(response.statusCode);
      print(response.body);

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        loading.value = false;
        Get.snackbar('SignUp Successful', data['message']);
        Get.toNamed('/AddPage');
      } else {
        var data = jsonDecode(response.body);
        print(response.statusCode);
        loading.value = false;
        Get.snackbar('SignUp Failed', data['message'] ?? data['error']);
      }
    } catch (e) {
      loading.value = false;
      print(',,,,,,,,,,,,,,,,,,,,,,,,');
      print('Exception ' + e.toString());
      Get.snackbar('Exception', e.toString());
    }
  }
}
