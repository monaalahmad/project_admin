import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/delete_controller/delete_product.dart';
import '../../../controller/get_branch/classification_controller.dart';
import '../../../controller/get_branch/product_controller.dart';
import '../../../controller/update_controller/update_product.dart';
import '../../../main.dart';
import '../../../shard/color_app/color_app.dart';
import '../../../shard/static/buttom/text_form_field.dart';
import 'package:image_picker/image_picker.dart';

class ProductView extends StatefulWidget {
  const ProductView({super.key});

  @override
  State<ProductView> createState() => _ProductViewState();
}

class _ProductViewState extends State<ProductView> {
  final ProductController productController = Get.put(ProductController());
  final UpdateProductController updateProductController = Get.put(UpdateProductController());
  final DeleteProductController deleteProductController = Get.put(DeleteProductController());
  final ClassificationController classificationViewController = Get.put(ClassificationController());

  int ? selectedClassificationId;
  final ImagePicker imagePicker = ImagePicker();
  File? image;

  Future<void> pickImageFromGallery() async {
    final pickedImage = await imagePicker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        image = File(pickedImage.path);
        updateProductController.imageController.value.text = pickedImage.path; // تحديث النص في TextFormField
      });
    } else {
      Get.snackbar('Error', 'No image selected');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Products'),
      ),
      body: Obx(() {
        if (productController.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        } else if (productController.productList.isEmpty) {
          print(productController.productList);
          return const Center(child: Text('No products available'));
        } else {
          print(productController.productList);
          return RefreshIndicator(
            onRefresh: () async {
              await productController.getAllProduct();
            },
            child: GridView.builder(
              padding: const EdgeInsets.all(8.0),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // Number of columns
                childAspectRatio: 2 / 3, // Aspect ratio of each item
                mainAxisSpacing: 8.0, // Spacing between rows
                crossAxisSpacing: 8.0, // Spacing between columns
              ),
              itemCount: productController.productList.length,
              itemBuilder: (context, index) {
                final product = productController.productList[index];
                final imageUrl = '$baseUrl/storage/${product.image}';
                return Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      color: Colors.black, // Border color
                      width: 2, // Border width
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: product.image.isNotEmpty
                            ? Image.network(
                          imageUrl,
                          errorBuilder: (context, error, stackTrace) => const Icon(Icons.error),
                          fit: BoxFit.cover,
                          width: double.infinity,
                        )
                            : const Icon(
                          Icons.image_not_supported,
                          size: 100,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          product.name ?? 'No name',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 19,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Text(
                              '${product.price} \$',
                              style: const TextStyle(
                                fontSize: 18,
                                color: Colors.black,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          IconButton(
                            icon: const Icon(Icons.delete, color: Colors.grey),
                            onPressed: () {
                              Get.defaultDialog(
                                title: 'Confirm Deletion',
                                middleText: 'Are you sure you want to delete this product?',
                                textCancel: 'Cancel',
                                textConfirm: 'Delete',
                                onConfirm: () {
                                  setState(() {
                                    deleteProductController.deleteProduct(product.id);
                                    Get.back();
                                  });
                                },
                              );
                            },
                          ),
                          IconButton(
                            icon: const Icon(Icons.edit, color: Colors.blue),
                            onPressed: () {
                              updateProductController.nameController.value.text = product.name;
                              updateProductController.priceController.value.text = product.price.toString();
                              updateProductController.classificationId.value.text = product.product_classification_id.toString();
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
                                        padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 30.0),
                                        child: Column(
                                          children: [
                                            const Text(
                                              '_ Update Product _',
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 20,
                                              ),
                                            ),
                                            const SizedBox(height: 20),
                                            TextFormField2(
                                              controller: updateProductController.nameController.value,
                                              validator: (value) {
                                                if (value.isEmpty) {
                                                  return 'you must enter new Name';
                                                }
                                              },
                                              labelText: 'New Name Product',
                                              decoration: const InputDecoration(
                                                border: InputBorder.none,
                                                hintText: 'Enter New Name',
                                                contentPadding: EdgeInsets.symmetric(horizontal: 15),
                                              ),
                                            ),
                                            const SizedBox(height: 20),
                                            GestureDetector(
                                              onTap: pickImageFromGallery,
                                              child: AbsorbPointer(
                                                child: TextFormField(
                                                  controller: updateProductController.imageController.value,
                                                  decoration: const InputDecoration(
                                                    labelText: 'Image Path',
                                                    hintText: 'Select an image from gallery',
                                                    border: OutlineInputBorder(),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            const SizedBox(height: 20),
                                            TextFormField2(
                                              controller: updateProductController.priceController.value,
                                              validator: (value) {
                                                if (value.isEmpty) {
                                                  return 'you must enter new price';
                                                }
                                              },
                                              labelText: 'New price',
                                              decoration: const InputDecoration(
                                                border: InputBorder.none,
                                                hintText: 'Enter New price',
                                                contentPadding: EdgeInsets.symmetric(horizontal: 15),
                                              ),
                                            ),
                                            const SizedBox(height: 20),
                                            Obx(() {
                                              if (classificationViewController.isLoading.value) {
                                                return const CircularProgressIndicator();
                                              } else {
                                                return DropdownButtonFormField<int>(
                                                  value: selectedClassificationId,
                                                  items: classificationViewController.classificationList.map((classification) {
                                                    return DropdownMenuItem<int>(
                                                      value: classification.id,
                                                      child: Text(classification.name),
                                                    );
                                                  }).toList(),
                                                  onChanged: (newValue) {
                                                    setState(() {
                                                      selectedClassificationId = newValue;
                                                      updateProductController.classificationId.value.text = newValue.toString();
                                                    });
                                                  },
                                                  decoration: const InputDecoration(
                                                    labelText: 'Name Classification',
                                                    hintText: 'Select Name Classification',
                                                    border: OutlineInputBorder(),
                                                    contentPadding: EdgeInsets.symmetric(horizontal: 15),
                                                  ),
                                                  validator: (value) {
                                                    if (value == null) {
                                                      return 'You must enter classification';
                                                    }
                                                    return null;
                                                  },
                                                );
                                              }
                                            }),
                                            const SizedBox(height: 40),
                                            Obx(() {
                                              return updateProductController.loading.value
                                                  ? const CircularProgressIndicator()
                                                  : Container(
                                                width: 200,
                                                decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(20),
                                                  color: ColorApp.BrownChocola,
                                                ),
                                                child: TextButton(
                                                  onPressed: () {
                                                    if (image != null) {
                                                      updateProductController.updateProduct(product.id, image!);
                                                      Get.back();
                                                    } else {
                                                      Get.snackbar('Error', 'Please select an image');
                                                    }
                                                  },
                                                  child: Text(
                                                    'Update',
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
