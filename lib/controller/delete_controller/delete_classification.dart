import 'dart:io';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:get_storage/get_storage.dart';
import 'package:project_admin/model/classsification_model.dart';
import '../../main.dart';

class DeleteClassificationController extends GetxController {

  RxBool isLoading = false.obs;
  final box = GetStorage();
  var classifiList = <ClassificationModel>[].obs;

  Future<void> deleteClassification(int classifiId) async {
    isLoading.value = true;
    String? token = box.read('token');

    try {
      final url = '$baseUrl/api/employee/ElectronicShop/ClassificationCategory/deleteClassificationCategory/$classifiId';
      print('URL: $url');
      print('Branch ID: $classifiId');

      final response = await http.delete(
        Uri.parse(url),
        headers: {
          'Authorization': 'Bearer $token',
        },
      );

      if (response.statusCode == 200) {
        classifiList.removeWhere((Classification) => Classification.id == classifiId); // Remove the branch from the list
        Get.snackbar('Success', 'Classification deleted successfully');
      } else {
        print(response.statusCode);
        print(response.body);
        Get.snackbar('Error', 'Failed to delete Classification');
      }
    }  catch (e) {
      print(e.toString());
      Get.snackbar('Error', 'An error occurred');
    } finally {
      isLoading.value = false;
    }
  }
}
