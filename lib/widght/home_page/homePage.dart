import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../shard/color_app/color_app.dart';
import '../manfment_widght/view_widght/category_view.dart';
import 'drawar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorApp.BrownChocoleat,
        elevation: 0.0,
        title: Text(
          'Admin',
          style: TextStyle(
            color: ColorApp.white,
          ),
        ),
      ),
      drawer: MyDrawer(),
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              "assets/images/download.jfif",
              fit: BoxFit.fill,
            )
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 150,
                  decoration: BoxDecoration(
                    color: ColorApp.BrownChocola,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: TextButton(
                    onPressed: () {
                      Get.toNamed('/BranchView');
                    },
                    child: Text(
                      'View Branch',
                      style: TextStyle(
                        color: ColorApp.white,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  width: 150,
                  decoration: BoxDecoration(
                    color: ColorApp.BrownChocola,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: TextButton(
                    onPressed: () {
                      Get.toNamed('/ClassificationView');
                    },
                    child: Text(
                      'View Classification',
                      style: TextStyle(
                        color: ColorApp.white,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  width: 150,
                  decoration: BoxDecoration(
                    color: ColorApp.BrownChocola,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: TextButton(
                    onPressed: () {
                      Get.to(() => CategoryView());
                    },
                    child: Text(
                      'View Category',
                      style: TextStyle(
                        color: ColorApp.white,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  width: 150,
                  decoration: BoxDecoration(
                    color: ColorApp.BrownChocola,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: TextButton(
                    onPressed: () {
                      Get.toNamed('/ProductView');
                    },
                    child: Text(
                      'View Product',
                      style: TextStyle(
                        color: ColorApp.white,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  width: 150,
                  decoration: BoxDecoration(
                    color: ColorApp.BrownChocola,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: TextButton(
                    onPressed: () {
                      Get.toNamed('/StorehouseView');
                    },
                    child: Text(
                      'View Storehouse',
                      style: TextStyle(
                        color: ColorApp.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
