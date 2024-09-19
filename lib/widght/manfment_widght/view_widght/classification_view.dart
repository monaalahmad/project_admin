import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_admin/controller/get_branch/classification_controller.dart';
import '../../../controller/delete_controller/delete_classification.dart';
import '../../../controller/update_controller/update_classification.dart';
import '../../../shard/color_app/color_app.dart';
import '../../../shard/static/buttom/text_form_field.dart';

class ClassificationView extends StatefulWidget {
  ClassificationView({Key? key}) : super(key: key);

  @override
  State<ClassificationView> createState() => _ClassificationViewState();
}

class _ClassificationViewState extends State<ClassificationView> {


  final ClassificationController classificationController = Get.put(ClassificationController());
  final DeleteClassificationController deleteController = Get.put(DeleteClassificationController());
  final UpdateClassificationController UpdateController = Get.put(UpdateClassificationController());



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Classifications'),
      ),
      body: Obx(() {
        if (classificationController.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        } else if (classificationController.classificationList.isEmpty) {
          return const Center(child: Text('No classifications available'));
        } else {
          return RefreshIndicator(
              onRefresh: () async {
            await classificationController.getAllClassification();
          },
          child: GridView.builder(
            padding: const EdgeInsets.all(10.0),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 10.0,
              crossAxisSpacing: 10.0,
            ),
            itemCount: classificationController.classificationList.length,
            itemBuilder: (context, index) {
              final classification =
                  classificationController.classificationList[index];
              return Container(
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.edit, color: Colors.blue),
                          onPressed: () {
                            UpdateController.nameController.value.text =
                                classification.name;
                            showModalBottomSheet(
                              backgroundColor: Colors.transparent,
                              context: context,
                              builder: (BuildContext context) {
                                return Center(
                                  child: Container(
                                    height: 600,
                                    decoration: BoxDecoration(
                                      borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(30),
                                        topRight: Radius.circular(30),
                                      ),
                                      gradient: LinearGradient(
                                        begin: Alignment.topCenter,
                                        end: Alignment.bottomCenter,
                                        colors: [
                                          ColorApp.green,
                                          ColorApp.darkBrown,
                                        ],
                                      ),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 30.0, vertical: 30.0),
                                      child: Column(
                                        children: [
                                          const Text(
                                            '_ Update Classification _',
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 20,
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 20,
                                          ),
                                          TextFormField2(
                                            controller: UpdateController
                                                .nameController.value,
                                            validator: (value) {
                                              if (value.isEmpty) {
                                                return 'you must enter new Name';
                                              }
                                            },
                                            labelText: 'New Name Branch',
                                            decoration: const InputDecoration(
                                              border: InputBorder.none,
                                              hintText: 'Enter New Name',
                                              contentPadding:
                                                  EdgeInsets.symmetric(
                                                      horizontal: 15),
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 40,
                                          ),
                                          Obx(() {
                                            return UpdateController
                                                    .loading.value
                                                ? const CircularProgressIndicator()
                                                : Container(
                                                    width: 200,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20),
                                                      color:
                                                          ColorApp.BrownChocola,
                                                    ),
                                                    child: TextButton(
                                                      onPressed: () {
                                                        UpdateController.UpdateClassification(classification.id);
                                                      },
                                                      child: Text(
                                                        'Update',
                                                        style: TextStyle(
                                                            color:
                                                                ColorApp.white),
                                                      ),
                                                    ),
                                                  );
                                          }),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                        ),
                        const SizedBox(width: 10.0),
                        IconButton(
                          icon: const Icon(Icons.delete, color: Colors.grey),
                          onPressed: () {
                            Get.defaultDialog(
                              title: 'Confirm Deletion',
                              middleText:
                                  'Are you sure you want to delete this Classification?',
                              textCancel: 'Cancel',
                              textConfirm: 'Delete',
                              onConfirm: () {
                                setState(() {
                                  deleteController
                                      .deleteClassification(classification.id);
                                  Get.back();
                                });
                              },
                            );
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          ),
          );
        }
      }),
    );
  }
}
