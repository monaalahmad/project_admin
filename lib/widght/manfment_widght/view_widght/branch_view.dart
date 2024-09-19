import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/delete_controller/delete_branch.dart';
import '../../../controller/get_branch/branch_controller.dart';
import '../../../controller/update_controller/update_branch.dart';
import '../../../main.dart';
import '../../../shard/color_app/color_app.dart';
import '../../../shard/static/buttom/text_form_field.dart';
import 'package:image_picker/image_picker.dart';

class BranchView extends StatefulWidget {
  const BranchView({Key? key}) : super(key: key);

  @override
  State<BranchView> createState() => _BranchViewState();
}

class _BranchViewState extends State<BranchView> {
  final ImagePicker imagePicker = ImagePicker();
  File? image;

  Future<void> pickImageFromGallery() async {
    final pickedImage =
        await imagePicker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        image = File(pickedImage.path);
      });
    } else {
      Get.snackbar('Error', 'No image selected');
    }
  }


  @override
  Widget build(BuildContext context) {
    final branchController = Get.put(BranchController());
    final deleteController = Get.put(DeleteController());
    final UpdateController controller = Get.put(UpdateController());

    Future<void> _refreshBranchList() async {
      await branchController.getAllBranch();
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorApp.BrownChocoleat,
        elevation: 0.0,
        title: Text(
          'Branch',
          style: TextStyle(
            color: ColorApp.white,
          ),
        ),
      ),
      body: Obx(() {
        if (branchController.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        } else if (branchController.branchList.isEmpty) {
          print(branchController.branchList);
          return const Center(child: Text('No branches available'));
        } else {
          print(branchController.branchList);
          return RefreshIndicator(
            onRefresh: _refreshBranchList,
            child: ListView.builder(
              itemCount: branchController.branchList.length,
              itemBuilder: (context, index) {
                final branch = branchController.branchList[index];
                final imageUrl = '$baseUrl/storage/${branch.image}';
                print(imageUrl);
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 100,
                    color: ColorApp.beige,
                    child: Center(
                      child: ListTile(
                        onTap: () {
                          print(branch.id);
                        },
                        leading: branch.image.isNotEmpty
                            ? Image.network(
                                imageUrl,
                                errorBuilder: (context, error, stackTrace) =>
                                    const Icon(Icons.error),
                              )
                            : const Icon(Icons.image_not_supported),
                        title: Text(branch.name),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              icon: const Icon(Icons.delete, color: Colors.grey),
                              onPressed: () {
                                Get.defaultDialog(
                                  title: 'Confirm Deletion',
                                  middleText:
                                      'Are you sure you want to delete this branch?',
                                  textCancel: 'Cancel',
                                  textConfirm: 'Delete',
                                  onConfirm: () {
                                    setState(() {
                                      deleteController.deleteBranch(branch.id);
                                      Get.back();
                                    });
                                  },
                                );
                              },
                            ),
                            IconButton(
                              icon: const Icon(Icons.edit, color: Colors.blue),
                              onPressed: () {
                                controller.nameController.value.text =
                                    branch.name;
                                controller.imageController.value.text =
                                    branch.image;
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
                                                '_ Update Branch _',
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 20,
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 20,
                                              ),
                                              TextFormField2(
                                                controller: controller
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
                                                height: 20,
                                              ),
                                              GestureDetector(
                                                onTap: pickImageFromGallery,
                                                child: AbsorbPointer(
                                                  child: TextFormField(
                                                    controller: controller
                                                        .imageController.value,
                                                    decoration:
                                                        const InputDecoration(
                                                      labelText: 'Image Path',
                                                      hintText:
                                                          'Select an image from gallery',
                                                      border:
                                                          OutlineInputBorder(),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 20,
                                              ),
                                              TextFormField2(
                                                controller: controller
                                                    .descConfController.value,
                                                validator: (value) {
                                                  if (value.isEmpty) {
                                                    return 'you must enter new description';
                                                  }
                                                },
                                                labelText:
                                                    'New Description Branch',
                                                decoration: const InputDecoration(
                                                  border: InputBorder.none,
                                                  hintText:
                                                      'Enter New Description',
                                                  contentPadding:
                                                      EdgeInsets.symmetric(
                                                          horizontal: 15),
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 40,
                                              ),
                                              Obx(() {
                                                return controller.loading.value
                                                    ? const CircularProgressIndicator()
                                                    : Container(
                                                        width: 200,
                                                        decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(20),
                                                          color: ColorApp
                                                              .BrownChocola,
                                                        ),
                                                        child: TextButton(
                                                          onPressed: () {
                                                            if (image != null) {
                                                              controller
                                                                  .UpdateBranch(
                                                                      branch.id,
                                                                      image!);
                                                              Get.back();
                                                            } else {
                                                              Get.snackbar(
                                                                  'Error',
                                                                  'Please select an image');
                                                            }
                                                          },
                                                          child: Text(
                                                            'Update',
                                                            style: TextStyle(
                                                                color: ColorApp
                                                                    .white),
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
                          ],
                        ),
                      ),
                    ),
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
