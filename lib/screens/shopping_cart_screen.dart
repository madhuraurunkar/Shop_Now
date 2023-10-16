import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shop_now/model/product.dart';

import '../custom_ui/product_card.dart';

class ShoppingCartScreen extends StatelessWidget {
  const ShoppingCartScreen({super.key, required this.productList});

  final List<Product> productList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Shopping Cart",
        ),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () {},
          label: const Text('Buy Now'),
          icon: const Icon(Icons.shopping_cart_checkout_rounded)),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: ListView.builder(
        itemCount: productList.length,
        itemBuilder: (context, index) {
          return ProductCard(
            product: productList[index],
            onTap: () {},
          );
        },
      ),
    );
  }
}
