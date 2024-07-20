import 'package:flutter/material.dart';
import 'package:plant_app/const/constants.dart';
import 'package:plant_app/screens/root.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _HomePageState();
}

class _HomePageState extends State<SplashScreen> {
  final PageController _pageController = PageController(initialPage: 0);
  int currentindex = 0;

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      height: 10,
      width: isActive ? 20.0 : 8.0,
      margin: const EdgeInsets.only(right: 5.0),
      decoration: BoxDecoration(
        color: Constants.primaryColor,
        borderRadius: BorderRadius.circular(5.0),
      ),
    );
  }

  List<Widget> _buildIndicator() {
    List<Widget> indicators = [];

    for (int i = 0; i < 3; i++) {
      if (currentindex == i) {
        indicators.add(_indicator(true));
      } else {
        indicators.add(_indicator(false));
      }
    }
    return indicators;
  }

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
              CreatePage(
                image: "assets/images/plant-one.png",
                title: Constants.titleOne,
                description: Constants.descriptionOne,
              ),
              CreatePage(
                image: "assets/images/plant-two.png",
                title: Constants.titleTwo,
                description: Constants.descriptionTwo,
              ),
              CreatePage(
                image: "assets/images/plant-three.png",
                title: Constants.titleThree,
                description: Constants.descriptionThree,
              ),
            ],
          ),
          Positioned(
            bottom: 80.0,
            left: 30.0,
            child: Row(
              children: _buildIndicator(),
            ),
          ),
          Positioned(
            bottom: 65.0,
            left: 30.0,
            child: Container(
              margin: const EdgeInsets.only(left: 300),
              padding: const EdgeInsets.all(4.0),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Constants.primaryColor,
              ),
              child: IconButton(
                onPressed: () {
                  setState(() {
                    if (currentindex < 2) {
                      currentindex++;
                      if (currentindex < 3) {
                        _pageController.nextPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeIn);
                      }
                    } else {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const RootPage(),
                        ),
                      );
                    }
                  });
                },
                icon: const Icon(
                  Icons.arrow_forward_ios,
                  size: 26,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CreatePage extends StatelessWidget {
  final String image;
  final String title;
  final String description;

  const CreatePage({
    super.key,
    required this.image,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 50,
        right: 50,
        bottom: 80,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            image,
            height: 400,
          ),
          const SizedBox(height: 20),
          Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.w900,
              fontFamily: "Muli",
              fontSize: 25,
              color: Constants.primaryColor,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            description,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: "Muli",
              fontWeight: FontWeight.bold,
              fontSize: 22,
              color: Constants.textColor,
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
