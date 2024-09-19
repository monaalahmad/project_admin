import 'package:flutter/material.dart';
import '../../shard/color_app/color_app.dart';
import 'package:get/get.dart';
class CDrawerStorehouse extends StatefulWidget {
  @override
  _CDrawerStorehouseState createState() => _CDrawerStorehouseState();
}

class _CDrawerStorehouseState extends State<CDrawerStorehouse>
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
                Get.toNamed("/HomePageStore");
              },
              icon: const Icon(Icons.home),
            ),
            title: const Text("H o m e" , style: TextStyle(fontSize: 18),),
          ),
          ListTile(
            leading: IconButton(
              onPressed: () {
                Get.toNamed("/ClassificationStorehouseView");
              },
              icon: const Icon(Icons.add),
            ),
            title: const Text("A d d P r o d u c t" , style: TextStyle(fontSize: 18),),
          ),
          ListTile(
            leading: IconButton(
              onPressed: () {
                Get.toNamed("/SettingPage");
              },
              icon: const Icon(Icons.settings),
            ),
            title: const Text("S e t t i n g" , style: TextStyle(fontSize: 18),),
          ),
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
