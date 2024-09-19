import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/storehouse_controller/get_controller/get_category_storehouse.dart';
import '../../../model/classsification_model.dart';
import '../../../shard/color_app/color_app.dart';
import 'get_product_storehouse.dart';

class CategoryStorehouseView extends StatelessWidget {

  final ClassificationModel classification;

  CategoryStorehouseView({required this.classification}) {

    final CategoryStorehouseController categoryController = Get.put(CategoryStorehouseController());
    categoryController.getAllCategoryStorehouse(classification.id);
  }

  final CategoryStorehouseController categoryController = Get.put(CategoryStorehouseController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Categories of ${classification.name}'),
      ),
      body: Obx(() {
        if (categoryController.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        } else if (categoryController.categoryList.isEmpty) {
          return const Center(child: Text('No categories available'));
        } else {
          return GridView.builder(
            padding: const EdgeInsets.all(10.0),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 10.0,
              crossAxisSpacing: 10.0,
            ),
            itemCount: categoryController.categoryList.length,
            itemBuilder: (context, index) {
              final category = categoryController.categoryList[index];
              return ElevatedButton(
                onPressed: (){
                  Get.to(() => ProductsStorehouseView(category: category,));
                },
                style: ElevatedButton.styleFrom(
                  primary: ColorApp.whiteBrown,
                  onPrimary: Colors.white,
                  padding: const EdgeInsets.all(8.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      category.name,
                      textAlign: TextAlign.center,
                      style: const TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              );
            },
          );
        }
      }),
    );
  }
}
