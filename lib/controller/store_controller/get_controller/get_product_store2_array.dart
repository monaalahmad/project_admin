import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:get_storage/get_storage.dart';
import 'package:project_admin/model/product_store.dart';
import '../../../main.dart';
import '../../../model/product_model.dart';

class ProductsStoreArrayController extends GetxController {
  var productList = <ProductModel>[].obs;
  var isLoading = true.obs;
  final box = GetStorage();


  @override
  void onInit() {
    super.onInit();
    getAllProductStoreArray(); // تحميل البيانات مبدئيًا
  }

  Future<void> getAllProductStoreArray() async {
    try {
      isLoading(true); // بدء التحميل
      String? token = box.read('token');
      if (token == null) {
        Get.snackbar('Error', 'Token is null');
        return;
      }

      final Uri uri = Uri.parse('$baseUrl/api/employee/ElectronicShop/StoreProduct/index');

      final response = await http.get(
        uri,
        headers: {
          'Authorization': 'Bearer $token',
          'Accept': 'application/json',
        },
      );

      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}'); // تحقق من الاستجابة

      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);

        // تحقق من نجاح الاستجابة ووجود البيانات
        if (jsonData['success'] == true && jsonData.containsKey('data')) {
          final productsData = jsonData['data'];

          // تحقق مما إذا كانت البيانات قائمة قبل محاولة تحويلها
          if (productsData is List) {
            productList.value = productsData.map((item) => ProductModel.fromJson(item)).toList();
            print('Loaded products: ${productList.length}'); // تحقق من عدد المنتجات المحملة
          } else {
            Get.snackbar('Error', 'Data format is not a list');
          }
        } else {
          Get.snackbar('Error', 'Unexpected data format');
        }
      } else {
        Get.snackbar('Error', 'Status code: ${response.statusCode}');
      }
    } catch (e) {
      print(e.toString());
      Get.snackbar('Error', 'Failed to fetch products: ${e.toString()}');
    } finally {
      isLoading(false); // إنهاء التحميل
    }
  }
}
