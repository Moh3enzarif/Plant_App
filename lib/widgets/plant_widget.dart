import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:plant_app/const/constants.dart';
import 'package:plant_app/models/plant.dart';
import 'package:plant_app/screens/detail_page.dart';
import 'package:plant_app/widgets/extention.dart';

class NewPlantWidget extends StatelessWidget {
  final List<Plant> _plantList;
  final int index;

  const NewPlantWidget({
    Key? key,
    required List<Plant> plantList,
    required this.index,
  })  : _plantList = plantList,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          PageTransition(
              child: DetailPage(
                plantID: _plantList[index].plantId,
              ),
              type: PageTransitionType.bottomToTop),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Constants.primaryColor.withOpacity(0.1),
          borderRadius: BorderRadius.circular(10),
        ),
        height: 80,
        width: size.width,
        margin: const EdgeInsets.only(top: 10, bottom: 10),
        padding: const EdgeInsets.only(left: 10, top: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                SizedBox(
                  height: 20,
                  child: Image.asset("assets/images/PriceUnit-green.png"),
                ),
                const SizedBox(width: 5),
                Text(
                  _plantList[index].price.toString().farsiNumber,
                  style: TextStyle(
                    fontFamily: "Muli",
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Constants.primaryColor,
                  ),
                ),
              ],
            ),
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                      color: Constants.primaryColor.withOpacity(0.8),
                      shape: BoxShape.circle),
                ),
                Positioned(
                  bottom: 5,
                  left: 0,
                  right: 0,
                  child: SizedBox(
                    height: 80,
                    child: Image.asset(_plantList[index].imageURL),
                  ),
                ),
                Positioned(
                  bottom: 5,
                  right: 80,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        _plantList[index].category,
                        style: const TextStyle(
                          fontSize: 14,
                          fontFamily: "Muli",
                        ),
                      ),
                      Text(
                        _plantList[index].category,
                        style: const TextStyle(
                          fontSize: 18,
                          fontFamily: "Muli",
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
