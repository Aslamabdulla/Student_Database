// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
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
        backgroundColor: Color.fromRGBO(205, 180, 219, 1),
        body: SafeArea(
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 60),
                child: Text(
                  "STUDENT PROFILE",
                  style: textStyleHead(),
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 40.0),
                child: Center(
                    child: Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: Container(
                    height: 500,
                    width: 350,
                    decoration: boxDecorationContainerWhite(),
                    child: Column(
                      children: [
                        CircleAvatar(
                          child: Image(
                            image: AssetImage(imagestudent),
                            height: 150,
                          ),
                          radius: 100.0,
                          backgroundColor: Color.fromARGB(0, 250, 22, 1),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Center(
                          child: Text(
                            "NAME: $name",
                            style: textStyleSubHead(),
                            textAlign: TextAlign.left,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Center(
                            child: Text(
                          "AGE: $age",
                          style: textStyleSubHead(),
                          textAlign: TextAlign.left,
                        )),
                        SizedBox(
                          height: 20,
                        ),
                        Center(
                            child: Text(
                          "GENDER: $gender",
                          style: textStyleSubHead(),
                        )),
                        SizedBox(
                          height: 20,
                        ),
                        Center(
                            child: Text(
                          "CLASS:  $standard",
                          style: textStyleSubHead(),
                          textAlign: TextAlign.left,
                        )),
                      ],
                    ),
                  ),
                )),
              ),
            ],
          ),
        ));
  }
}
