import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/storehouse_controller/get_controller/get_classification_storehouse.dart';
import '../../../shard/color_app/color_app.dart';
import 'get_category_storehouse.dart';

class ClassificationStorehouseView extends StatefulWidget {
  ClassificationStorehouseView({Key? key}) : super(key: key);

  @override
  State<ClassificationStorehouseView> createState() => _ClassificationStorehouseViewState();
}

class _ClassificationStorehouseViewState extends State<ClassificationStorehouseView> {
  final ClassStorehouseController classificationStorehouseController = Get.put(ClassStorehouseController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Classifications'),
      ),
      body: Obx(() {
        if (classificationStorehouseController.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        } else if (classificationStorehouseController.classList.isEmpty) {
          return const Center(child: Text('No classifications available'));
        } else {
          return GridView.builder(
            padding: const EdgeInsets.all(10.0),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 10.0,
              crossAxisSpacing: 10.0,
            ),
            itemCount: classificationStorehouseController.classList.length,
            itemBuilder: (context, index) {
              final classification = classificationStorehouseController.classList[index];
              return GestureDetector(
                onTap: () {
                  Get.to(() => CategoryStorehouseView(classification: classification));
                },
                child: Container(
                  padding: const EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    color: ColorApp.whiteBrown,
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Center(
                          child: Text(
                            classification.name,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16.0,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      const SizedBox(height: 10.0),
                    ],
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
