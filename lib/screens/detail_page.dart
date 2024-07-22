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
        ],
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
