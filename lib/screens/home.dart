import 'package:flutter/material.dart';
import 'package:plant_app/const/constants.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PageController _pageController = PageController(initialPage: 0);
  int currentindex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        actions: [
          Padding(
            padding: const EdgeInsets.only(top: 20, right: 20),
            child: InkWell(
              onTap: () {},
              child: const Text(
                "رد کردن",
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: "Muli",
                  fontSize: 20,
                ),
              ),
            ),
          )
        ],
      ),
      body: Stack(
        children: <Widget>[
          PageView(
            onPageChanged: (value) {
              setState(() {
                currentindex = value;
              });
            },
            controller: _pageController,
            children: [
              Padding(
                padding: const EdgeInsets.all(60),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/images/plant-one.png",
                      height: 400,
                    ),
                    const SizedBox(height: 20),
                    Text(
                      Constants.titleOne,
                      style: const TextStyle(
                        fontWeight: FontWeight.w900,
                        fontFamily: "Muli",
                        fontSize: 25,
                        color: Colors.green,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      Constants.descriptionOne,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontFamily: "Muli",
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
