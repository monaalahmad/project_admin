import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../../../controller/add_controller/add_branch.dart';
import '../../../controller/add_controller/add_category.dart';
import '../../../controller/add_controller/add_classification.dart';
import '../../../controller/add_controller/add_product.dart';
import '../../../controller/add_controller/add_storehouse.dart';
import '../../../controller/get_branch/category_controller.dart';
import '../../../controller/get_branch/classification_controller.dart';
import '../../../shard/color_app/color_app.dart';
import '../../../shard/static/buttom/text_form_field.dart';

class AddPage extends StatefulWidget {
  const AddPage({super.key});

  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  final _selectedClassificationId = ValueNotifier<int?>(null);

  final AddController controller = Get.put(AddController());
  final AddClassificationController controllerClass =
      Get.put(AddClassificationController());
  final AddCategoryController addCategoryController =
      Get.put(AddCategoryController());
  final ClassificationController classificationViewController =
      Get.put(ClassificationController());
  final CategoryController categoryViewController =
      Get.put(CategoryController());
  final AddProductController addProductController =
      Get.put(AddProductController());
  final AddStorehouseController addStorehouseController =
      Get.put(AddStorehouseController());

  File? image;
  final ImagePicker imagePicker = ImagePicker();
  int? selectedClassificationId;

  final List<String> options = ["store", "storehouse ", "all"];
  String? selectedOption;

