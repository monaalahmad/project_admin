import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../main.dart';
import '../../model/classsification_model.dart';

class UpdateProductController extends GetxController {

  final nameController = TextEditingController().obs;
  final imageController = TextEditingController().obs;
  final priceController = TextEditingController().obs;
  final classificationId = TextEditingController().obs;

  RxBool loading = false.obs;
  final box = GetStorage();

  @override
  void onInit() {
    super.onInit();
  }
  Future<void> updateProduct(int productId, File image) async {
    loading.value = true;
    String? token = box.read('token');

    if (token == null) {
      Get.snackbar('Error', 'Token is null');
      loading.value = false;
      return;
    }
    var request = http.MultipartRequest(
      'POST',
      Uri.parse('$baseUrl/api/employee/ElectronicShop/Product/updateProduct/$productId'),
    );

    request.headers['Authorization'] = 'Bearer $token';
    request.fields['name'] = nameController.value.text;
    request.fields['description'] = priceController.value.text;
    request.fields['product_classification_id'] = classificationId.value.text;
    request.files.add(await http.MultipartFile.fromPath('image', image.path));

    try {
      var response = await request.send();
      var responseBody = await http.Response.fromStream(response);

      if (response.statusCode == 200 || response.statusCode == 201) {
        Get.snackbar('Success', 'Product updated successfully');
      } else {
        print('Status Code: ${response.statusCode}');
        print('Response Body: ${responseBody.body}');
        Get.snackbar('Error', 'Failed to update Product');
      }
    } catch (e) {
      print('Exception: $e');
      Get.snackbar('Error', 'Failed to send request');
    } finally {
      loading.value = false;
    }
  }
}
