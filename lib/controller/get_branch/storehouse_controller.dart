import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:get_storage/get_storage.dart';
import 'package:project_admin/model/storehouse_model.dart';

import '../../main.dart';

class StorehouseController extends GetxController {

  var storehouseList = <StorehouseModel>[].obs;
  var isLoading = true.obs;

  final box = GetStorage();

  @override
  void onInit() {
    super.onInit();
    getAllStorehouse();
  }

  Future<void> getAllStorehouse() async {
    try {
      isLoading(true);
      // Retrieve the token from GetStorage
      String? token = box.read('token');
      print('Token value: $token');
      if (token == null) {
        Get.snackbar('Error', 'Token is null');
        isLoading(false);
        return;
      }
      final response = await http.get(
        Uri.parse('$baseUrl/api/employee/ElectronicShop/Storehouse/index'),
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
      );

      // Print the response body
      print('Response body: ${response.body}');

      if (response.statusCode == 200) {
        var jsonData = jsonDecode(response.body);

        if (jsonData is List) {
          storehouseList.value =
              jsonData.map((storehouse) => StorehouseModel.fromJson(storehouse)).toList();
        } else if (jsonData is Map) {
          if (jsonData.containsKey('data') && jsonData['data'] is List) {
            storehouseList.value = (jsonData['data'] as List)
                .map((storehouse) => StorehouseModel.fromJson(storehouse))
                .toList();
          } else {
            Get.snackbar('Error', 'Unexpected data format');
          }
        } else {
          Get.snackbar('Error', 'Unexpected data format');
        }
      } else {
        Get.snackbar('Error', 'Status code: ${response.statusCode}');
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to fetch storehouse: $e');
    } finally {
      isLoading(false);
    }
  }
}