  Future<void> pickImageFromGallery() async {
    final pickedImage =
        await imagePicker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        image = File(pickedImage.path);
        addProductController.imageController.value.text = pickedImage.path;
      });
    } else {
      Get.snackbar('Error', 'No image selected');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorApp.whiteBrown,
        title: const Text("Add Page"),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 40.0,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Container(
                      width: 150,
                      height: 150,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            ColorApp.BrownChocola,
                            ColorApp.beige,
                          ],
                        ),
                      ),
                      child: TextButton(
                        onPressed: () {
                          Get.toNamed('/UserPage');
                        },
                        child: Text(
                          'Add Employee',
                          style: TextStyle(color: ColorApp.white),
                        ),
                      ),
                    ),
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.only(top: 100.0),
                      child: Container(
                        width: 150,
                        height: 150,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              ColorApp.BrownChocola,
                              ColorApp.beige,
                            ],
                          ),
                        ),
                        child: TextButton(
                          onPressed: () {
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
                                        horizontal: 30.0,
                                        vertical: 30.0,
                                      ),
                                      child: Column(
                                        children: [
                                          const Text(
                                            '_ Add Branch _',
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 20,
                                            ),
                                          ),
                                          const SizedBox(height: 20),
                                          TextFormField2(
                                            controller:
                                                controller.nameController.value,
                                            validator: (value) {
                                              if (value.isEmpty) {
                                                return 'You must enter name';
                                              }
                                              return null;
                                            },
                                            labelText: 'Name Branch',
                                            decoration: const InputDecoration(
                                              border: InputBorder.none,
                                              hintText: 'Enter Name',
                                              contentPadding:
                                                  EdgeInsets.symmetric(
                                                      horizontal: 15),
                                            ),
                                          ),
                                          const SizedBox(height: 20),
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
                                                  border: OutlineInputBorder(),
                                                ),
                                              ),
                                            ),
                                          ),
                                          const SizedBox(height: 20),
                                          TextFormField2(
                                            controller: controller
                                                .descConfController.value,
                                            validator: (value) {
                                              if (value.isEmpty) {
                                                return 'You must enter description';
                                              }
                                              return null;
                                            },
                                            labelText: 'Description Branch',
                                            decoration: const InputDecoration(
                                              border: InputBorder.none,
                                              hintText: 'Enter Description',
                                              contentPadding:
                                                  EdgeInsets.symmetric(
                                                      horizontal: 15),
                                            ),
                                          ),
                                          const SizedBox(height: 40),
                                          Obx(() {
                                            return controller.loading.value
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
                                                        if (image != null) {
                                                          controller.addBranch(
                                                              image!);
                                                          Get.toNamed(
                                                              '/AddPage');
                                                        } else {
                                                          Get.snackbar('Error',
                                                              'Please select an image');
                                                        }
                                                      },
                                                      child: Text(
                                                        'Add',
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
                          child: Text(
                            'Add Branch',
                            style: TextStyle(color: ColorApp.white),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Container(
                      width: 150,
                      height: 150,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            ColorApp.BrownChocola,
                            ColorApp.beige,
                          ],
                        ),
                      ),
                      child: TextButton(
                        onPressed: () {
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
                                      horizontal: 30.0,
                                      vertical: 30.0,
                                    ),
                                    child: Column(
                                      children: [
                                        const Text(
                                          '_ Add Classification _',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 20,
                                          ),
                                        ),
                                        const SizedBox(height: 20),
                                        TextFormField2(
                                          controller: controllerClass
                                              .nameController.value,
                                          validator: (value) {
                                            if (value.isEmpty) {
                                              return 'You must enter name';
                                            }
                                            return null;
                                          },
                                          labelText: 'Name',
                                          decoration: const InputDecoration(
                                            border: InputBorder.none,
                                            hintText: 'Enter Name',
                                            contentPadding:
                                                EdgeInsets.symmetric(
                                                    horizontal: 15),
                                          ),
                                        ),
                                        const SizedBox(height: 20),
                                        DropdownButtonFormField<String>(
                                          value: selectedOption,
                                          onChanged: (value) {
                                            setState(() {
                                              selectedOption = value;
                                              controllerClass
                                                  .follow_toController
                                                  .value
                                                  .text = value!;
                                            });
                                          },
                                          validator: (value) {
                                            if (value == null ||
                                                value.isEmpty) {
                                              return 'You must enter follow';
                                            }
                                            return null;
                                          },
                                          decoration: const InputDecoration(
                                            labelText: 'follow to',
                                            hintText: '',
                                            contentPadding:
                                                EdgeInsets.symmetric(
                                                    horizontal: 15),
                                            border: OutlineInputBorder(),
                                          ),
                                          items: options.map((String option) {
                                            return DropdownMenuItem<String>(
                                              value: option,
                                              child: Text(option),
                                            );
                                          }).toList(),
                                        ),
                                        const SizedBox(height: 40),
                                        Container(
                                          width: 200,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            color: ColorApp.BrownChocola,
                                          ),
                                          child: Obx(() {
                                            return controller.loading.value
                                                ? const CircularProgressIndicator()
                                                : TextButton(
                                                    onPressed: () {
                                                      controllerClass
                                                          .addClassification();
                                                    },
                                                    child: Text(
                                                      'Add',
                                                      style: TextStyle(
                                                          color:
                                                              ColorApp.white),
                                                    ),
                                                  );
                                          }),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          );
                        },
                        child: Text(
                          'Add Classification',
                          style: TextStyle(color: ColorApp.white),
                        ),
                      ),
                    ),
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.only(top: 100.0),
                      child: Container(
                        width: 150,
                        height: 150,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              ColorApp.BrownChocola,
                              ColorApp.beige,
                            ],
                          ),
                        ),
                        child: TextButton(
                          onPressed: () {
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
                                        horizontal: 30.0,
                                        vertical: 30.0,
                                      ),
                                      child: Column(
                                        children: [
                                          const Text(
                                            '_ Add Category _',
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 20,
                                            ),
                                          ),
                                          const SizedBox(height: 20),
                                          TextFormField2(
                                            controller: addCategoryController
                                                .nameController.value,
                                            validator: (value) {
                                              if (value.isEmpty) {
                                                return 'You must enter name';
                                              }
                                              return null;
                                            },
                                            labelText: 'Name Category',
                                            decoration: const InputDecoration(
                                              border: InputBorder.none,
                                              hintText: 'Enter Name',
                                              contentPadding:
                                                  EdgeInsets.symmetric(
                                                      horizontal: 15),
                                            ),
                                          ),
                                          const SizedBox(height: 20),
                                          GestureDetector(
                                            onTap: pickImageFromGallery,
                                            child: AbsorbPointer(
                                              child: TextFormField(
                                                controller:
                                                    addCategoryController
                                                        .imageController.value,
                                                decoration:
                                                    const InputDecoration(
                                                  labelText: 'Image Path',
                                                  hintText:
                                                      'Select an image from gallery',
                                                  border: OutlineInputBorder(),
                                                ),
                                              ),
                                            ),
                                          ),
                                          const SizedBox(height: 20),
                                          Obx(() {
                                            if (classificationViewController
                                                .isLoading.value) {
                                              return const CircularProgressIndicator();
                                            } else {
                                              return DropdownButtonFormField<
                                                  int>(
                                                value: selectedClassificationId,
                                                items:
                                                    classificationViewController
                                                        .classificationList
                                                        .map((classification) {
                                                  return DropdownMenuItem<int>(
                                                    value: classification.id,
                                                    child: Text(
                                                        classification.name),
                                                  );
                                                }).toList(),
                                                onChanged: (newValue) {
                                                  setState(() {
                                                    selectedClassificationId =
                                                        newValue;
                                                    addCategoryController
                                                        .classificationIdController
                                                        .value
                                                        .text = newValue.toString();
                                                  });
                                                },
                                                decoration:
                                                    const InputDecoration(
                                                  labelText: 'Name Category',
                                                  hintText:
                                                      'Select Name Category',
                                                  border: OutlineInputBorder(),
                                                  contentPadding:
                                                      EdgeInsets.symmetric(
                                                          horizontal: 15),
                                                ),
                                                validator: (value) {
                                                  if (value == null) {
                                                    return 'You must enter Category';
                                                  }
                                                  return null;
                                                },
                                              );
                                            }
                                          }),
                                          const SizedBox(height: 40),
                                          Obx(() {
                                            return addCategoryController
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
                                                        if (image != null) {
                                                          addCategoryController
                                                              .addCategory(
                                                                  image!);
                                                          Get.toNamed(
                                                              '/AddPage');
                                                        } else {
                                                          Get.snackbar('Error',
                                                              'Please select an image');
                                                        }
                                                      },
                                                      child: Text(
                                                        'Add',
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
                          child: Text(
                            'Add Category',
                            style: TextStyle(color: ColorApp.white),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Container(
                      width: 150,
                      height: 150,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            ColorApp.BrownChocola,
                            ColorApp.beige,
                          ],
                        ),
                      ),
                      child: TextButton(
                        onPressed: () {
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
                                      horizontal: 30.0,
                                      vertical: 30.0,
                                    ),
                                    child: Column(
                                      children: [
                                        const Text(
                                          '_ Add Product _',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 20,
                                          ),
                                        ),
                                        const SizedBox(height: 20),
                                        TextFormField2(
                                          controller: addProductController
                                              .nameController.value,
                                          validator: (value) {
                                            if (value == null ||
                                                value.isEmpty) {
                                              return 'You must enter name';
                                            }
                                            return null;
                                          },
                                          labelText: 'Name Product',
                                          decoration: const InputDecoration(
                                            border: InputBorder.none,
                                            hintText: 'Enter Name',
                                            contentPadding:
                                                EdgeInsets.symmetric(
                                                    horizontal: 15),
                                          ),
                                        ),
                                        const SizedBox(height: 20),
                                        TextFormField2(
                                          controller: addProductController
                                              .priceController.value,
                                          validator: (value) {
                                            if (value == null ||
                                                value.isEmpty) {
                                              return 'You must enter Price';
                                            }
                                            return null;
                                          },
                                          labelText: 'Price Product',
                                          decoration: const InputDecoration(
                                            border: InputBorder.none,
                                            hintText: 'Enter Price',
                                            contentPadding:
                                                EdgeInsets.symmetric(
                                                    horizontal: 15),
                                          ),
                                        ),
                                        const SizedBox(height: 20),
                                        GestureDetector(
                                          onTap: pickImageFromGallery,
                                          child: AbsorbPointer(
                                            child: TextFormField(
                                              controller: addProductController
                                                  .imageController.value,
                                              decoration: const InputDecoration(
                                                labelText: 'Image Path',
                                                hintText:
                                                    'Select an image from gallery',
                                                border: OutlineInputBorder(),
                                              ),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(height: 20),
                                        Obx(() {
                                          if (addProductController
                                              .loading.value) {
                                            return Container();
                                          } else {
                                            return ValueListenableBuilder<int?>(
                                              valueListenable:
                                                  _selectedClassificationId,
                                              builder: (context, value, child) {
                                                return DropdownButtonFormField<
                                                    int>(
                                                  value: value,
                                                  items: categoryViewController
                                                      .categoryList
                                                      .map((category) {
                                                    return DropdownMenuItem<
                                                        int>(
                                                      value: category.id,
                                                      child:
                                                          Text(category.name),
                                                    );
                                                  }).toList(),
                                                  onChanged: (newValue) {
                                                    _selectedClassificationId
                                                        .value = newValue;
                                                    addProductController
                                                        .classificationIdController
                                                        .value
                                                        .text = newValue.toString();
                                                  },
                                                  decoration:
                                                      const InputDecoration(
                                                    labelText:
                                                        'Name Classification',
                                                    hintText:
                                                        'Select Name Classification',
                                                    border:
                                                        OutlineInputBorder(),
                                                    contentPadding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 15),
                                                  ),
                                                  validator: (value) {
                                                    if (value == null) {
                                                      return 'You must enter classification';
                                                    }
                                                    return null;
                                                  },
                                                );
                                              },
                                            );
                                          }
                                        }),
                                        const SizedBox(height: 40),
                                        Obx(() {
                                          return addProductController
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
                                                      if (image != null) {
                                                        addProductController
                                                            .addProduct(image!);
                                                        Get.toNamed('/AddPage');
                                                      } else {
                                                        Get.snackbar('Error',
                                                            'Please select an image');
                                                      }
                                                    },
                                                    child: Text(
                                                      'Add',
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
                        child: Text(
                          'Add Product',
                          style: TextStyle(color: ColorApp.white),
                        ),
                      ),
                    ),
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.only(top: 100.0),
                      child: Container(
                        width: 150,
                        height: 150,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              ColorApp.BrownChocola,
                              ColorApp.beige,
                            ],
                          ),
                        ),
                        child: TextButton(
                          onPressed: () {
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
                                        horizontal: 30.0,
                                        vertical: 30.0,
                                      ),
                                      child: Column(
                                        children: [
                                          const Text(
                                            '_ Add Storehouse _',
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 20,
                                            ),
                                          ),
                                          const SizedBox(height: 20),
                                          TextFormField2(
                                            controller: addStorehouseController
                                                .nameController.value,
                                            validator: (value) {
                                              if (value.isEmpty) {
                                                return 'You must enter name';
                                              }
                                              return null;
                                            },
                                            labelText: 'Name Storehouse',
                                            decoration: const InputDecoration(
                                              border: InputBorder.none,
                                              hintText: 'Enter Name',
                                              contentPadding:
                                                  EdgeInsets.symmetric(
                                                      horizontal: 15),
                                            ),
                                          ),
                                          const SizedBox(height: 20),
                                          GestureDetector(
                                            onTap: pickImageFromGallery,
                                            child: AbsorbPointer(
                                              child: TextFormField(
                                                controller:
                                                    addStorehouseController
                                                        .imageController.value,
                                                decoration:
                                                    const InputDecoration(
                                                  labelText: 'Image Path',
                                                  hintText:
                                                      'Select an image from gallery',
                                                  border: OutlineInputBorder(),
                                                ),
                                              ),
                                            ),
                                          ),
                                          const SizedBox(height: 20),
                                          TextFormField2(
                                            controller: addStorehouseController
                                                .descConfController.value,
                                            validator: (value) {
                                              if (value.isEmpty) {
                                                return 'You must enter description';
                                              }
                                              return null;
                                            },
                                            labelText: 'Description Branch',
                                            decoration: const InputDecoration(
                                              border: InputBorder.none,
                                              hintText: 'Enter Description',
                                              contentPadding:
                                                  EdgeInsets.symmetric(
                                                      horizontal: 15),
                                            ),
                                          ),
                                          const SizedBox(height: 40),
                                          Obx(() {
                                            return addStorehouseController
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
                                                        if (image != null) {
                                                          addStorehouseController
                                                              .addStorehouse(
                                                                  image!);
                                                          Get.toNamed(
                                                              '/AddPage');
                                                        } else {
                                                          Get.snackbar('Error',
                                                              'Please select an image');
                                                        }
                                                      },
                                                      child: Text(
                                                        'Add',
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
                          child: Text(
                            'Add Storehouse',
                            style: TextStyle(color: ColorApp.white),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
