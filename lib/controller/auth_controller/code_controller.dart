import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';

import '../../main.dart';


class CodeController extends GetxController{

  final emailController = TextEditingController().obs;
  final codeController = TextEditingController().obs;

  RxBool loading = false.obs;

  void ForgetCode() async{

    String? userEmail = Get.arguments?['email'];
    print(userEmail);

    loading.value = true;
    try{
      final response = await post(Uri.parse('$baseUrl/api/Authentication/Verification/code'),
          body: {
            'email' : userEmail,
            'code' : codeController.value.text,
          }
      );
      var data = jsonDecode(response.body);

      print(response.statusCode);
      print(data);
      print(userEmail);

      if(response.statusCode == 200){
        loading.value = false;
        Get.snackbar('verification Successful', data['message']);
        Get.toNamed('/ResetPass', arguments: {'email': userEmail});
      }else if(response.statusCode == 401) {
        loading.value = false;
        Get.snackbar('verification Failed', data['message']);
      }else if(response.statusCode == 422) {
        loading.value = false;
        Get.snackbar('verification Failed', data['message']);
      } else {
        loading.value = false;
        Get.snackbar('verification Failed', data['error']);
      }
    }catch(e){
      loading.value = false;
      print( 'Exception ' + e.toString());
      Get.snackbar('Exception', e.toString());
    }
  }
}