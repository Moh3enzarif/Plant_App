import 'package:flutter/material.dart';
import 'package:plant_app/const/constants.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(20),
        width: size.width,
        height: size.height,
        // Start Profile Picture
        child: Column(
          children: [
            Container(
              width: 150,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: Constants.primaryColor.withOpacity(0.5),
                  width: 5,
                ),
              ),
              child: const CircleAvatar(
                radius: 60,
                backgroundColor: Colors.transparent,
                backgroundImage: ExactAssetImage("assets/images/profile.jpg"),
              ),
            ),
            // end Profile Picture
            const SizedBox(height: 20),
            // Start Profile Name
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  "رضا خلیلیان",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                    fontFamily: "Muli",
                  ),
                ),
                const SizedBox(width: 0.5),
                SizedBox(
                  height: 20,
                  child: Image.asset("assets/images/verified.png"),
                ),
              ],
            ),
            // end Profile Name
            const SizedBox(height: 10),
            // Start Profile Email
            const Text(
              "reza@gmail.com",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 20,
                fontFamily: "Muli",
              ),
            ),
            // end Profile Email
          ],
        ),
      ),
    );
  }
}
