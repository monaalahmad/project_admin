import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:get_storage/get_storage.dart';
import '../../../model/product_model.dart';

class AddProductsStoreController extends GetxController {
  RxBool loading = false.obs;
  final box = GetStorage();

  // Set to store already sent product IDs
  final Set<int> sentProductIds = <int>{};

  Future<void> addProductStore(List<ProductModel> selectedProducts) async {
    loading.value = true;
    String? token = box.read('token');

    if (token == null) {
      Get.snackbar('Error', 'Token is null');
      loading.value = false;
      return;
    }

    var client = http.Client();
    var request = http.MultipartRequest(
      'POST',
      Uri.parse('http://10.0.2.2:8000/api/employee/ElectronicShop/StoreProduct/add'),
    );

    request.headers['Authorization'] = 'Bearer $token';
    request.headers['Accept'] = 'application/json';

    // إنشاء قائمة فريدة من المنتجات لتجنب التكرار
    List<ProductModel> uniqueProducts = selectedProducts
        .where((product) => !sentProductIds.contains(product.id))
        .toList();


    // إضافة المنتجات إلى الحقول في الطلب
    for (int i = 0; i < uniqueProducts.length; i++) {
      request.fields['product_id[$i]'] = uniqueProducts[i].id.toString();
      sentProductIds.add(uniqueProducts[i].id);
    }
    // Get.snackbar('Success', 'Products added successfully');

    try {
      var streamedResponse = await client.send(request);
      var response = await http.Response.fromStream(streamedResponse);

      print(response.statusCode);

      if (response.statusCode == 200 || response.statusCode == 201) {
        var responseData = jsonDecode(response.body);
        Get.back();
        Get.snackbar('Success', 'Products added successfully');
        print(responseData['data']);
      } else {
        print('Status Code: ${response.statusCode}');
        print('Response Body: ${response.body}');
        Get.snackbar('Error', 'Failed to add products');
      }
    } catch (e) {
      print('Exception: $e');
      Get.snackbar('Error', 'Failed to send request');
    } finally {
      loading.value = false;
      client.close();  // إغلاق العميل
    }
  }
}
