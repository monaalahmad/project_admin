import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:get_storage/get_storage.dart';
import '../../../main.dart';
import '../../../model/product_model.dart';

class ProductQuantityAllStoreController extends GetxController {
  var productQuantityAllList = <ProductModel>[].obs;
  var isLoading = true.obs;

  final box = GetStorage();

  @override
  void onInit() {
    super.onInit();
  }

  Future<void> getAllProductQuantityAllStore(int id) async {
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
        Uri.parse('$baseUrl/api/employee/ElectronicShop/StoreProduct/show/$id'),
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        var jsonData = jsonDecode(response.body);

        // تحقق من نوع البيانات المستلمة
        if (jsonData is Map) {
          if (jsonData.containsKey('data') && jsonData['data'] is Map) {
            // في حالة أن "data" تحتوي على منتج واحد فقط
            productQuantityAllList.value = [
              ProductModel.fromJson(jsonData['data'])
            ];
          } else if (jsonData.containsKey('data') && jsonData['data'] is List) {
            // في حالة أن "data" تحتوي على قائمة من المنتجات
            productQuantityAllList.value = (jsonData['data'] as List)
                .map((product) => ProductModel.fromJson(product))
                .toList();
          } else {
            print(response.body);
            Get.snackbar('Error', 'Unexpected data format');
          }
        } else {
          Get.snackbar('Error', 'Unexpected data format');
        }
      } else {
        Get.snackbar('Error', 'Status code: ${response.statusCode}');
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to fetch product quantities: $e');
      print('Error $e');
    } finally {
      isLoading(false);
    }
  }
}
