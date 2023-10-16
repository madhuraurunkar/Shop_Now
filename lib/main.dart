import 'package:flutter/material.dart';
import 'package:shop_now/screens/add_products_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Shop Now',
      theme: ThemeData(primarySwatch: Colors.purple),
      home: const AddProductsScreen(),
    );
  }
}
