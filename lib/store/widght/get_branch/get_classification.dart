import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/store_controller/get_controller/get_classification.dart';
import '../../../shard/color_app/color_app.dart';
import 'get_category.dart';

class ClassificationStoreView extends StatefulWidget {
  ClassificationStoreView({Key? key}) : super(key: key);

  @override
  State<ClassificationStoreView> createState() => _ClassificationStoreViewState();
}

class _ClassificationStoreViewState extends State<ClassificationStoreView> {

  final ClassController classificationStoreController = Get.put(ClassController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Classifications'),
      ),
      body: Obx(() {
        if (classificationStoreController.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        } else if (classificationStoreController.classList.isEmpty) {
          return const Center(child: Text('No classifications available'));
        } else {
          return GridView.builder(
            padding: const EdgeInsets.all(10.0),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 10.0,
              crossAxisSpacing: 10.0,
            ),
            itemCount: classificationStoreController.classList.length,
            itemBuilder: (context, index) {
              final classification = classificationStoreController.classList[index];
              return GestureDetector(
                onTap: () {
                  Get.to(() => CategoryStoreView(classification: classification));
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
