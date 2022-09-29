// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_application_4/core/constants/constants.dart';
import 'package:flutter_application_4/widgets/common_widgets.dart';

class StudentDetails extends StatelessWidget {
  final String name;
  final String age;
  final String gender;
  final String standard;
  StudentDetails({
    Key? key,
    required this.name,
    required this.age,
    required this.gender,
    required this.standard,
    required this.imagestudent,
  }) : super(key: key);
  String imagestudent;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Container(
        decoration: BoxDecoration(gradient: kGradient),
        height: double.infinity,
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Text(
                "STUDENT PROFILE",
                style: textStyleHead(),
                textAlign: TextAlign.center,
              ),
            ),
            kHeight20,
            Center(
                child: Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Container(
                height: 600,
                width: 350,
                decoration: boxDecorationContainerWhite(),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    kHeight20,
                    CircleAvatar(
                        radius: 80,
                        backgroundImage: imagestudent.toString() !=
                                'assets/images/usericon.jpg'
                            ? FileImage(File(imagestudent)) as ImageProvider
                            : kAssetImageUrl),
                    kHeight5,
                    Text("PHOTO"),
                    kHeight20,
                    Center(
                      child: Text(
                        "Name: $name".toUpperCase(),
                        style: textStyleSubHead(),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    kHeight25,
                    Center(
                        child: Text(
                      "Age: $age",
                      style: textStyleSubHead(),
                      textAlign: TextAlign.left,
                    )),
                    kHeight25,
                    Center(
                        child: Text(
                      "Gender: $gender".toUpperCase(),
                      style: textStyleSubHead(),
                    )),
                    kHeight25,
                    Center(
                        child: Text(
                      "Class:  $standard".toUpperCase(),
                      style: textStyleSubHead(),
                      textAlign: TextAlign.left,
                    )),
                    kHeight25
                  ],
                ),
              ),
            )),
          ],
        ),
      ),
    ));
  }
}
