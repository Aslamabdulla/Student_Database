import 'package:flutter/material.dart';

const kHeight5 = SizedBox(
  height: 5,
);

const kHeight10 = SizedBox(
  height: 10,
);

const kHeight15 = SizedBox(
  height: 15,
);
const kHeight20 = SizedBox(
  height: 20,
);

const kHeight25 = SizedBox(
  height: 25,
);

const kWidth10 = SizedBox(
  width: 10,
);

const padding25 = EdgeInsets.symmetric(
  horizontal: 25,
);
final kGradient = LinearGradient(colors: [
  Colors.white.withOpacity(.5),
  Color.fromRGBO(39, 90, 107, .6),
  Color.fromRGBO(41, 139, 168, .5)
], stops: [
  0,
  0.35,
  1
], begin: Alignment.topCenter, end: Alignment.bottomCenter);
final kAssetImageUrl = AssetImage("assets/images/usericon.jpg");
