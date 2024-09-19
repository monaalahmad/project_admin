import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../shard/color_app/color_app.dart';

class AddPageStorehouse extends StatefulWidget {
  const AddPageStorehouse({super.key});

  @override
  State<AddPageStorehouse> createState() => _AddPageStorehouseState();
}

class _AddPageStorehouseState extends State<AddPageStorehouse> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0 , vertical: 40.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  color: ColorApp.BrownChocola,
                  width: MediaQuery.of(context).size.width / 2.5,
                  child: TextButton(
                    onPressed: () {
                      showModalBottomSheet(
                        backgroundColor: Colors.transparent,
                        context: context,
                        builder: (BuildContext context) {
                          return Center(
                            child: Container(
                              height: 600,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(30),
                                  topRight: Radius.circular(30),
                                ),
                                gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    ColorApp.green,
                                    ColorApp.darkBrown,
                                  ],
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 30.0,
                                  vertical: 30.0,
                                ),
                                child: Column(
                                  children: [
                                    Text(
                                      '_ Add Product _',
                                      style: TextStyle(
                                        color: ColorApp.white,
                                        fontSize: 20,
                                      ),
                                    ),
                                    const SizedBox(height: 20),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    },

                    child: Text('Add Product' , style: TextStyle(color: ColorApp.white),),
                  ),
                ),
                const Spacer(),
                Container(
                  color: ColorApp.BrownChocola,
                  width: MediaQuery.of(context).size.width / 2.5,
                  child: TextButton(
                    onPressed: () {

                    },
                    child: Text('Add Product' , style: TextStyle(color: ColorApp.white),),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
