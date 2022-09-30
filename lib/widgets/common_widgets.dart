import 'package:flutter/material.dart';
import 'package:flutter_application_4/core/colors/colors.dart';
import 'package:flutter_application_4/core/constants/constants.dart';
import 'package:google_fonts/google_fonts.dart';

commonLightPurple() {
  return Color.fromRGBO(205, 180, 219, 1);
}

commonLightPink() {
  return const Color.fromRGBO(255, 200, 221, 1);
}

commonLightPink2() {
  return const Color.fromRGBO(255, 175, 204, 1);
}

commonLightBlue() {
  return const Color.fromRGBO(162, 210, 255, 1);
}

commonLightBlueShade() {
  return const Color.fromRGBO(189, 224, 254, 1);
}

commonWhite() {
  return const Color.fromRGBO(255, 200, 221, 1);
}

commonBlue() {
  return const Color.fromRGBO(90, 119, 216, 1);
}

commonPurple() {
  return Colors.deepPurple;
}

boxDecorationFormBorder() {
  return InputDecoration(
    border: OutlineInputBorder(borderRadius: BorderRadius.circular(30.0)),
    fillColor: Colors.white,
    filled: true,
  );
}

boxDecorationShadow() {
  InputDecoration(
    border: OutlineInputBorder(borderRadius: BorderRadius.circular(30.0)),
    hintText: 'Name',
    fillColor: Colors.white,
    filled: true,
    prefixIcon: const Icon(Icons.person_add),
  );
  return BoxDecoration(
      shape: BoxShape.rectangle,
      color: Color.fromRGBO(205, 180, 219, 1),
      borderRadius: BorderRadius.circular(160.0),
      boxShadow: [
        BoxShadow(
          color: Colors.grey,
          blurRadius: 5,
        )
      ]);
}

boxDecorationContainerTwo() {
  return BoxDecoration(
      gradient: kGradient,
      shape: BoxShape.rectangle,
      // color: const Color.fromRGBO(205, 180, 219, 1),
      borderRadius: BorderRadius.circular(10.0),
      boxShadow: [
        BoxShadow(
          color: Colors.grey,
          blurRadius: 5,
        )
      ]);
}

elevatedButtonStyle() {
  return ElevatedButton.styleFrom(
    primary: Colors.deepPurple,
    padding: EdgeInsets.all(10),
    textStyle: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
  );
}

buttonShape() {
  return MaterialStateProperty.all<RoundedRectangleBorder>(
      RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18.0),
          side: BorderSide(color: Colors.red)));
}

buttonStyle() {
  return ButtonStyle(
      foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
      backgroundColor:
          MaterialStateProperty.all<Color>(Color.fromRGBO(49, 41, 62, .5)),
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18.0),
      )));
}

textStyleHead() {
  return GoogleFonts.aclonica(
    textStyle: TextStyle(
      color: Color.fromRGBO(41, 139, 168, 1),
      fontWeight: FontWeight.w700,
      fontSize: 20,
    ),
  );
}

textStyleBody() {
  return GoogleFonts.poppins(
    textStyle: TextStyle(
      color: Color.fromARGB(255, 0, 0, 0),
      fontWeight: FontWeight.w700,
      fontSize: 10,
    ),
  );
}

boxDecorationContainerWhite() {
  return BoxDecoration(
      shape: BoxShape.rectangle,
      color: Color.fromARGB(255, 255, 255, 255),
      borderRadius: BorderRadius.circular(160.0),
      boxShadow: [
        BoxShadow(
          color: Colors.grey,
          blurRadius: 5,
        )
      ]);
}

textStyleSubHead() {
  return GoogleFonts.lora(
    textStyle: TextStyle(
        color: kBlackColor,
        fontWeight: FontWeight.w700,
        fontSize: 20,
        fontStyle: FontStyle.italic),
  );
}

boxDecorationContainerEdit() {
  return BoxDecoration(
      shape: BoxShape.rectangle,
      color: Color.fromARGB(255, 255, 255, 255),
      borderRadius: BorderRadius.circular(160.0),
      boxShadow: [
        BoxShadow(
          color: Colors.grey,
          blurRadius: 5,
        )
      ]);
}

textStyleNavBarHead() {
  return GoogleFonts.aclonica(
    textStyle: TextStyle(
      color: Colors.deepPurple,
      fontWeight: FontWeight.w700,
      fontSize: 20,
    ),
  );
}

boxDecorationContainerMaiinScreen() {
  return BoxDecoration(
      shape: BoxShape.rectangle,
      color: Color.fromRGBO(205, 180, 219, 1),
      boxShadow: [
        BoxShadow(
          color: Colors.grey,
          blurRadius: 5,
        )
      ]);
}

textStyleSubBody() {
  return GoogleFonts.poppins(
    textStyle: TextStyle(
      color: Color.fromARGB(255, 0, 0, 0),
      fontWeight: FontWeight.w700,
      fontSize: 15,
    ),
  );
}

boxDecorationContainerHomeScreen() {
  return BoxDecoration(
      shape: BoxShape.rectangle,
      color: Color.fromRGBO(205, 180, 219, 1),
      borderRadius: BorderRadius.circular(160.0),
      boxShadow: [
        BoxShadow(
          color: Colors.grey,
          blurRadius: 5,
        )
      ]);
}

boxDecorationContainerHomeOneScreen() {
  return BoxDecoration(
      shape: BoxShape.rectangle,
      color: Color.fromRGBO(162, 210, 255, 1),
      borderRadius: BorderRadius.circular(160.0),
      boxShadow: [
        BoxShadow(
          color: Colors.grey,
          blurRadius: 5,
        )
      ]);
}

boxDecorationContainerHomeTwoScreen() {
  return BoxDecoration(
      shape: BoxShape.rectangle,
      color: Color.fromRGBO(231, 245, 158, 1),
      borderRadius: BorderRadius.circular(160.0),
      boxShadow: [
        BoxShadow(
          color: Colors.grey,
          blurRadius: 5,
        )
      ]);
}

textStyleHomeHead() {
  return GoogleFonts.abel(
    textStyle: TextStyle(
      color: Colors.deepPurple,
      fontWeight: FontWeight.w700,
      fontSize: 20,
    ),
  );
}

boxDecorationContainerView() {
  return BoxDecoration(
      shape: BoxShape.rectangle,
      color: const Color.fromRGBO(205, 180, 219, 1),
      boxShadow: [
        BoxShadow(
          color: Colors.grey,
          blurRadius: 5,
        )
      ]);
}
