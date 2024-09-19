import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:get_storage/get_storage.dart';

import '../../../main.dart';
import '../../../model/product_quantity_model.dart';

class ProductQuantityStoreController extends GetxController {
  var productQuantityList = <ProductQuantityModel>[].obs;
  var isLoading = true.obs;

  final box = GetStorage();

  @override
  void onInit() {
    super.onInit();
  }

  Future<void> getAllProductQuantity(int id) async {
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
        Uri.parse('$baseUrl/api/employee/ElectronicShop/StoreProduct/showQuantitiesReceived/$id'),
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
          productQuantityList.value =
              jsonData.map((branch) => ProductQuantityModel.fromJson(branch)).toList();
        } else if (jsonData is Map) {
          if (jsonData.containsKey('data') && jsonData['data'] is List) {
            productQuantityList.value = (jsonData['data'] as List)
                .map((branch) => ProductQuantityModel.fromJson(branch))
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
      Get.snackbar('Error', 'Failed to fetch Quantity: $e');
    } finally {
      isLoading(false);
    }
  }
}
