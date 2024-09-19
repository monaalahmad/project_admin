import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:get_storage/get_storage.dart';
import '../../../main.dart';
import '../../../model/product_model.dart';
import '../../../model/product_store.dart';

class DeleteProductStorehouseController extends GetxController {

  RxBool isLoading = false.obs;
  final box = GetStorage();
  var storeProductList = <ProductModel>[].obs;

  Future<bool> deleteProductStorehouse(ProductModel storeProduct) async {
    isLoading.value = true;
    String? token = box.read('token');

    if (token == null) {
      Get.snackbar('Error', 'Authentication token is missing');
      isLoading.value = false;
      return false;
    }

    try {
      final url = '$baseUrl/api/employee/ElectronicShop/StoreProduct/delete/${storeProduct.id}';
      final response = await http.delete(
        Uri.parse(url),
        headers: {
          'Authorization': 'Bearer $token',
          'Accept': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        storeProductList.remove(storeProduct);  // Ensure this works correctly
        return true; // Deletion was successful
      } else if (response.statusCode == 404) {
        Get.snackbar('Error', 'Product not found');
        return false;
      } else {
        Get.snackbar('Error', 'Failed to delete product. Status code: ${response.statusCode}');
        return false;
      }
    } catch (e) {
      Get.snackbar('Error', 'An error occurred: $e');
      return false;
    } finally {
      isLoading.value = false;
    }
  }
}
