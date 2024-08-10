import 'package:flutter/material.dart';
import 'package:plant_app/const/constants.dart';
import 'package:plant_app/models/plant.dart';
import 'package:plant_app/widgets/extention.dart';

class DetailPage extends StatefulWidget {
  final int plantID;
  const DetailPage({
    super.key,
    required this.plantID,
  });

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  bool toggleIsSelected(bool isFavorited) {
    return !isFavorited;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    List<Plant> plantlist = Plant.plantList;
    return Scaffold(
      body: Stack(
        children: [
          // AppBar
          Positioned(
            top: 50,
            left: 20,
            right: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Constants.primaryColor.withOpacity(0.15),
                    ),
                    child: Icon(
                      Icons.close,
                      color: Constants.primaryColor,
                    ),
                  ),
                ),
                Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Constants.primaryColor.withOpacity(0.15),
                  ),
                  child: Icon(
                    plantlist[widget.plantID].isFavorated == true
                        ? Icons.favorite
                        : Icons.favorite_border,
                    color: Constants.primaryColor,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 100,
            right: 20,
            left: 20,
            child: Container(
              width: size.width * 0.8,
              height: size.height * 0.8,
              padding: const EdgeInsets.all(20),
              child: Stack(
                children: [
                  //This is for image of products
                  Positioned(
                    top: 10,
                    left: 0,
                    child: SizedBox(
                        height: 350,
                        child: Image.asset(plantlist[widget.plantID].imageURL)),
                  ),
                  //This is for PlantFeature
                  Positioned(
                    top: 10,
                    right: 0,
                    child: SizedBox(
                      height: 200,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          PlantFeature(
                            title: "اندازه گیاه",
                            plantFeature: plantlist[widget.plantID].size,
                          ),
                          PlantFeature(
                            title: "رطوبت‌هوا",
                            plantFeature: plantlist[widget.plantID]
                                .humidity
                                .toString()
                                .farsiNumber,
                          ),
                          PlantFeature(
                            title: "دمای‌نگهداری",
                            plantFeature: plantlist[widget.plantID]
                                .temperature
                                .farsiNumber,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            left: 0,
            child: Container(
              padding: const EdgeInsets.only(top: 80, right: 30, left: 30),
              height: size.height * 0.5,
              width: size.width,
              decoration: BoxDecoration(
                color: Constants.primaryColor.withOpacity(0.5),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.star,
                            color: Constants.primaryColor,
                            size: 30,
                          ),
                          Text(
                            plantlist[widget.plantID]
                                .rating
                                .toString()
                                .farsiNumber,
                            style: TextStyle(
                                color: Constants.primaryColor,
                                fontFamily: "Muli",
                                fontSize: 22,
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            plantlist[widget.plantID].plantName,
                            style: TextStyle(
                                color: Constants.primaryColor,
                                fontFamily: "Muli",
                                fontSize: 28,
                                fontWeight: FontWeight.w900),
                          ),
                          const SizedBox(height: 10),
                          Row(
                            children: [
                              SizedBox(
                                height: 20,
                                child: Image.asset(
                                    "assets/images/PriceUnit-green.png"),
                              ),
                              const SizedBox(width: 10),
                              Text(
                                plantlist[widget.plantID].price.toString(),
                                style: TextStyle(
                                    color: Constants.primaryColor,
                                    fontFamily: "Muli",
                                    fontSize: 26,
                                    fontWeight: FontWeight.w900),
                              ),
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                  const SizedBox(height: 15),
                  Text(
                    plantlist[widget.plantID].decription,
                    textDirection: TextDirection.rtl,
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      fontFamily: "Muli",
                      color: Colors.black.withOpacity(0.7),
                      height: 1.6,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: SizedBox(
        width: size.width * 0.9,
        height: 50,
        child: Row(
          children: [
            Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                color: Constants.primaryColor.withOpacity(0.5),
                borderRadius: BorderRadius.circular(50),
                boxShadow: [
                  BoxShadow(
                    offset: const Offset(0.0, 1.1),
                    blurRadius: 5,
                    color: Constants.primaryColor.withOpacity(0.3),
                  ),
                ],
              ),
              child: const Icon(
                Icons.shopping_cart,
                color: Colors.white,
              ),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Constants.primaryColor,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      offset: const Offset(0.0, 1.1),
                      blurRadius: 5,
                      color: Constants.primaryColor.withOpacity(0.3),
                    ),
                  ],
                ),
                child: Center(
                  child: InkResponse(
                    onTap: () {
                      setState(() {
                        bool isSelected = toggleIsSelected(
                            plantlist[widget.plantID].isSelected);
                        plantlist[widget.plantID].isSelected = isSelected;
                      });
                    },
                    child: const Text(
                      "اضافه کردن به سبد خرید",
                      style: TextStyle(
                        fontFamily: "Muli",
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PlantFeature extends StatelessWidget {
  final String title;
  final String plantFeature;
  const PlantFeature({
    super.key,
    required this.title,
    required this.plantFeature,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          title,
          style: TextStyle(
              color: Constants.textColor,
              fontFamily: "Muli",
              fontSize: 18,
              fontWeight: FontWeight.bold),
        ),
        Text(
          plantFeature,
          style: TextStyle(
              color: Constants.primaryColor,
              fontFamily: "Muli",
              fontSize: 18,
              fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
