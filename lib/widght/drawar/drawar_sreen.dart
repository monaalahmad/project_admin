// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '../../shared/color_app/color_app.dart';
// import 'drwar_list.dart';
//
// class Drawar extends StatelessWidget {
//   final BuildContext context;
//
//   const Drawar({super.key, required this.context});
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Drawer(
//       backgroundColor: Theme.of(context).colorScheme.background,
//       child: Column(
//         children: [
//           SizedBox(
//             height: 180,
//             width: double.infinity,
//             child: DrawerHeader(
//               child: Text(
//                 '1'.tr,
//                 style: TextStyle(
//                   fontSize: 25,
//                   fontWeight: FontWeight.bold,
//                   color: ColorApp.white,
//                   fontFamily: 'Poppins',
//                 ),
//               ),
//               decoration: BoxDecoration(
//                 color: Theme.of(context).colorScheme.primary,
//                 borderRadius:const BorderRadius.only(
//                   bottomLeft: Radius.circular(15),
//                   bottomRight: Radius.circular(15),
//                 ),
//               ),
//             ),
//           ),
//           DrawerList(
//             title: "4".tr,
//             press: (){
//               Get.offAllNamed("/HomePage");
//             },
//             icon:const Icon(Icons.home),
//           ),
//           DrawerList(
//             icon:const Icon(Icons.person_sharp),
//             title: "45".tr,
//             press: (){
//               Get.toNamed('/ProfileScreen');
//             },
//           ),
//           DrawerList(
//             icon:const Icon(Icons.settings),
//             title: "5".tr,
//             press: (){
//               Get.toNamed('/Setting');
//             },
//           ),
//           DrawerList(
//             icon:const Icon(Icons.info_outline_rounded),
//             title: "7".tr,
//             press: (){
//               Get.toNamed('/AboutApp');
//             },
//           ),
//           const Spacer(),
//           Image.asset("assets/images/onboarding3.jpg"),
//         ],
//       ),
//     );
//   }
// }
