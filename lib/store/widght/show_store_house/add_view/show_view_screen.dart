import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../../shard/color_app/color_app.dart';


class DiscountScreen extends StatefulWidget {
  const DiscountScreen({super.key});

  @override
  State<DiscountScreen> createState() => _DiscountScreenState();
}

class _DiscountScreenState extends State<DiscountScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('view discount'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: GridView.count(
          childAspectRatio: 1 / 1.3,
          physics:const NeverScrollableScrollPhysics(),
          crossAxisCount: 2,
          crossAxisSpacing: 3.0,
          mainAxisSpacing: 3.0,
          shrinkWrap: true,
          children: List.generate(Product.products.length, (index) {
            return Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), color: Colors.white),
              child: Card(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image(
                        image: AssetImage(
                          Product.products[index].imageUrl,
                        ),
                        fit: BoxFit.cover,
                        width: double.infinity,
                        height: 150,
                      ),
                      Text(
                        Product.products[index].name,
                        style: TextStyle(color: ColorApp.Black , fontSize: 17),
                      ),
                      Text(
                        '\$${Product.products[index].price}',
                        style: TextStyle(color: ColorApp.Black),
                      ),
                      Text(
                        '\$${Product.products[index].newprice}',
                        style: TextStyle(color: Colors.red),
                      ),
                    ]),
              ),
            );
          }),
        ),
      ),
    );
  }
}

class Product {
  final String name;
  final double price;
  final double newprice;
  final String imageUrl;
  Product(
      {required this.name,
        required this.price,
        required this.newprice,
        required this.imageUrl});
  @override
  List<Object?> get props => [
    name,
    price,
    newprice,
  ];
  static List<Product> products = [
    Product(
        name: 'dark chocolate bar',
        price: 100.00,
        newprice: 90.0,
        imageUrl: 'assets/images/image1.png'),
    Product(
        name: 'extra dark chocolate ',
        price: 200.00,
        newprice: 150.0,
        imageUrl: 'assets/images/download (13).jfif'),
    Product(
        name: 'dark chocolate with beans',
        price: 60.00,
        newprice: 50.0,
        imageUrl: 'assets/images/download.jpg'),
  ];
}
