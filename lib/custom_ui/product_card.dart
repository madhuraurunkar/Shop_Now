import 'package:flutter/material.dart';
import 'package:shop_now/model/product.dart';

import '../screens/add_products_screen.dart';

class ProductCard extends StatefulWidget {
  const ProductCard({super.key, required this.product, required this.onTap});

  final Product product;
  final VoidCallback onTap;

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      color: widget.product.isAdded
          ? const Color.fromARGB(255, 205, 136, 217)
          : null,
      shape: StadiumBorder(),
      margin: EdgeInsets.symmetric(horizontal: 8, vertical: mq.height * .015),
      child: ListTile(
        contentPadding: EdgeInsets.only(
            left: mq.width * .05,
            top: mq.height * .01,
            bottom: mq.height * .01,
            right: mq.height * .01),
        leading: Image.asset('lib/images/${widget.product.image}'),
        title: Text(widget.product.title),
        subtitle: Text('₹ ${widget.product.price}.00'),
        trailing: widget.product.isAdded
            ? IconButton(
                onPressed: () {
                  widget.onTap();
                  setState(() {
                    widget.product.isAdded = false;
                  });
                },
                icon: Image.asset('lib/images/checkmark.png'))
            : ElevatedButton.icon(
                onPressed: () {
                  widget.onTap();
                  setState(() {
                    widget.product.isAdded = true;
                  });

                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text('Items Added Successfully!'),
                    behavior: SnackBarBehavior.floating,
                    backgroundColor: Colors.purple.shade300.withOpacity(.8),
                  ));
                },
                style: ElevatedButton.styleFrom(
                    elevation: 5, shape: const StadiumBorder()),
                icon: const Icon(Icons.shopping_cart_checkout_rounded),
                label: const Text('Add')),
      ),
    );
  }
}
