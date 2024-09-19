import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';

import '../../main.dart';

class forgetPassController extends GetxController{

  final emailController = TextEditingController().obs;
  final codeController = TextEditingController().obs;

  RxBool loading = false.obs;

  void forgetPassApi() async{

    loading.value = true;
    try{
      final response = await post(Uri.parse('$baseUrl/api/Authentication/Verification/email'),
          body: {
            'email' : emailController.value.text,
          }
      );
      var data = jsonDecode(response.body);

      print(response.statusCode);
      print(data);

      if(response.statusCode == 200){
        loading.value = false;
        Get.toNamed('/ForgotCode', arguments: {'email': emailController.value.text});
      }else if(response.statusCode == 401) {
        loading.value = false;
        Get.snackbar('SignUp Failed', data['message']);
      }else {
          loading.value = false;
          Get.snackbar('SignUp Failed', data['error']);
      }
    }catch(e){
      loading.value = false;
      print( 'Exception ' + e.toString());
      Get.snackbar('Exception', e.toString());
    }
  }
}