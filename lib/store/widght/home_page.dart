import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../controller/store_controller/add_controller/add_product_store_controller.dart';
import '../../controller/store_controller/delete_controller/delete_product.dart';
import '../../controller/store_controller/get_controller/get_product_store2_array.dart';
import '../../model/model_for_delete.dart';
import '../../model/product_model.dart';
import '../../model/product_store.dart';
import '../../shard/color_app/color_app.dart';
import 'add_page_store/add_quantity.dart';
import 'drawer.dart';
import 'get_branch/get_all_quantity_product`.dart';
import 'product_detailPage_for_store.dart';

class HomePageStore extends StatefulWidget {

  @override
  State<HomePageStore> createState() => _HomePageStateStore();
}

class _HomePageStateStore extends State<HomePageStore> {
  final List<ProductModel> selectedProducts = [];
  final addProductsController = Get.put(AddProductsStoreController());
  final productsStoreArrayController = Get.put(ProductsStoreArrayController());
  final deleteProductStoreController = Get.put(DeleteProductStoreController());

  @override
  void initState() {
    super.initState();
    _loadProducts();
    productsStoreArrayController.getAllProductStoreArray();
  }

  void _loadProducts() {
    final storage = GetStorage();
    List<dynamic> storedProducts =
        storage.read<List<dynamic>>('selectedProducts') ?? [];
    setState(() {
      selectedProducts.clear();
      selectedProducts
          .addAll(storedProducts.map((e) => ProductModel.fromJson(e)).toList());
    });
  }

  Future<void> _refreshProducts() async {
    await productsStoreArrayController.getAllProductStoreArray();
    _loadProducts();
  }

  void _addSelectedProducts() {
    if (selectedProducts.isNotEmpty) {
      addProductsController.addProductStore(
          selectedProducts.map((p) => p).toList());
    } else {
      Get.snackbar('Error', 'No products selected');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Store'),
      ),
      drawer: CDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            TextField(
              onChanged: (value) {
              },
              decoration: const InputDecoration(
                labelText: 'Search Products',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10.0),
            Expanded(
              child: RefreshIndicator(
                onRefresh: _refreshProducts,
                child: Obx(() {
                  if (productsStoreArrayController.isLoading.value) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (productsStoreArrayController.productList.isEmpty) {
                    return const Center(child: Text('No Products available'));
                  } else {
                    return ListView.builder(
                      padding: const EdgeInsets.all(10.0),
                      itemCount: productsStoreArrayController.productList.length,
                      itemBuilder: (context, index) {
                        final storeProduct = productsStoreArrayController.productList[index];
                        return Card(
                          color: ColorApp.beige,
                          margin: const EdgeInsets.symmetric(vertical: 5.0),
                          child: ListTile(
                            title: Text(
                              storeProduct.name ?? 'Unnamed Product',
                              style: const TextStyle(color: Colors.black),
                            ),
                            onTap: () {
                              Get.to(() => GetQuantityallProductStore(productId: storeProduct.id));
                            },
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min, // Ensure the row fits the available space
                              children: [
                                IconButton(
                                  icon: const Icon(Icons.delete, color: Colors.black),
                                  onPressed: () {
                                    Get.defaultDialog(
                                      title: 'Confirm deletion',
                                      middleText: 'Are you sure you want to delete this product?',
                                      textCancel: 'Cancel',
                                      textConfirm: 'Delete',
                                      onCancel: () {},
                                      onConfirm: () async {
                                        final success = await deleteProductStoreController.deleteProductStore(storeProduct.id); // Pass the whole object
                                        if (success) {
                                          productsStoreArrayController.productList.removeAt(index); // Make sure index corresponds correctly
                                          Get.back();
                                          Get.snackbar('Success', 'Product deleted successfully');
                                        } else {
                                          Get.snackbar('Error', 'Failed to delete product');
                                        }
                                      },
                                    );
                                  },
                                ),
                                const SizedBox(width: 10.0),
                                IconButton(
                                  icon: const Icon(Icons.check_circle, color: Colors.black),
                                  onPressed: () {
                                    int productId = storeProduct.id; // الحصول على ID المنتج من الـ storeProduct
                                    Get.to(() => AddQuantityStore(productId: productId));
                                  },
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  }
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
