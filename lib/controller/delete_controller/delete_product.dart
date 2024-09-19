import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:get_storage/get_storage.dart';
import '../../main.dart';
import '../../model/product_model.dart';

class DeleteProductController extends GetxController {

  RxBool isLoading = false.obs;
  final box = GetStorage();
  var productList = <ProductModel>[].obs;

  Future<void> deleteProduct(int productId) async {
    isLoading.value = true;
    String? token = box.read('token');

    try {
      final url = '$baseUrl/api/employee/ElectronicShop/Product/deleteProduct/$productId';
      print('URL: $url');
      print('Product ID: $productId');

      final response = await http.delete(
        Uri.parse(url),
        headers: {
          'Authorization': 'Bearer $token',
        },
      );

      if (response.statusCode == 200) {
        productList.removeWhere((product) => product.id == productId); // Remove the branch from the list
        Get.snackbar('Success', 'product deleted successfully');
      } else {
        print(response.statusCode);
        print(response.body);
        Get.snackbar('Error', 'Failed to delete product');
      }
    }  catch (e) {
      print(e.toString());
      Get.snackbar('Error', 'An error occurred');
    } finally {
      isLoading.value = false;
    }
  }
}
