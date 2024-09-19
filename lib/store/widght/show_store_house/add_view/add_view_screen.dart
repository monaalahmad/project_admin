import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../shard/color_app/color_app.dart';
import '../../../../shard/static/buttom/buttom.dart';
import '../../../../shard/static/buttom/text_form_field.dart';

class AddDiscountScreen extends StatefulWidget {
  const AddDiscountScreen({super.key});

  @override
  State<AddDiscountScreen> createState() => _AddDiscountScreenState();
}

class _AddDiscountScreenState extends State<AddDiscountScreen> {
  TextEditingController priceController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController newpriceController = TextEditingController();
  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorApp.beige,
      appBar: AppBar(
        title: const Text('Add Discount'),
      ),
      body: Center(
        child: SingleChildScrollView( // This helps in scrolling if the keyboard comes up
          child: Form(
            key: _formkey,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Please add sale to a product',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 25),
                    TextFormField2(
                      controller: nameController,
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'You must enter product';
                        }
                        return null;
                      },
                      labelText: 'Product Name',
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        hintText: 'Enter Name',
                        contentPadding:const EdgeInsets.symmetric(horizontal: 15),
                      ),
                    ),
                    const SizedBox(height: 18),
                    TextFormField2(
                      controller: priceController,
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'You must enter old price';
                        }
                        return null;
                      },
                      labelText: 'Old Price',
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        hintText: 'Enter old price',
                        contentPadding:const EdgeInsets.symmetric(horizontal: 15),
                      ),
                    ),
                    const SizedBox(height: 18),
                    TextFormField2(
                      controller: newpriceController,
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'You must enter new price';
                        }
                        return null;
                      },
                      labelText: 'New Price',
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        hintText: 'Enter new price',
                        contentPadding:const EdgeInsets.symmetric(horizontal: 15),
                      ),
                    ),
                    const SizedBox(height: 50),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: Button(
                        text: 'Add',
                        width: 260,
                        height: 50,
                        color: Theme.of(context).colorScheme.primary,
                        radius: 0.0,
                        onPressed: () {
                          if (_formkey.currentState!.validate()) {
                            Get.snackbar('Success', 'Discount added successfully');
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
