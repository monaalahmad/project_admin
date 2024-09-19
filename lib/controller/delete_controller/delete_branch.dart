import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:get_storage/get_storage.dart';
import '../../main.dart';
import '../../model/branch_model.dart';

class DeleteController extends GetxController {

  RxBool isLoading = false.obs;
  final box = GetStorage();
  var branchList = <BranchModel>[].obs;

  Future<void> deleteBranch(int branchId) async {
    isLoading.value = true;
    String? token = box.read('token');

    try {
      final url = '$baseUrl/api/employee/ElectronicShop/Store/deleteStore/$branchId';
      print('URL: $url');
      print('Branch ID: $branchId');

      final response = await http.delete(
        Uri.parse(url),
        headers: {
          'Authorization': 'Bearer $token',
        },
      );

      if (response.statusCode == 200) {
        branchList.removeWhere((branch) => branch.id == branchId); // Remove the branch from the list
        Get.snackbar('Success', 'Branch deleted successfully');
      } else {
        print(response.statusCode);
        print(response.body);
        Get.snackbar('Error', 'Failed to delete branch');
      }
    }  catch (e) {
      print(e.toString());
      Get.snackbar('Error', 'An error occurred');
    } finally {
      isLoading.value = false;
    }
  }
}
