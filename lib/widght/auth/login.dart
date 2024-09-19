import 'package:flutter/material.dart';
import '../../controller/auth_controller/login_controller.dart';

import '../../shard/static/auth.dart';
import '../../shard/static/buttom/buttom.dart';
import '../../shard/static/buttom/text.dart';
import '../../shard/static/buttom/text_form_field.dart';
import 'forgot_pass.dart';
import 'package:get/get.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}
class _LoginPageState extends State<LoginPage> {

  LoginController controller = Get.put(LoginController());

  var _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formkey,
        child: Stack(
          children: [
            const BackWidghtLogin(),
            SingleChildScrollView(
              child: Flexible(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 50,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 300,
                      ),
                      CustomText(
                        text: '19'.tr,
                        size: 35,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.primaryContainer,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
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
                          hintStyle:const TextStyle(
                            color: Color(0XFF4D4C4C),                            ),
                        ),
                          validator: (value) {
                            if (value!.isEmpty ||
                                !RegExp(r'^[a-z A-Z 0-9]+$')
                                    .hasMatch(value!)) {
                              return '21'.tr;
                            } else {
                              return null;
                            }
                          },
                        labelText: '20'.tr,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField2(
                        controller: controller.passwordController.value,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(color: Theme.of(context).colorScheme.primaryContainer,)),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color:  Theme.of(context).colorScheme.primaryContainer,),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          hintText: '22'.tr,
                          hintStyle:const TextStyle(
                            color: Color(0XFF4D4C4C),                            ),
                        ),
                        validator: (value) {
                          if (value!.isEmpty ||
                              !RegExp(r'^[a-z A-Z 0-9]+$')
                                  .hasMatch(value!)) {
                            return '23'.tr;
                          } else {
                            return null;
                          }
                        },
                        labelText: '22'.tr,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Center(
                        child: Obx(() {
                          return controller.loading.value ? const CircularProgressIndicator() : Center(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10.0),
                              child: Button(
                                text: '19'.tr,
                                onPressed: () async {
                                  controller.loginApi();
                                },
                                width: 260,
                                height: 50,
                                color: Theme.of(context).colorScheme.primary,
                                radius: 0.0,
                              ),
                            ),
                          );
                        }),
                      ),
                      Container(
                        padding: const EdgeInsets.only(left: 159),
                        child: TextButton(
                          onPressed: ()  {
                            Get.toNamed('/ForgotPass');
                          },
                          child: Text(
                            '24'.tr,
                            style: TextStyle(
                              fontSize: 13,
                              color: Theme.of(context).colorScheme.primaryContainer,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}