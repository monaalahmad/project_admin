import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:get_storage/get_storage.dart';
import '../../main.dart';
import '../../model/product_model.dart';

class ProductController extends GetxController {
  var productList = <ProductModel>[].obs;
  var isLoading = true.obs;

  final box = GetStorage();

  @override
  void onInit() {
    super.onInit();
    getAllProduct();
  }

  Future<void> getAllProduct() async {
    try {
      isLoading(true);
      String? token = box.read('token');
      print('Token value: $token');
      if (token == null) {
        Get.snackbar('Error', 'Token is null');
        isLoading(false);
        return;
      }
      final response = await http.get(
        Uri.parse('$baseUrl/api/employee/ElectronicShop/Product/indexProducts'),
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
      );

      // Print the response body
      if (response.statusCode == 200 || response.statusCode == 201) {
        var jsonData = jsonDecode(response.body);

        // Print the jsonData to debug
        print('jsonData: $jsonData');
        print(response.statusCode);

        if (jsonData is List) {
          productList.value = jsonData.map((product) => ProductModel.fromJson(product)).toList();
        } else if (jsonData is Map) {
          if (jsonData.containsKey('data') && jsonData['data'] is List) {
            productList.value = (jsonData['data'] as List).map((product) => ProductModel.fromJson(product)).toList();
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
      print(e.toString());
      Get.snackbar('Error', '${e.toString()}');
    } finally {
      isLoading(false);
    }
  }
}
