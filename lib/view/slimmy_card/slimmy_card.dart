// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_application_4/core/colors/colors.dart';
import 'package:flutter_application_4/core/constants/constants.dart';
import 'package:flutter_application_4/widgets/common_widgets.dart';
import 'package:flutter_slimy_card/flutter_slimy_card.dart';

class SlimyCard extends StatefulWidget {
  final String name;
  final String age;
  final String gender;
  final String standard;
  String imagestudent;
  SlimyCard({
    Key? key,
    required this.name,
    required this.age,
    required this.gender,
    required this.standard,
    required this.imagestudent,
  }) : super(key: key);

  @override
  State<SlimyCard> createState() => _SlimyCardState();
}

class _SlimyCardState extends State<SlimyCard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            centerTitle: true,
            title: Text("STUDENT PROFILE"),
            backgroundColor: Color.fromRGBO(41, 139, 168, 1)),
        body: Center(
          child: ListView(
            shrinkWrap: true,
            children: <Widget>[
              kHeight5,
              kHeight20,
              FlutterSlimyCard(
                color: Color.fromRGBO(41, 139, 168, 1),
                cardWidth: MediaQuery.of(context).size.width - 50,
                topCardHeight: 180,
                bottomCardHeight: 400,
                topCardWidget: topWidget(),
                bottomCardWidget: bottomWidget(),
              ),
            ],
          ),
        ));
  }

  topWidget() {
    return Container(
      child: SafeArea(
        child: Column(
          children: [
            CircleAvatar(
                radius: 40,
                backgroundImage: widget.imagestudent.toString() !=
                        'assets/images/usericon.jpg'
                    ? FileImage(File(widget.imagestudent)) as ImageProvider
                    : kAssetImageUrl),
            SizedBox(
              height: 10,
            ),
            Text(
              "Name: ${widget.name.toUpperCase()}",
              style: TextStyle(color: kBlackColor, fontSize: 18),
            ),
            SizedBox(
              height: 5,
            ),
          ],
        ),
      ),
    );
  }

  bottomWidget() {
    return Container(
      margin: EdgeInsets.only(top: 5),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          kHeight15,
          Center(
            child: Text(
              " NAME: ${widget.name.toUpperCase()}",
              style: textStyleSubHead(),
              textAlign: TextAlign.left,
            ),
          ),
          kHeight15,
          Center(
              child: Text(
            "AGE: ${widget.age}",
            style: textStyleSubHead(),
            textAlign: TextAlign.left,
          )),
          kHeight15,
          Center(
              child: Text(
            "GENDER: ${widget.gender.toUpperCase()}",
            style: textStyleSubHead(),
          )),
          kHeight15,
          Center(
              child: Text(
            "STANDARD: ${widget.standard.toUpperCase()}",
            style: textStyleSubHead(),
            textAlign: TextAlign.left,
          )),
          kHeight15
        ],
      ),
    );
  }
}
