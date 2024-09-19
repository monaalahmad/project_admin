import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:get_storage/get_storage.dart';
import 'package:project_admin/model/product_store.dart';
import '../../../main.dart';
import '../../../model/product_model.dart';

class ProductsStorehouseArrayController extends GetxController {
  var productList = <ProductModel>[].obs;
  var isLoading = true.obs;

  final box = GetStorage();

  @override
  void onInit() {
    super.onInit();
    getAllProductStorehouseArray();
  }

  Future<void> getAllProductStorehouseArray() async {
    try {
      isLoading(true);
      String? token = box.read('token');
      print('Token value: $token');
      if (token == null) {
        Get.snackbar('Error', 'Token is null');
        return;
      }

      final response = await http.get(
        Uri.parse('$baseUrl/api/employee/ElectronicShop/StoreProduct/index'),
        headers: {
          'Authorization': 'Bearer $token',
        },
      );

      print('Response Status Code: ${response.statusCode}');
      print('Response Body: ${response.body}');

      if (response.statusCode == 200) {
        var jsonData = jsonDecode(response.body);

        if (jsonData['success'] == true && jsonData.containsKey('data')) {
          productList.value = (jsonData['data'] as List)
              .map((item) => ProductModel.fromJson(item))
              .toList();
        } else {
          Get.snackbar('Error', 'Unexpected data format');
        }
      } else {
        Get.snackbar('Error', 'Status code: ${response.statusCode}');
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to fetch products: $e');
    } finally {
      isLoading(false);  // Set loading to false after completion
    }
  }
}
