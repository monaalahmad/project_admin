import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/auth_controller/code_controller.dart';
import '../../shard/static/auth.dart';
import '../../shard/static/buttom/buttom.dart';
import '../../shard/static/buttom/text.dart';
import '../../shard/static/buttom/text_form_field.dart';


class ForgotCode extends StatefulWidget {
  @override
  _ForgotCodeState createState() => _ForgotCodeState();
}

class _ForgotCodeState extends State<ForgotCode> {
  var _formkey = GlobalKey<FormState>();

  CodeController controller = Get.put(CodeController());


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
                                text:"29".tr,
                                size: 20,
                                color: Theme.of(context).colorScheme.primaryContainer,
                                fontWeight: FontWeight.bold,
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              CustomText(
                                text : "30".tr,
                                size: 16,
                                color: Theme.of(context).colorScheme.primaryContainer,
                                fontWeight: FontWeight.normal,
                              ),
                              const SizedBox(height: 80,),
                              TextFormField2(
                                controller: controller.codeController.value,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20),
                                      borderSide: BorderSide(
                                        color: Theme.of(context).colorScheme.primaryContainer,
                                      )),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Theme.of(context).colorScheme.primaryContainer,
                                    ),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  hintText: '31'.tr,
                                  hintStyle:const TextStyle(
                                    color: Color(0XFF4D4C4C),
                                  ),
                                ),
                                validator: (value) {
                                  if (value!.isEmpty ||
                                      !RegExp(r'^[a-z A-Z 0-9]+$')
                                          .hasMatch(value!)) {
                                    return '32'.tr;
                                  } else {
                                    return null;
                                  }
                                },
                                labelText: '31'.tr,
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
                                      onPressed: (){
                                        controller.ForgetCode();
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
