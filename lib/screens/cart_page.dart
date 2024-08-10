import 'package:flutter/material.dart';
import 'package:plant_app/models/plant.dart';
import 'package:plant_app/widgets/plant_widget.dart';

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
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: widget.addtoCartPlants.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 100,
                    child: Image.asset("assets/images/add-cart.png"),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "هنوز قصد خرید نداری؟",
                    textDirection: TextDirection.ltr,
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                      fontFamily: "Muli",
                    ),
                  ),
                ],
              ),
            )
          : Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 30,
              ),
              height: size.height * 0.5,
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: widget.addtoCartPlants.length,
                itemBuilder: (context, index) {
                  return NewPlantWidget(
                    plantList: widget.addtoCartPlants,
                    index: index,
                  );
                },
              ),
            ),
    );
  }
}
