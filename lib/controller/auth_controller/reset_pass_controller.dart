import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';

import '../../main.dart';


class ResetPassController extends GetxController{

  final emailController = TextEditingController().obs;
  final passController = TextEditingController().obs;
  final passConfController = TextEditingController().obs;

  RxBool loading = false.obs;

  void ResetPasstCode() async{

    String? userEmail = Get.arguments?['email'];
    print(userEmail);

    loading.value = true;
    try{
      final response = await post(Uri.parse('$baseUrl/api/Authentication/Employee/resetPassword'),
          body: {
            'email' : userEmail,
            'password' : passController.value.text,
            'password_confirmation' : passConfController.value.text,
          }
      );
      var data = jsonDecode(response.body);

      print(response.statusCode);
      print(data);
      print(userEmail);

      if(response.statusCode == 200){
        loading.value = false;
        Get.snackbar('Reset Successful', data['message']);
        Get.toNamed('/Login');
      }else if(response.statusCode == 401) {
        loading.value = false;
        Get.snackbar('Reset Failed', data['message']);
      }else if(response.statusCode == 422) {
        loading.value = false;
        Get.snackbar('Reset Failed', data['message']);
      } else {
        loading.value = false;
        Get.snackbar('Reset Failed', data['error']);
      }
    }catch(e){
      loading.value = false;
      print( 'Exception ' + e.toString());
      Get.snackbar('Exception', e.toString());
    }
  }
}