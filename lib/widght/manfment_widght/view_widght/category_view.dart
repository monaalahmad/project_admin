import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:project_admin/model/classsification_model.dart';
import '../../../controller/delete_controller/delete_category.dart';
import '../../../controller/get_branch/category_controller.dart';
import '../../../controller/update_controller/update_category.dart';
import '../../../main.dart';
import '../../../shard/color_app/color_app.dart';
import '../../../shard/static/buttom/text_form_field.dart';
class CategoryView extends StatefulWidget {
  const CategoryView({super.key});

  @override
  State<CategoryView> createState() => _CategoryViewState();
}

class _CategoryViewState extends State<CategoryView> {

  final CategoryController categoryController = Get.put(CategoryController());
  final DeleteCategoryController deleteCategoryController = Get.put(DeleteCategoryController());
  final UpdateCategoryController updateCategoryController = Get.put(UpdateCategoryController());

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
    return Scaffold(
      appBar: AppBar(
        title: const Text('Category'),
      ),
      body:  Obx(() {
        if (categoryController.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        } else if (categoryController.categoryList.isEmpty) {
          print(categoryController.categoryList);
          return const Center(child: Text('No category available'));
        } else {
          print(categoryController.categoryList);
          return RefreshIndicator(
            onRefresh: () async {
              await categoryController.getAllCategory();
            },
            child: ListView.builder(
              itemCount: categoryController.categoryList.length,
              itemBuilder: (context, index) {
                final category = categoryController.categoryList[index];
                final imageUrl = '$baseUrl/storage/${category.image}';
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 100,
                    color: ColorApp.beige,
                    child: Center(
                      child: ListTile(
                        onTap: () {
                          print(category.id);
                        },
                        leading: category.image.isNotEmpty
                            ? Image.network(
                          imageUrl,
                          errorBuilder: (context, error, stackTrace) =>
                          const Icon(Icons.error),
                        )
                            : const Icon(Icons.image_not_supported),
                        title: Text(category.name),
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
                                      deleteCategoryController.deleteCategory(category.id);
                                      Get.back();
                                    });
                                  },
                                );
                              },
                            ),
                            IconButton(
                              icon: const Icon(Icons.edit, color: Colors.blue),
                              onPressed: () {
                                updateCategoryController.nameController.value.text =
                                    category.name;
                                updateCategoryController.imageController.value.text =
                                    category.image;
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
                                                '_ Update Category _',
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 20,
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 20,
                                              ),
                                              TextFormField2(
                                                controller: updateCategoryController
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
                                                    controller: updateCategoryController
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
                                                height: 40,
                                              ),
                                              Obx(() {
                                                return updateCategoryController.loading.value
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
                                                        updateCategoryController
                                                            .UpdateCategory(
                                                            category.id,
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