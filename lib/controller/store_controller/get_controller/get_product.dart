import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:get_storage/get_storage.dart';
import 'package:project_admin/model/product_model.dart';
import '../../../main.dart';

class ProductsStoreController extends GetxController {

  var productList = <ProductModel>[].obs;
  var isLoading = true.obs;

  final box = GetStorage();

  @override
  void onInit() {
    super.onInit();
  }

  Future<void> getAllProductStore(int productId) async {
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
        Uri.parse('$baseUrl/api/employee/ElectronicShop/StoreProduct/indexProductsForProductClassification/$productId'),
        headers: {
          'Authorization': 'Bearer $token',
        },
      );

      if (response.statusCode == 200) {
        var jsonData = jsonDecode(response.body);

        if (jsonData is List) {
          productList.value = jsonData.map((product) => ProductModel.fromJson(product)).toList();
        } else if (jsonData is Map) {
          if (jsonData.containsKey('data') && jsonData['data'] is List) {
            productList.value = (jsonData['data'] as List)
                .map((product) => ProductModel.fromJson(product))
                .toList();
          } else {
            Get.snackbar('Error', 'Unexpected data format');
          }
        } else {
          Get.snackbar('Error', 'Unexpected data format');
        }
      } else if (response.statusCode == 403) {
        // Get.snackbar('Error', 'Status code: ${response.statusCode}');
        print(response.statusCode);
      } else {
        print(response.statusCode);
        // Get.snackbar('Error', 'Status code: ${response.statusCode}');
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to fetch Product: $e');
    } finally {
      isLoading(false);
    }
  }
}
