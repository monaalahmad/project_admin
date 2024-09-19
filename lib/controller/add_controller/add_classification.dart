import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:get_storage/get_storage.dart';
import '../../main.dart';

class AddClassificationController extends GetxController {

  final nameController = TextEditingController().obs;
  final follow_toController = TextEditingController().obs;
  RxBool loading = false.obs;

  final box = GetStorage();

  Future<void> addClassification() async {
    loading.value = true;
    String? token = box.read('token');

    if (token == null) {
      Get.snackbar('Error', 'Token is null');
      loading.value = false;
      return;
    }
    var request = http.MultipartRequest(
      'POST',
      Uri.parse('$baseUrl/api/employee/ElectronicShop/ClassificationCategory/addClassificationCategory'),
    );

    request.headers['Authorization'] = 'Bearer $token';
    String languageCode = Get.locale?.languageCode ?? 'en';
    request.headers['lang'] = languageCode;

    request.fields['name'] = nameController.value.text;
    request.fields['follow_to'] = follow_toController.value.text;

    try {
      var response = await request.send();
      var responseBody = await http.Response.fromStream(response);

      print(response.statusCode);

      if (response.statusCode == 200 || response.statusCode == 201) {
        Get.snackbar('Success', 'Classification added successfully');
      } else {
        print('Status Code: ${response.statusCode}');
        print('Response Body: ${responseBody.body}');
        Get.snackbar('Error', 'Failed to add classification');
      }
    } catch (e) {
      print('Exception: $e');
      Get.snackbar('Error', 'Failed to send request');
    } finally {
      loading.value = false;
    }
  }

}
