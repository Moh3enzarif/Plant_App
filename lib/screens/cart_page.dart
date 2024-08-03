import 'package:flutter/material.dart';
import 'package:plant_app/models/plant.dart';

class CartPage extends StatefulWidget {
  final List<Plant> addtoCartPlants;
  const CartPage({
    super.key,
    required this.addtoCartPlants,
  });

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Hello"),
      ),
    );
  }
}
