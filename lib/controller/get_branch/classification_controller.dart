import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:get_storage/get_storage.dart';
import '../../main.dart';
import '../../model/classsification_model.dart';

class ClassificationController extends GetxController {

  var classificationList = <ClassificationModel>[].obs;
  var isLoading = true.obs;

  final box = GetStorage();

  @override
  void onInit() {
    super.onInit();
    getAllClassification();
  }

  Future<void> getAllClassification() async {
    try {
      isLoading(true);
      // Retrieve the token from GetStorage
      String? token = box.read('token');
      print('Token value: $token');
      if (token == null) {
        Get.snackbar('Error', 'Token is null');
        isLoading(false);
        return;
      }
      final response = await http.get(
        Uri.parse('$baseUrl/api/employee/ElectronicShop/ClassificationCategory/indexClassificationCategories'),
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
      );

      // Print the response body
      // print('Response body: ${response.body}');

      if (response.statusCode == 200) {
        var jsonData = jsonDecode(response.body);

        if (jsonData is List) {
          classificationList.value = jsonData
              .map((branch) => ClassificationModel.fromJson(branch))
              .toList();
        } else if (jsonData is Map) {
          if (jsonData.containsKey('data') && jsonData['data'] is List) {
            classificationList.value = (jsonData['data'] as List)
                .map((branch) => ClassificationModel.fromJson(branch))
                .toList();
          } else {
            Get.snackbar('Error', 'Unexpected data format');
          }
        } else {
          Get.snackbar('Error', 'Unexpected data format');
        }
      } else {
        Get.snackbar('Error', 'Status code: ${response.statusCode}');
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to fetch branches: $e');
    } finally {
      isLoading(false);
    }
  }
}
