import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:get_storage/get_storage.dart';
import 'package:project_admin/model/storehouse_model.dart';
import '../../main.dart';

class DeleteStorehouseController extends GetxController {

  RxBool isLoading = false.obs;
  final box = GetStorage();
  var storehouseList = <StorehouseModel>[].obs;

  Future<void> deleteStorehouse(int storehouseId) async {
    isLoading.value = true;
    String? token = box.read('token');

    try {
      final url = '$baseUrl/api/employee/ElectronicShop/Storehouse/delete/$storehouseId';
      print('URL: $url');
      print('Branch ID: $storehouseId');

      final response = await http.delete(
        Uri.parse(url),
        headers: {
          'Authorization': 'Bearer $token',
        },
      );

      if (response.statusCode == 200) {
        storehouseList.removeWhere((storehouse) => storehouse.id == storehouseId); // Remove the branch from the list
        Get.snackbar('Success', 'Storehouse deleted successfully');
      } else {
        print(response.statusCode);
        print(response.body);
        Get.snackbar('Error', 'Failed to delete storehouse');
      }
    }  catch (e) {
      print(e.toString());
      Get.snackbar('Error', 'An error occurred');
    } finally {
      isLoading.value = false;
    }
  }
}
