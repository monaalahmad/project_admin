import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../shard/color_app/color_app.dart';
import '../../../shard/static/buttom/buttom.dart';

class catReadyScreen extends StatefulWidget {
  const catReadyScreen({super.key});

  @override
  State<catReadyScreen> createState() => _catReadyScreenState();
}

class _catReadyScreenState extends State<catReadyScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Catgories'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              onChanged: (value) {
              },
              decoration: InputDecoration(
                labelText: 'Search category',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            const SizedBox(height: 20,),
            Row(
              children: [
                Container(
                    width: MediaQuery.of(context).size.width /2.5,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: ColorApp.BrownChocola,
                    ),
                    child: TextButton(
                        onPressed: (){},
                        child:const Text('Test' , style: TextStyle(color: Colors.white,),))),
                const SizedBox(width: 20,),
                Container(
                    width: MediaQuery.of(context).size.width /2.5,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: ColorApp.BrownChocola,
                    ),
                    child: TextButton(
                        onPressed: (){},
                        child:const Text('Ready Sale' , style: TextStyle(color: Colors.white,),))),
              ],
            ),
            const SizedBox(height: 20,),
            const Center(
                child: Text(
                  'Please select a category' ,
                  style: TextStyle(
                      fontSize: 25 ,
                      fontWeight: FontWeight.bold),
                ),
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Button(
                  height: 150,
                  width: 150,
                  radius: 20,
                  color: ColorApp.brown,
                  text: 'dark chocolate',
                  onPressed: () {
                    Get.toNamed('/Readyforsale');
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                Button(
                  height: 150,
                  width: 150,
                  radius: 10,
                  color: ColorApp.brown,
                  text: 'milk chocolate',
                  onPressed: () {
                    Get.toNamed('/Readyforsale');
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
