import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../controller/storehouse_controller/add_controller/add_product_storehouse.dart';
import '../../controller/storehouse_controller/delete_controller/delete_product_storehouse_controller.dart';
import '../../controller/storehouse_controller/get_controller/get_product_storehouse_array.dart';
import '../../model/product_model.dart';
import '../../shard/color_app/color_app.dart';
import '../drawar.dart';

class HomePageStorehouse extends StatefulWidget {
  const HomePageStorehouse({super.key});

  @override
  State<HomePageStorehouse> createState() => _HomePageStatehouseStore();
}

class _HomePageStatehouseStore extends State<HomePageStorehouse> {

  final List<ProductModel> selectedProducts = [];
  final addProductsController = Get.put(AddProductsStorehouseController());
  final productsStoreArrayController = Get.put(
      ProductsStorehouseArrayController());
  final deleteProductStoreController = Get.put(
      DeleteProductStorehouseController());

  final TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadProducts();
  }

  void _loadProducts() {
    final storage = GetStorage();
    List<dynamic> storedProducts = storage.read<List<dynamic>>(
        'selectedProducts') ?? [];
    setState(() {
      selectedProducts.clear();
      selectedProducts.addAll(
          storedProducts.map((e) => ProductModel.fromJson(e)).toList());
    });
  }

  Future<void> _refreshProducts() async {
    await productsStoreArrayController.getAllProductStorehouseArray();
    _loadProducts();
  }

  void _addSelectedProducts() {
    if (selectedProducts.isNotEmpty) {
      addProductsController.addProductStorehouse(
          selectedProducts.map((p) => p).toList());
    } else {
      Get.snackbar('Error', 'No products selected');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Storehouse'),
      ),
      drawer: CDrawerStorehouse(),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            TextField(
              controller: searchController,
              decoration: InputDecoration(
                hintText: 'Search Products',
                border: const OutlineInputBorder(),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: () {
                    // Add search logic here using searchController.text
                  },
                ),
              ),
            ),
            const SizedBox(height: 10.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  child: const Text('Classification'),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: const Text('Category'),
                ),
              ],
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
                      itemCount: productsStoreArrayController.productList
                          .length,
                      itemBuilder: (context, index) {
                        final storeProduct = productsStoreArrayController
                            .productList[index];
                        return Card(
                          color: ColorApp.beige,
                          margin: const EdgeInsets.symmetric(vertical: 5.0),
                          child: ListTile(
                            title: Text(
                              storeProduct.name,
                              style: const TextStyle(color: Colors.black),
                            ),
                            trailing: IconButton(
                            icon: const Icon(Icons.delete, color: Colors.black),
                            onPressed: () {
                              Get.defaultDialog(
                                title: 'Confirm deletion',
                                middleText: 'Are you sure you want to delete this product?',
                                textCancel: 'Cancel',
                                textConfirm: 'Delete',
                                onCancel: () {},
                                onConfirm: () async {
                                  final success = await deleteProductStoreController
                                      .deleteProductStorehouse(storeProduct);

                                  if (success) {
                                    productsStoreArrayController.productList
                                        .removeAt(
                                        index); // Remove the product from the list
                                    Get.back(); // Close the dialog
                                    Get.snackbar('Success',
                                        'Product deleted successfully');
                                  } else {
                                    Get.snackbar(
                                        'Error', 'Failed to delete product');
                                  }
                                },
                              );
                            },
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