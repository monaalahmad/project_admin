import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/auth_controller/sign_up_controller.dart';
import '../../controller/get_branch/branch_controller.dart';
import '../../controller/get_branch/storehouse_controller.dart';
import '../../shard/static/auth.dart';
import '../../shard/static/buttom/text.dart';
import '../../shard/static/buttom/text_form_field.dart';

class UserPage extends StatefulWidget {
  const UserPage({Key? key}) : super(key: key);

  @override
  _UserPageState createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  final _formKey = GlobalKey<FormState>();
  final selectedBranchId = Rxn<int>();
  final selectedOption = ''.obs;

  final SignUpController controller = Get.put(SignUpController());
  final BranchController branchController = Get.put(BranchController());
  final StorehouseController storehouseController = Get.put(StorehouseController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Stack(
          children: [
            const BackWidghtLogin(),
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 200),
                    Center(
                      child: CustomText(
                        text: "33".tr,
                        size: 35,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.primaryContainer,
                      ),
                    ),
                    Center(
                      child: CustomText(
                        text: "34".tr,
                        size: 15,
                        fontWeight: FontWeight.normal,
                        color: Theme.of(context).colorScheme.primaryContainer,
                      ),
                    ),
                    const SizedBox(height: 15),
                    TextFormField2(
                      controller: controller.firstNameController.value,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(
                            color: Theme.of(context).colorScheme.primaryContainer,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Theme.of(context).colorScheme.primaryContainer,
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        hintText: '35'.tr,
                        hintStyle: const TextStyle(
                          color: Color(0XFF4D4C4C),
                        ),
                      ),
                      validator: (value) {
                        if (value!.isEmpty ||
                            !RegExp(r'^[a-zA-Z0-9]+$').hasMatch(value)) {
                          return '36'.tr;
                        } else {
                          return null;
                        }
                      },
                      labelText: '46'.tr,
                    ),
                    const SizedBox(height: 15),
                    TextFormField2(
                      controller: controller.emailController.value,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(
                            color: Theme.of(context).colorScheme.primaryContainer,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Theme.of(context).colorScheme.primaryContainer,
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        hintText: '20'.tr,
                        hintStyle: const TextStyle(
                          color: Color(0XFF4D4C4C),
                        ),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return '21'.tr;
                        } else {
                          return null;
                        }
                      },
                      labelText: '20'.tr,
                    ),
                    const SizedBox(height: 15),
                    TextFormField2(
                      controller: controller.phoneController.value,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(
                            color: Theme.of(context).colorScheme.primaryContainer,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Theme.of(context).colorScheme.primaryContainer,
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        hintText: '22'.tr,
                        hintStyle: const TextStyle(
                          color: Color(0XFF4D4C4C),
                        ),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return '23'.tr;
                        } else {
                          return null;
                        }
                      },
                      labelText: '44'.tr,
                    ),
                    const SizedBox(height: 15),
                    TextFormField2(
                      controller: controller.passwordController.value,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(
                            color: Theme.of(context).colorScheme.primaryContainer,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Theme.of(context).colorScheme.primaryContainer,
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        hintText: '44'.tr,
                        hintStyle: const TextStyle(
                          color: Color(0XFF4D4C4C),
                        ),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return '44'.tr;
                        } else {
                          return null;
                        }
                      },
                      labelText: '22'.tr,
                    ),
                    const SizedBox(height: 15),
                    Container(
                      width: MediaQuery.of(context).size.width ,
                      child: Obx(() => DropdownButtonFormField<String>(
                        value: selectedOption.value.isEmpty ? null : selectedOption.value,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(
                              color: Theme.of(context).colorScheme.primaryContainer,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Theme.of(context).colorScheme.primaryContainer,
                            ),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          hintText: 'Select Role',
                          hintStyle: const TextStyle(
                            color: Color(0XFF4D4C4C),
                          ),
                        ),
                        items: const [
                          DropdownMenuItem<String>(
                            value: 'admin',
                            child: Text('admin'),
                          ),
                          DropdownMenuItem<String>(
                            value: 'store',
                            child: Text('store'),
                          ),
                          DropdownMenuItem<String>(
                            value: 'storehouse',
                            child: Text('storehouse'),
                          ),
                        ],
                        onChanged: (newValue) {
                          selectedOption.value = newValue!;
                          controller.selectedOption.value = newValue;
                        },
                      )),
                    ),
                    const SizedBox(height: 20),
                    Container(
                      width: MediaQuery.of(context).size.width ,
                      child: Obx(() {
                        if (selectedOption.value == 'store') {
                          return Obx(() {
                            if (branchController.isLoading.value) {
                              return const CircularProgressIndicator();
                            } else if (branchController.branchList.isNotEmpty) {
                              return DropdownButtonFormField<int>(
                                value: selectedBranchId.value,
                                items: branchController.branchList.map((branch) {
                                  return DropdownMenuItem<int>(
                                    value: branch.id,
                                    child: Text(branch.name),
                                  );
                                }).toList(),
                                onChanged: (newValue) {
                                  selectedBranchId.value = newValue;
                                  controller.branchController.value = newValue.toString();
                                },
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide: BorderSide(
                                      color: Theme.of(context).colorScheme.primaryContainer,
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Theme.of(context).colorScheme.primaryContainer,
                                    ),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  hintText: 'Select Branch',
                                  hintStyle: const TextStyle(
                                    color: Color(0XFF4D4C4C),
                                  ),
                                ),
                                validator: (value) {
                                  if (value == null) {
                                    return 'You must select a branch';
                                  }
                                  return null;
                                },
                              );
                            } else {
                              return const Text('No branches available');
                            }
                          });
                        }
                        else if(selectedOption.value == 'storehouse'){
                          return Obx(() {
                            if (storehouseController.isLoading.value) {
                              return const CircularProgressIndicator();
                            } else if (storehouseController.storehouseList.isNotEmpty) {
                              return DropdownButtonFormField<int>(
                                value: selectedBranchId.value,
                                items: storehouseController.storehouseList.map((storehouse) {
                                  return DropdownMenuItem<int>(
                                    value: storehouse.id,
                                    child: Text(storehouse.name ),
                                  );
                                }).toList(),
                                onChanged: (newValue) {
                                  selectedBranchId.value = newValue;
                                  controller.branchController.value = newValue.toString();
                                },
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide: BorderSide(
                                      color: Theme.of(context).colorScheme.primaryContainer,
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Theme.of(context).colorScheme.primaryContainer,
                                    ),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  hintText: 'Select Storehouse',
                                  hintStyle: const TextStyle(
                                    color: Color(0XFF4D4C4C),
                                  ),
                                ),
                                validator: (value) {
                                  if (value == null) {
                                    return 'You must select a storehouse';
                                  }
                                  return null;
                                },
                              );
                            } else {
                              return const Text('No storehouse available');
                            }
                          });
                        }
                        else {
                          return Container(); // Hide the dropdown if 'admin' is selected or any other default case
                        }
                      }),
                    ),
                    const SizedBox(height: 20),
                    Center(
                      child: Obx(() {
                        return controller.loading.value
                            ? const CircularProgressIndicator()
                            : Container(
                          width: 300,
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Theme.of(context).colorScheme.primary,
                          ),
                          child: TextButton(
                            onPressed: () async {
                              if (_formKey.currentState!.validate()) {
                                controller.signUpApi();
                              }
                            },
                            child: Text(
                              '39'.tr,
                              style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        );
                      }),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
