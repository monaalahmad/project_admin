// import 'package:flutter/cupertino.dart';
// import 'package:get/get.dart';
// import 'package:http/http.dart' as http;
// import 'package:get_storage/get_storage.dart';
//
// import '../../../main.dart';
//
// class AddQuantityProductStoreController extends GetxController {
//   final TextEditingController quantityController = TextEditingController();
//   final TextEditingController endDateController = TextEditingController();
//
//   RxBool loading = false.obs;
//   final box = GetStorage();
//
//   final int productId;
//
//   AddQuantityProductStoreController(this.productId);
//
//   Future<void> addQuantityProductStore() async {
//     loading.value = true;
//     String? token = box.read('token');
//
//     if (token == null) {
//       Get.snackbar('Error', 'Token is null');
//       loading.value = false;
//       return;
//     }
//
//     var request = http.MultipartRequest(
//       'POST',
//       Uri.parse('$baseUrl/api/employee/ElectronicShop/StoreProduct/receive'),
//     );
//
//     request.headers['Authorization'] = 'Bearer $token';
//     String languageCode = Get.locale?.languageCode ?? 'en';
//     request.headers['lang'] = languageCode;
//
//     request.fields['product_id'] = productId.toString();
//     request.fields['quantity_received'] = quantityController.text.trim(); // الكمية التي يدخلها المستخدم
//     request.fields['expiration_date'] = endDateController.text.trim(); // التاريخ الذي يحدده المستخدم
//
//     print('Request Fields: ${request.fields}');
//
//     try {
//       var response = await request.send();
//
//       final resp = await http.Response.fromStream(response);
//
//       print('Status Code: ${resp.statusCode}');
//       print('Response Body: ${resp.body}');
//
//       if (resp.statusCode == 200 || resp.statusCode == 201) {
//         Get.snackbar('Success', 'Quantity Product added successfully');
//       } else {
//         Get.snackbar('Error', 'Failed to add Quantity Product. Status Code: ${resp.statusCode}');
//       }
//     } catch (e) {
//       print('Exception: $e');
//       Get.snackbar('Error', 'Failed to send request');
//     } finally {
//       loading.value = false;
//     }
//   }
// }
