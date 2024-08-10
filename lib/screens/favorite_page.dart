import 'package:flutter/material.dart';
import 'package:plant_app/models/plant.dart';
import 'package:plant_app/widgets/plant_widget.dart';

class FavoritePage extends StatefulWidget {
  final List<Plant> favotitePlants;
  const FavoritePage({
    super.key,
    required this.favotitePlants,
  });

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: widget.favotitePlants.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 100,
                    child: Image.asset("assets/images/favorited.png"),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "!‌ظاهرا به هیچی علاقه نداشتی",
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
                itemCount: widget.favotitePlants.length,
                itemBuilder: (context, index) {
                  return NewPlantWidget(
                    plantList: widget.favotitePlants,
                    index: index,
                  );
                },
              ),
            ),
    );
  }
}
