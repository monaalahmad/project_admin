import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/auth_controller/forget_password_controller.dart';
import '../../shard/static/auth.dart';
import '../../shard/static/buttom/buttom.dart';
import '../../shard/static/buttom/text.dart';
import '../../shard/static/buttom/text_form_field.dart';


class ForgotPass extends StatefulWidget {
  @override
  _ForgotPassState createState() => _ForgotPassState();
}

class _ForgotPassState extends State<ForgotPass> {
  var _formkey = GlobalKey<FormState>();

  forgetPassController controller = Get.put(forgetPassController());

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
                        text: "27".tr,
                        size: 20,
                        color: Theme.of(context).colorScheme.primaryContainer,
                        fontWeight: FontWeight.bold,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomText(
                        text:
                        "28".tr,
                        size: 16,
                        color: Theme.of(context).colorScheme.primaryContainer,
                        fontWeight: FontWeight.normal,
                      ),
                      const SizedBox(
                        height: 80,
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
                      Center(
                        child: Obx(() {
                          return controller.loading.value ? const CircularProgressIndicator() : ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Button(
                              text: '2'.tr,
                              onPressed: () {
                                controller.forgetPassApi();
                              },
                              width: 260,
                              height: 50,
                              color: Theme.of(context).colorScheme.primary,
                              radius: 0.0,
                            ),
                          );
                        }),
                      ),
                      const SizedBox(
                        height: 100,
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
