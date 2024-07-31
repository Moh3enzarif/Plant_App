import 'package:flutter/material.dart';
import 'package:plant_app/const/constants.dart';

class ScanPage extends StatefulWidget {
  const ScanPage({super.key});

  @override
  State<ScanPage> createState() => _CartPageState();
}

class _CartPageState extends State<ScanPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      // AppBar
      body: Stack(
        children: [
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
                  // X Button
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
                // Share Button
                Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Constants.primaryColor.withOpacity(0.15),
                  ),
                  child: Icon(
                    Icons.share,
                    color: Constants.primaryColor,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 100,
            left: 20,
            right: 20,
            child: SizedBox(
              width: size.width * 0.8,
              height: size.height * 0.8,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/images/code-scan.png",
                      height: 100,
                    ),
                    const SizedBox(height: 20),
                    Text(
                      "برای اسکن گیاه کلیک کنید",
                      style: TextStyle(
                        color: Constants.primaryColor.withOpacity(0.8),
                        fontFamily: "Muli",
                        fontSize: 20,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
