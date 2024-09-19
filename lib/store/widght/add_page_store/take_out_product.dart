import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/store_controller/add_controller/take_out_product_controller.dart';
import '../../../shard/color_app/color_app.dart';
import '../../../shard/static/buttom/text_form_field.dart';

class TakeOutProduct extends StatefulWidget {

  final int productId;
  const TakeOutProduct({super.key, required this.productId});

  @override
  State<TakeOutProduct> createState() => _TakeOutProductState();
}

class _TakeOutProductState extends State<TakeOutProduct> {
  final takeOutQuantityProductStoreController = Get.put(TakeOutQuantityProductStoreController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body:  SingleChildScrollView( // Wrap the Column with SingleChildScrollView
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 30.0,
            vertical: 30.0,
          ),
          child: Column(
            children: [
              const Text(
                '_ Take Out Product _',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                ),
              ),
              const SizedBox(height: 20),
              TextFormField2(
                controller: takeOutQuantityProductStoreController
                    .quantityController.value,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'You must enter Quantity';
                  }
                  return null;
                },
                labelText: 'Quantity',
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Quantity',
                  contentPadding: EdgeInsets.symmetric(horizontal: 15),
                ),
              ),
              const SizedBox(height: 40),
              Obx(() {
                return takeOutQuantityProductStoreController.loading.value
                    ? const CircularProgressIndicator()
                    : Container(
                  width: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: ColorApp.BrownChocola,
                  ),
                  child: TextButton(
                    onPressed: () {
                      takeOutQuantityProductStoreController
                          .takeOutQuantityProductStore(widget.productId);
                    },
                    child: Text(
                      'Take Out',
                      style: TextStyle(color: ColorApp.white),
                    ),
                  ),
                );
              }),
            ],
          ),
        ),
      ),
    );
      SingleChildScrollView( // Wrap the Column with SingleChildScrollView
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 30.0,
          vertical: 30.0,
        ),
        child: Column(
          children: [
            const Text(
              '_ Take Out Product _',
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 20),
            TextFormField2(
              controller: takeOutQuantityProductStoreController
                  .quantityController.value,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'You must enter Quantity';
                }
                return null;
              },
              labelText: 'Quantity',
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: 'Quantity',
                contentPadding: EdgeInsets.symmetric(horizontal: 15),
              ),
            ),
            const SizedBox(height: 40),
            Obx(() {
              return takeOutQuantityProductStoreController.loading.value
                  ? const CircularProgressIndicator()
                  : Container(
                width: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: ColorApp.BrownChocola,
                ),
                child: TextButton(
                  onPressed: () {
                    takeOutQuantityProductStoreController
                        .takeOutQuantityProductStore(widget.productId);
                  },
                  child: Text(
                    'Take Out',
                    style: TextStyle(color: ColorApp.white),
                  ),
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
