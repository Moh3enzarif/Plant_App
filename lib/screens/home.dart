import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:page_transition/page_transition.dart';
import 'package:plant_app/const/constants.dart';
import 'package:plant_app/models/plant.dart';
import 'package:plant_app/screens/detail_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _CartPageState();
}

class _CartPageState extends State<HomePage> {
  int selectedIndex = 0;

  final List<Plant> _plantList = Plant.plantList;

  bool taggleFavorite(bool isFavorited) {
    return !isFavorited;
  }

  final List<String> _plantTypes = [
    "| پیشنهادی |",
    "| پر‌بازدیدها |",
    "| گل‌های سمی |",
    "| گل‌های‌گلخانه‌ای |"
  ];
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Center(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  width: size.width * 0.9,
                  decoration: BoxDecoration(
                    color: Constants.primaryColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.mic,
                        color: Constants.textColor,
                      ),
                      const Expanded(
                        child: Directionality(
                          textDirection: TextDirection.rtl,
                          child: TextField(
                            textAlign: TextAlign.start,
                            showCursor: false,
                            decoration: InputDecoration(
                                contentPadding: EdgeInsets.only(
                                  right: 5,
                                ),
                                hintText: "جستجو...",
                                border: InputBorder.none,
                                focusedBorder: InputBorder.none),
                            style: TextStyle(
                              fontFamily: "Muli",
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ),
                      Icon(
                        Icons.search,
                        color: Constants.textColor,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
              height: 70,
              width: size.width,
              child: ListView.builder(
                reverse: true,
                scrollDirection: Axis.horizontal,
                itemCount: _plantTypes.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedIndex = index;
                        });
                      },
                      child: Text(
                        _plantTypes[index],
                        style: TextStyle(
                          fontFamily: "Muli",
                          fontSize: 16,
                          fontWeight: selectedIndex == index
                              ? FontWeight.bold
                              : FontWeight.w300,
                          color: selectedIndex == index
                              ? Constants.primaryColor
                              : Constants.textColor,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              height: size.height * 0.3,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                reverse: true,
                itemCount: _plantList.length,
                itemBuilder: (BuildContext context, int index) {
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
                      margin: const EdgeInsets.symmetric(horizontal: 15),
                      width: 200,
                      decoration: BoxDecoration(
                        color: Constants.primaryColor.withOpacity(0.8),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Stack(
                        children: [
                          Positioned(
                            top: 15,
                            right: 15,
                            child: Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(50.0),
                              ),
                              child: IconButton(
                                onPressed: () {
                                  setState(() {
                                    bool isFavorated = taggleFavorite(
                                        _plantList[index].isFavorated);
                                    _plantList[index].isFavorated = isFavorated;
                                  });
                                },
                                icon: Icon(
                                  _plantList[index].isFavorated == true
                                      ? Icons.favorite
                                      : Icons.favorite_border_outlined,
                                  color: Constants.primaryColor,
                                  size: 20,
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            top: 50,
                            bottom: 50,
                            right: 50,
                            left: 50,
                            child: Image.asset(_plantList[index].imageURL),
                          ),
                          Positioned(
                            bottom: 15,
                            left: 15,
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 2),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Text(
                                r"تومان " + _plantList[index].price.toString(),
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 15,
                            right: 15,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  _plantList[index].category,
                                  style: const TextStyle(
                                    fontFamily: "Muli",
                                    fontSize: 14,
                                    color: Colors.white70,
                                  ),
                                ),
                                Text(
                                  _plantList[index].plantName,
                                  style: const TextStyle(
                                    fontFamily: "Muli",
                                    fontSize: 14,
                                    color: Colors.white70,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            Container(
              alignment: Alignment.centerRight,
              child: const Padding(
                padding: EdgeInsets.only(right: 18, bottom: 15, top: 20),
                child: Text(
                  "گیاهان جدید",
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: "Muli",
                      fontWeight: FontWeight.w900,
                      fontSize: 18),
                ),
              ),
            ),
            GestureDetector(
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
                padding: const EdgeInsets.symmetric(horizontal: 18),
                height: size.height * 0.3,
                child: ListView.builder(
                  itemCount: _plantList.length,
                  itemBuilder: (context, index) {
                    return Container(
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
                                height: 22,
                                child: Image.asset(
                                    "assets/images/PriceUnit-green.png"),
                              ),
                              const SizedBox(width: 5),
                              Text(
                                _plantList[index].price.toString(),
                                style: const TextStyle(
                                  fontFamily: "Muli",
                                  fontSize: 18,
                                  color: Colors.black,
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
                                    color:
                                        Constants.primaryColor.withOpacity(0.8),
                                    shape: BoxShape.circle),
                              ),
                              Positioned(
                                bottom: 5,
                                left: 0,
                                right: 0,
                                child: SizedBox(
                                  height: 80,
                                  child:
                                      Image.asset(_plantList[index].imageURL),
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
                                        fontSize: 13,
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
                    );
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

engNumberToFarsi(String number) {
  Map numbers = {
    '0': '۰',
    '1': '۱',
    '2': '۲',
    '3': '۳',
    '4': '۴',
    '5': '۵',
    '6': '۶',
    '7': '۷',
    '8': '۸',
    '9': '۹',
  };

  numbers.forEach((key, value) => number = number.replaceAll(key, value));
}
