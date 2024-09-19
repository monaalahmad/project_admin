import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/store_controller/add_controller/add_quantity_product_controller.dart';
import '../../../shard/static/buttom/buttom.dart';
import '../../../shard/static/buttom/text_form_field.dart';
import 'package:intl/intl.dart';
class AddQuantityStore extends StatefulWidget {
  final int productId;

  AddQuantityStore({super.key, required this.productId});

  @override
  State<AddQuantityStore> createState() => _AddQuantityStoreState();
}

class _AddQuantityStoreState extends State<AddQuantityStore> {
  final _formKey = GlobalKey<FormState>();
  final addQuantityProductStoreController =
  Get.put(AddQuantityProductStoreController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Receive a product'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField2(
                  controller: addQuantityProductStoreController.quantityController.value,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the quantity';
                    }
                    return null;
                  },
                  labelText: 'Quantity',
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(color: Theme.of(context).colorScheme.primaryContainer,)),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color:  Theme.of(context).colorScheme.primaryContainer,),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    hintText: 'Quantity',
                    hintStyle:const TextStyle(
                      color: Color(0XFF4D4C4C),                            ),
                  ),
                ),
                const SizedBox(height: 16.0),
                TextFormField(
                  controller: addQuantityProductStoreController.endDateController.value,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the end date';
                    }
                    return null;
                  },
                  onTap: () async {
                    final DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime.now(),
                      lastDate: DateTime(2100),
                    );
                    if (pickedDate != null) {
                      String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
                      addQuantityProductStoreController.endDateController.value.text = formattedDate;
                    }
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(color: Theme.of(context).colorScheme.primaryContainer),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Theme.of(context).colorScheme.primaryContainer),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    hintText: 'End Date',
                    hintStyle: const TextStyle(
                      color: Color(0XFF4D4C4C),
                    ),
                  ),
                ),
                const SizedBox(height: 16.0),
                Center(
                  child: Obx(() {
                    return addQuantityProductStoreController.loading.value
                        ? const CircularProgressIndicator()
                        : Button(
                      text: 'Send',
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          await addQuantityProductStoreController
                              .addQuantityProductStore(widget.productId);
                        }
                      },
                      width: 180,
                      height: 50,
                      color: Theme.of(context).colorScheme.primary,
                      radius: 0.0,
                    );
                  }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}