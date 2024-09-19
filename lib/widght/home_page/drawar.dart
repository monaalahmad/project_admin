import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import '../../local/local_controller.dart';
import '../../shard/color_app/color_app.dart';
import '../../theme/theme_provider.dart';
import '../drawar/drwar_list.dart';

class MyDrawer extends StatefulWidget {
  @override
  _MyDrawerState createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: Column(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: ColorApp.whiteBrown,
              borderRadius: const BorderRadius.only(
                  bottomRight: Radius.circular(20),
                  bottomLeft: Radius.circular(20)),
            ),
            child: Container(
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image:
                      AssetImage('assets/images/photo_2024-06-30_11-23-30.jpg'),
                  fit: BoxFit.fitHeight,
                ),
              ),
            ),
          ),
          ListTile(
            leading: IconButton(
              onPressed: () {
                Get.toNamed("/HomePage");
              },
              icon: const Icon(Icons.home),
            ),
            title: const Text("H o m e" , style: TextStyle(fontSize: 18),),
          ),
          ListTile(
            leading: IconButton(
              onPressed: () {
                Get.toNamed("/AddPage");
              },
              icon: const Icon(Icons.add),
            ),
            title: const Text("A d d", style: TextStyle(fontSize: 18),),
          ),
          ListTile(
            leading: IconButton(
              onPressed: () {
                Get.toNamed("/SettingPage");
              },
              icon: const Icon(Icons.settings),
            ),
            title: const Text("S e t t i n g s" , style: TextStyle(fontSize: 18),),
          ),
          // Padding(
          //   padding: const EdgeInsets.symmetric(horizontal: 16.0),
          //   child: DrawerList(
          //       title: '8'.tr,
          //       icon:const Icon(
          //         Icons.dark_mode_rounded,
          //         color: Colors.grey,
          //         // color: Theme.of(context).colorScheme.primaryContainer,
          //       ),
          //       press: () {
          //         Provider.of<ThemeProvider>(context , listen: false).toggleTheme();
          //       }
          //   ),
          // ),
          // Padding(
          //   padding:const EdgeInsets.symmetric(horizontal: 32.0),
          //   child: Row(
          //     children: [
          //       const Icon(Icons.language , color: Colors.grey,),
          //       const SizedBox(width: 30,),
          //       Expanded(
          //         child: DropdownButton<String>(
          //           value: MyLocaleController.sharedPreferences?.getString("lang") ?? 'en',
          //           items: const [
          //             DropdownMenuItem(
          //               value: "en",
          //               child: Text('English' , style: TextStyle(fontSize: 18),),
          //             ),
          //             DropdownMenuItem(
          //               value: "ar",
          //               child: Text('Arabic' , style: TextStyle(fontSize: 18),),
          //             ),
          //           ],
          //           onChanged: (newValue) {
          //             MyLocaleController.changeLanguage(newValue!);
          //           },
          //           icon: null,
          //         ),
          //       ),
          //     ],
          //   ),
          // ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.only(bottom: 0.0),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: double.infinity,
                height: 225,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/drawar.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
