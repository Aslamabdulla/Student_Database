// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_application_4/controllers/student_controller.dart';
import 'package:flutter_application_4/main.dart';
import 'package:flutter_application_4/view/screen_home.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:flutter_application_4/core/constants/constants.dart';
import 'package:flutter_application_4/functions/db_functions.dart';
import 'package:flutter_application_4/model/data_model.dart';
import 'package:flutter_application_4/widgets/common_widgets.dart';

class EditingScreen extends StatelessWidget {
  var namelist;
  var index;
  var genderlist;
  var agelist;
  var classlist;
  String imagelist;
  EditingScreen({
    Key? key,
    required this.namelist,
    required this.index,
    required this.genderlist,
    required this.agelist,
    required this.classlist,
    required this.imagelist,
  }) : super(key: key);

  final _name1Controller = TextEditingController();

  final _age1Controller = TextEditingController();

  final _gender1Controller = TextEditingController();

  final _class1Controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color.fromRGBO(205, 180, 219, 1),
      body: Container(
        height: double.infinity,
        decoration: BoxDecoration(gradient: kGradient),
        child: GetBuilder<StudentDbController>(
            init: StudentDbController(),
            builder: (StudentDbController studentData) {
              return ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 110.0),
                    child: Center(
                      child: Container(
                        width: 350,
                        height: 650,
                        decoration: boxDecorationContainerEdit(),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 30.0, right: 60, left: 60),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Edit Details",
                                style: textStyleHead(),
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              CircleAvatar(
                                  radius: 60,
                                  backgroundImage: imagelist.toString() !=
                                          'assets/images/usericon.jpg'
                                      ? FileImage(File(imagelist))
                                          as ImageProvider
                                      : kAssetImageUrl),
                              kHeight10,
                              Text("PHOTO"),
                              SizedBox(
                                height: 10,
                              ),
                              TextFormField(
                                controller: _name1Controller,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.circular(30.0)),
                                  hintText: namelist,
                                  hintStyle: textStyleSubBody(),
                                  fillColor: Colors.white,
                                  filled: true,
                                  prefixIcon: const Icon(Icons.edit),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              TextFormField(
                                keyboardType: TextInputType.number,
                                controller: _age1Controller,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.circular(30.0)),
                                  hintText: agelist,
                                  hintStyle: textStyleSubBody(),
                                  fillColor: Colors.white,
                                  filled: true,
                                  prefixIcon: const Icon(Icons.edit),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              TextFormField(
                                controller: _gender1Controller,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.circular(30.0)),
                                  hintText: genderlist,
                                  hintStyle: textStyleSubBody(),
                                  fillColor: Colors.white,
                                  filled: true,
                                  prefixIcon: const Icon(Icons.edit),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              TextFormField(
                                controller: _class1Controller,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.circular(30.0)),
                                  hintText: classlist,
                                  hintStyle: textStyleSubBody(),
                                  fillColor: Colors.white,
                                  filled: true,
                                  prefixIcon: const Icon(Icons.edit),
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 50, right: 50),
                                child: ElevatedButton(
                                    style: elevatedButtonStyle(),
                                    onPressed: () {
                                      editDetails(
                                        index,
                                        context,
                                      );
                                      print(index);
                                    },
                                    child: Text("EDIT")),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              );
            }),
      ),
    );
  }

  Future<void> editDetails(int index, BuildContext context) async {
    final String image =
        controller.studentImageFile ?? controller.studentList[index].image;
    var _name = _name1Controller.text.trim();
    var _age = _age1Controller.text.trim();
    var _gender = _gender1Controller.text.trim();
    var _class = _class1Controller.text.trim();
    if (_name.isEmpty) {
      _name = namelist;
    }
    if (_age.isEmpty) {
      _age = agelist;
    }
    if (_gender.isEmpty) {
      _gender = genderlist;
    }
    if (_class.isEmpty) {
      _class = classlist;
    }

    final StudentModel _student = StudentModel(
        id: controller.studentList[index].id,
        name: _name,
        age: _age,
        gender: _gender,
        standard: _class,
        image: image);
    // getAllStudents()
    ;
    // final studentDB = await Hive.openBox<StudentModel>('student_db');
    controller.updateStudent(_student, index);
    Get.snackbar("SUCESS", "EDITED SUCCEFULLY");
    Get.offAll(ScreenHome());

    // studentDB.put(listkey, _student);
    // getAllStudents();
  }
}
