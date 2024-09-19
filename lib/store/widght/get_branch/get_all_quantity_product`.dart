import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/store_controller/get_controller/get_quantity_all_product_controller.dart';
import '../../../shard/color_app/color_app.dart';
import 'get_quantity_product_store.dart';

class GetQuantityallProductStore extends StatefulWidget {
  final int productId;

  const GetQuantityallProductStore({Key? key, required this.productId}) : super(key: key);

  @override
  State<GetQuantityallProductStore> createState() => _GetQuantityallProductStoreState();
}

class _GetQuantityallProductStoreState extends State<GetQuantityallProductStore> {
  final productQuantityAllStoreController = Get.put(ProductQuantityAllStoreController());

  @override
  void initState() {
    super.initState();
    productQuantityAllStoreController.getAllProductQuantityAllStore(widget.productId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorApp.BrownChocoleat,
        elevation: 0.0,
        title: Text(
          'Quantity of Product',
          style: TextStyle(
            color: ColorApp.white,
          ),
        ),
      ),
      body: Obx(() {
        if (productQuantityAllStoreController.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        } else if (productQuantityAllStoreController.productQuantityAllList.isEmpty) {
          return const Center(child: Text('No quantities available for this product'));
        } else {
          return ListView.builder(
            itemCount: productQuantityAllStoreController.productQuantityAllList.length,
            itemBuilder: (context, index) {
              final quantity = productQuantityAllStoreController.productQuantityAllList[index];
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
                child: Container(
                  height: 100,
                  child: Card(
                    color: ColorApp.beige,
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ListTile(
                      onTap: () {
                        print(quantity.id);
                        Get.to(() => GetQuantityProductStore(productId: quantity.id));
                      },
                      title: Text(
                        'Product Name: ${quantity.name}',
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Price: \$${quantity.price.toString()}'),
                          Text('Quantity Remaining: ${quantity.quantity}'),
                        ],
                      ),
                      trailing: Icon(Icons.arrow_forward, color: ColorApp.BrownChocoleat),
                    ),
                  ),
                ),
              );
            },
          );
        }
      }),
    );
  }
}
