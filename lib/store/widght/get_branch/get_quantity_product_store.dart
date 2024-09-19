import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/store_controller/add_controller/take_out_product_controller.dart';
import '../../../controller/store_controller/get_controller/get_quantity_product_controller.dart';
import '../../../model/product_quantity_model.dart';
import '../../../shard/color_app/color_app.dart';
import '../../../shard/static/buttom/text_form_field.dart';
import '../add_page_store/take_out_product.dart';

class GetQuantityProductStore extends StatefulWidget {
  final int productId;
  // final ProductQuantityModel productQuantity;
  const GetQuantityProductStore({Key? key, required this.productId}) : super(key: key);

  @override
  State<GetQuantityProductStore> createState() => _GetQuantityProductStoreState();
}

class _GetQuantityProductStoreState extends State<GetQuantityProductStore> {
  final ProductQuantityStoreController productQuantityStoreController = Get.put(ProductQuantityStoreController());
  final  takeOutQuantityProductStoreController = Get.put(TakeOutQuantityProductStoreController());

  @override
  void initState() {
    super.initState();
    productQuantityStoreController.getAllProductQuantity(widget.productId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Quantities'),
      ),
      body: RefreshIndicator(
        onRefresh: () async{
          productQuantityStoreController.getAllProductQuantity(widget.productId);
        },
        child: Obx(() {
          if (productQuantityStoreController.isLoading.value) {
            // Show a loading indicator while data is being fetched
            return const Center(child: CircularProgressIndicator());
          }

          if (productQuantityStoreController.productQuantityList.isEmpty) {
            return const Center(child: Text('No quantities available for this product.'));
          }

          return ListView.builder(
            itemCount: productQuantityStoreController.productQuantityList.length,
            itemBuilder: (context, index) {
              final productQuantity = productQuantityStoreController.productQuantityList[index];
              return Container(
                margin: const EdgeInsets.all(10),
                padding:const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: Colors.grey[600],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Column(
                          children: [
                            Text(
                              'Quantity Received: ${productQuantity.quantityReceived}', // Display received quantity
                              style:const TextStyle(color: Colors.white, fontSize: 20), // Text color set to white
                            ),
                            const SizedBox(height: 8), // Space between texts
                            Text(
                              'Quantity Remaining: ${productQuantity.quantityRemaining}', // Display remaining quantity
                              style:const TextStyle(color: Colors.white, fontSize: 20), // Text color set to white
                            ),
                          ],
                        ),
                        const Spacer(),
                        IconButton(
                          onPressed: (){
                            Get.to(() => TakeOutProduct(productId: widget.productId,));
                          },
                          icon: const Icon(Icons.minimize , color: Colors.white,),),
                      ],
                    ),
                    const SizedBox(height: 10), //
                    Text(
                      'expiration Date: ${productQuantity.expirationDate}', // Display remaining quantity
                      style: TextStyle(color: Colors.green[900], fontSize: 18), // Text color set to white
                    ),
                    const SizedBox(height: 8), // Space between texts
                    Text(
                      'expiration Time Remaining: ${productQuantity.expirationTimeRemaining}', // Display remaining quantity
                      style: TextStyle(color: Colors.red[900], fontSize: 18), // Text color set to white
                    ),
                  ],
                ),
              );
            },
          );
        }),
      ),
    );
  }
}
