import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:get_storage/get_storage.dart';
import '../../../main.dart';
import '../../../model/model_for_delete.dart';

class DeleteProductStoreController extends GetxController {
  RxBool isLoading = false.obs;
  final box = GetStorage();
  var storeProductList = <StoreProductModelForDelete>[].obs;

  Future<bool> deleteProductStore(int product) async {
    isLoading.value = true;
    String? token = box.read('token');

    if (token == null) {
      Get.snackbar('Error', 'Authentication token is missing');
      isLoading.value = false;
      return false;
    }

    try {
      final url = '$baseUrl/api/employee/ElectronicShop/StoreProduct/delete/${product}'; // Update the URL structure
      final response = await http.delete(
        Uri.parse(url),
        headers: {
          'Authorization': 'Bearer $token',
          'Accept': 'application/json',
        },
      );

      print('Status Code: ${response.statusCode}');
      print('Response Body: ${response.body}');

      print(product);

      if (response.statusCode == 200) {
        storeProductList.removeWhere((p) => p.id == product); // Update the condition to compare IDs
        return true;
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
