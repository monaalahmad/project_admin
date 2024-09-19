import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:get_storage/get_storage.dart';
import 'package:project_admin/model/category_model.dart';
import '../../main.dart';

class DeleteCategoryController extends GetxController {

  RxBool isLoading = false.obs;
  final box = GetStorage();
  var categoryList = <CategoryModel>[].obs;

  Future<void> deleteCategory(int categoryId) async {
    isLoading.value = true;
    String? token = box.read('token');

    try {
      final url = '$baseUrl/api/employee/ElectronicShop/ProductClassification/deleteProductClassification/$categoryId';
      print('URL: $url');
      print('Category ID: $categoryId');

      final response = await http.delete(
        Uri.parse(url),
        headers: {
          'Authorization': 'Bearer $token',
        },
      );

      if (response.statusCode == 200) {
        categoryList.removeWhere((category) => category.id == categoryId); // Remove the branch from the list
        Get.snackbar('Success', 'Category deleted successfully');
      } else {
        print(response.statusCode);
        print(response.body);
        Get.snackbar('Error', 'Failed to delete Category');
      }
    }  catch (e) {
      print(e.toString());
      Get.snackbar('Error', 'An error occurred');
    } finally {
      isLoading.value = false;
    }
  }
}
