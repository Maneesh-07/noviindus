import 'package:flutter/material.dart';

const backgroundcolor = Colors.black;
const kWhiteColor = Colors.white;
const kButtonColorBlue = Colors.blue;
const kButtonColorWhite = Colors.white;
const kColorBlack = Colors.black;
const colorGrey = Colors.grey;
const bottomColorGrey = Color.fromARGB(255, 222, 218, 218);
const colorRed = Color(0xffFC153B);
const primaryColor1 = Color.fromARGB(255, 197, 137, 112);

// const primaryColor = Color(0xFFFFC107);
const primaryColor = Color.fromRGBO(252, 194, 1, 1);
const secondaryColor = Color(0xFF242430);
const darkColor = Color(0xff2B2B2B);
const bodyTextColor = Color.fromARGB(255, 2, 2, 14);
const bgColor = Color(0xFF1E1E28);
const whiteColor = Colors.white;
const scaffoldBgColor = Color(0xff030331);
const greenColor = Colors.green;

const MaterialColor swatchWhite = MaterialColor(
  0xFFFFFFFF,
  <int, Color>{
    50: Color(0xFFFFFFFF),
    100: Color(0xFFFFFFFF),
    200: Color(0xFFFFFFFF),
    300: Color(0xFFFFFFFF),
    400: Color(0xFFFFFFFF),
    500: Color(0xFFFFFFFF),
    600: Color(0xFFFFFFFF),
    700: Color(0xFFFFFFFF),
    800: Color(0xFFFFFFFF),
    900: Color(0xFFFFFFFF),
  },
);

List<Color> gradientColors = const [
  Color.fromRGBO(252, 194, 1, 1),
  Color.fromRGBO(246, 201, 62, 1),
  Color.fromRGBO(198, 147, 32, 1)
];

MaterialColor customMaterialColor = MaterialColor(gradientColors.length, {
  50: gradientColors[0],
  100: gradientColors[1],
  200: gradientColors[2],
  300: gradientColors[0],
  400: gradientColors[1],
  500: gradientColors[2],
  600: gradientColors[1],
  700: gradientColors[2],
  800: gradientColors[1],
  900: gradientColors[2]
});
