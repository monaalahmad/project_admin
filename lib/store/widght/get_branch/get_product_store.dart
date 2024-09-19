import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:project_admin/model/category_model.dart';
import '../../../controller/store_controller/get_controller/get_product.dart';
import '../../../model/product_model.dart';
import '../../../controller/store_controller/add_controller/add_product_store_controller.dart';

class ProductsStoreView extends StatefulWidget {
  final CategoryModel category;

  ProductsStoreView({required this.category});

  @override
  _ProductsStoreViewState createState() => _ProductsStoreViewState();
}

class _ProductsStoreViewState extends State<ProductsStoreView> {
  final ProductsStoreController productController = Get.put(ProductsStoreController());
  final AddProductsStoreController addProductController = Get.put(AddProductsStoreController());
  final GetStorage storage = GetStorage();
  final Map<int, bool> productSelection = {};  // لتتبع التحديد

  @override
  void initState() {
    super.initState();
    productController.getAllProductStore(widget.category.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Products of ${widget.category.name}'),
      ),
      body: Obx(() {
        if (productController.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        } else if (productController.productList.isEmpty) {
          return const Center(child: Text('No products available'));
        } else {
          return ListView.builder(
            padding: const EdgeInsets.all(10.0),
            itemCount: productController.productList.length,
            itemBuilder: (context, index) {
              final product = productController.productList[index];
              bool isChecked = productSelection[product.id] ?? false;  // استخدام المعرف لتحديد التحقق
              return ListTile(
                leading: Checkbox(
                  value: isChecked,
                  onChanged: (value) {
                    setState(() {
                      productSelection[product.id] = value ?? false;  // تحديث حالة التحديد
                    });
                  },
                ),
                title: Text(product.name),
                onTap: () {
                  // Navigate to the product details page if needed
                },
              );
            },
          );
        }
      }),
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(16.0),
        child: FloatingActionButton(
          onPressed: () async {
            // تجميع المنتجات المحددة فقط
            final selectedProductIds = productSelection.entries
                .where((entry) => entry.value)  // فقط التحديدات الصحيحة
                .map((entry) => entry.key)
                .toList();

            // قم بتحويل قائمة المعرفات إلى قائمة منتجات
            final selectedProducts = productController.productList
                .where((product) => selectedProductIds.contains(product.id))
                .toList();

            // إرسال المنتجات المحددة
            await addProductController.addProductStore(selectedProducts);
            Get.back(result: selectedProducts);
          },
          child: const Icon(Icons.check),
        ),
      ),
    );
  }
}
