import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../shard/color_app/color_app.dart';

class Readyforsale extends StatefulWidget {
  const Readyforsale({super.key});

  @override
  State<Readyforsale> createState() => _ReadyforsaleState();
}

class _ReadyforsaleState extends State<Readyforsale> {
  List<String> product = [
    'dark chocolate bar',
    'extra dark chocolate',
    'dark chocolate with sea salt'
  ];
  List<String> tempArr = [];

  void _sendSelectedProducts() {
    if (tempArr.isNotEmpty) {
      // Implement your send logic here, for example, send data to a server or another screen
      Get.snackbar('Success', 'Selected products sent: ${tempArr.join(", ")}');
    } else {
      Get.snackbar('Error', 'No products selected');
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Products'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              // You can implement add functionality here
            },
          ),
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              TextField(
                onChanged: (value) {
                  // You can implement search functionality here
                },
                decoration: const InputDecoration(
                  labelText: 'Search Products',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: ListView.builder(
                  itemCount: product.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        setState(() {
                          if (tempArr.contains(product[index])) {
                            tempArr.remove(product[index]);
                          } else {
                            tempArr.add(product[index]);
                          }
                        });
                      },
                      child: Card(
                        child: ListTile(
                          title: Text(product[index]),
                          trailing: Container(
                            height: 40,
                            width: 100,
                            decoration: BoxDecoration(
                              color: tempArr.contains(product[index])
                                  ? ColorApp.darkYellow
                                  : ColorApp.whiteBrown,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                              child: Text(
                                tempArr.contains(product[index])
                                    ? 'remove'
                                    : 'add',
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _sendSelectedProducts,
                style: ElevatedButton.styleFrom(
                  backgroundColor: ColorApp.darkYellow,
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text(
                  'Send',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
