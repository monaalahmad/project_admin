import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../shard/color_app/color_app.dart';
import '../../../shard/static/buttom/buttom.dart';

class ShowWarehouse extends StatefulWidget {
  const ShowWarehouse({super.key});

  @override
  State<ShowWarehouse> createState() => _ShowWarehouseState();
}

class _ShowWarehouseState extends State<ShowWarehouse> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('warehouse'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Center(
                child: Text('Please select a warehouse', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),)),
            const SizedBox(
              height: 15,
            ),
            Button(
              height: 100,
              width: 100,
              radius: 20,
              color: ColorApp.green,
              text: 'Warehouse 1',
              onPressed: () {
                Get.toNamed('/catReadyScreen');
              },
            ),
            const SizedBox(
              height: 15,
            ),
            Button(
              height: 100,
              width: 100,
              radius: 10,
              color: ColorApp.green,
              text: 'Warehouse 2',
              onPressed: () {
                Get.toNamed('/catReadyScreen');
              },
            ),
            const SizedBox(
              height: 15,
            ),
            Button(
              height: 100,
              width: 100,
              radius: 10,
              color: ColorApp.green,
              text: 'Warehouse 3',
              onPressed: () {
                Get.toNamed('/catReadyScreen');
              },
            ),
          ],
        ),
      ),
    );
  }
}
