import 'package:flutter/material.dart';
import 'package:flutter_application_2/misc/colors.dart';
import 'package:flutter_application_2/widgets/app_large_text.dart';
import 'package:flutter_application_2/widgets/app_text.dart';
import 'package:flutter_application_2/widgets/responsive_button.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  final List images = [
    "welcome-one.jpg",
    "welcome-two.jpg",
    "welcome-three.jpg"
  ];

  final List descriptions = [
    "Mountain hikes give you an incredible sense of freedom. along with endurance test.",
    "The best view comes after the hardest climb.",
    "Every mountain top is within reach if you just keep climbing."
  ];

  Widget dotGenerator(int index, int mainIndex) {
    Color dotColor = Colors.white;

    mainIndex == index ? dotColor = AppColors.mainColor : Colors.white;

    if (mainIndex == 1) {
      dotColor = Colors.white;
      if (mainIndex == index) {
        dotColor = Colors.green.shade500;
      }
    }

    return Container(
      width: 8,
      height: mainIndex == index ? 25 : 8,
      margin: const EdgeInsets.symmetric(vertical: 2),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: dotColor,
      ),
    );
  }

  Widget builder(BuildContext context, int index) {
    return Container(
      width: double.maxFinite,
      height: double.maxFinite,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/${images[index]}"),
          fit: BoxFit.cover,
          filterQuality: FilterQuality.high,
        ),
      ),
      child: Container(
        margin: const EdgeInsets.only(top: 150, left: 20, right: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppLargeText(
                  text: "Trips",
                  color: index == 1 ? Colors.white : Colors.black,
                ),
                AppText(
                    text: "Mountain",
                    size: 30,
                    color: index == 1 ? Colors.white : Colors.black54),
                const SizedBox(height: 20),
                SizedBox(
                  width: 250,
                  child: AppText(
                    text: descriptions[index],
                    color: index == 1 ? Colors.white : AppColors.textColor2,
                    size: 14,
                  ),
                ),
                if (index != 1) const SizedBox(height: 40),
                if (index != 1) const ResponsiveButton(width: 120)
              ],
            ),
            Column(
              children:
                  List.generate(3, (gindex) => dotGenerator(gindex, index)),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        itemBuilder: ((context, index) => builder(context, index)),
        itemCount: images.length,
        scrollDirection: Axis.vertical,
      ),
    );
  }
}
