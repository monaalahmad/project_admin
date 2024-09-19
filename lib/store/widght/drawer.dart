import 'package:flutter/material.dart';
import 'package:project_admin/store/widght/show_store_house/add_view/add_view_screen.dart';
import 'package:project_admin/store/widght/show_store_house/add_view/show_view_screen.dart';
import 'package:project_admin/store/widght/show_store_house/show_storehouse.dart';
import '../../shard/color_app/color_app.dart';
import 'package:get/get.dart';
class CDrawer extends StatefulWidget {
  @override
  _CDrawerState createState() => _CDrawerState();
}

class _CDrawerState extends State<CDrawer>
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
                Get.toNamed("/ClassificationStoreView");
              },
              icon: const Icon(Icons.add),
            ),
            title: const Text("A d d P r o d u c t" , style: TextStyle(fontSize: 18),),
          ),
          ListTile(
            leading: IconButton(
              onPressed: () {
                Get.to(() =>const ShowWarehouse());
              },
              icon: const Icon(Icons.request_page),
            ),
            title: const Text("S u b m i t R e q u e s t" , style: TextStyle(fontSize: 18),),
          ),
          ListTile(
            leading: IconButton(
              onPressed: () {
                Get.to(() =>const AddDiscountScreen());
              },
              icon: const Icon(Icons.add_box_sharp),
            ),
            title: const Text("a d d D i s c o u n t" , style: TextStyle(fontSize: 18),),
          ),
          ListTile(
            leading: IconButton(
              onPressed: () {
                Get.to(() =>const DiscountScreen());
              },
              icon: const Icon(Icons.view_list),
            ),
            title: const Text("v i e w D i s c o u n t" , style: TextStyle(fontSize: 18),),
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
