import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_admin/model/category_model.dart';
import '../../../controller/storehouse_controller/add_controller/add_product_storehouse.dart';
import '../../../controller/storehouse_controller/get_controller/get_product_storehouse.dart';
import 'package:get_storage/get_storage.dart';

import '../../../model/product_model.dart';

class ProductsStorehouseView extends StatefulWidget {
  final CategoryModel category;

  ProductsStorehouseView({required this.category});

  @override
  _ProductsStorehouseViewState createState() => _ProductsStorehouseViewState();
}

class _ProductsStorehouseViewState extends State<ProductsStorehouseView> {
  final ProductsStorehouseController productstorehouseController = Get.put(ProductsStorehouseController());
  final AddProductsStorehouseController addProductsStorehouseController = Get.put(AddProductsStorehouseController());
  final List<ProductModel> selectedProductsforstorhouse = [];
  final GetStorage storage = GetStorage();

  @override
  void initState() {
    super.initState();
    productstorehouseController.getAllProductStorehouse(widget.category.id);
    _loadSavedProducts(); // تحميل المنتجات المحفوظة مسبقاً
  }

  void _loadSavedProducts() {
    List<dynamic> storedProducts = storage.read<List<dynamic>>('selectedProducts') ?? [];
    selectedProductsforstorhouse.addAll(storedProducts.map((e) => ProductModel.fromJson(e)).toList());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Products of ${widget.category.name}'),
      ),
      body: Obx(() {
        if (productstorehouseController.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        } else if (productstorehouseController.productList.isEmpty) {
          return const Center(child: Text('No categories available'));
        } else {
          return ListView.builder(
            padding: const EdgeInsets.all(10.0),
            itemCount: productstorehouseController.productList.length,
            itemBuilder: (context, index) {
              final product = productstorehouseController.productList[index];
              bool isChecked = selectedProductsforstorhouse.contains(product);
              return ListTile(
                leading: Checkbox(
                  value: isChecked,
                  onChanged: (value) {
                    setState(() {
                      if (value!) {
                        selectedProductsforstorhouse.add(product);
                      } else {
                        selectedProductsforstorhouse.remove(product);
                      }
                    });
                  },
                ),
                title: Text(product.name),
                onTap: () {
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
            Get.back(result: selectedProductsforstorhouse);
            await addProductsStorehouseController.addProductStorehouse(List<ProductModel>.from(selectedProductsforstorhouse));
          },
          child: const Icon(Icons.check),
        ),
      ),
    );
  }
}
