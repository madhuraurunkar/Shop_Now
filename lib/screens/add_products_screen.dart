import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shop_now/custom_ui/product_card.dart';
import 'package:shop_now/model/product.dart';
import 'package:shop_now/screens/shopping_cart_screen.dart';

late Size mq;

class AddProductsScreen extends StatefulWidget {
  const AddProductsScreen({super.key});

  @override
  State<AddProductsScreen> createState() => _AddProductsScreenState();
}

class _AddProductsScreenState extends State<AddProductsScreen> {
  final List<Product> productList = [
    Product(title: 'Earphones', price: '699', image: 'airpods.png'),
    Product(title: 'SkinCare', price: '1000', image: 'beauty.png'),
    Product(title: 'Diamond', price: '50000', image: 'diamond.png'),
    Product(title: 'Tea-Masala', price: '100', image: 'green-tea.png'),
    Product(title: 'Hoodie', price: '500', image: 'hoodie.png'),
    Product(title: 'Sneakers', price: '2000', image: 'sneakers.png'),
    Product(title: 'Sunglasses', price: '999', image: 'googles.png'),
    Product(title: 'Black Sunglasses', price: '399', image: 'sunglasses.png'),
    Product(title: 'Water-bottle', price: '200', image: 'water-bottle.png'),
    Product(title: 'WristWatch', price: '799', image: 'wristwatch.png'),
  ];

  @override
  Widget build(BuildContext context) {
    mq = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Add Products",
        ),
        centerTitle: true,
        leading: const Icon(CupertinoIcons.home),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => ShoppingCartScreen(
                            productList: productList
                                .where((e) => e.isAdded == true)
                                .toList()))).then((value) {
                  setState(() {
                    productList;
                  });
                });
              },
              icon: const Icon(Icons.shopping_cart)),
        ],
      ),
      floatingActionButton: SizedBox(
        width: mq.width * .5,
        height: mq.height * .1,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.center,
              child: FloatingActionButton.extended(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => ShoppingCartScreen(
                                productList: productList
                                    .where((e) => e.isAdded == true)
                                    .toList()))).then((value) {
                      setState(() {
                        productList;
                      });
                    });
                  },
                  label: const Text('Open cart'),
                  icon: const Icon(Icons.shopping_cart)),
            ),
            Positioned(
              top: 0,
              right: mq.width * .025,
              child: MaterialButton(
                  elevation: 0,
                  onPressed: () {},
                  color: Color.fromARGB(255, 205, 136, 217),
                  padding: EdgeInsets.all(15),
                  minWidth: 0,
                  shape: CircleBorder(),
                  child: Text('${productList.where((e) => e.isAdded).length}',
                      style: TextStyle(color: Colors.white))),
            )
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: ListView.builder(
        itemCount: productList.length,
        itemBuilder: (context, index) {
          return ProductCard(
            product: productList[index],
            onTap: () {
              setState(() {
                productList;
              });
            },
          );
        },
      ),
    );
  }
}
