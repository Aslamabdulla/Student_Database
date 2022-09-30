// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';
import 'dart:io';

import 'package:elegant_notification/elegant_notification.dart';
import 'package:elegant_notification/resources/arrays.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_4/core/constants/constants.dart';
import 'package:flutter_application_4/view/bottom_sheet/image_bottomsheet.dart';
import 'package:get/get.dart';

import 'package:flutter_application_4/controllers/student_controller.dart';
import 'package:flutter_application_4/core/colors/colors.dart';
import 'package:flutter_application_4/functions/db_functions.dart';
import 'package:flutter_application_4/main.dart';
import 'package:flutter_application_4/model/data_model.dart';
import 'package:flutter_application_4/widgets/common_widgets.dart';

class AddStudentWidget extends StatelessWidget {
  AddStudentWidget({Key? key}) : super(key: key);
  StudentDbController getxController = Get.put(StudentDbController());

  final _nameController = TextEditingController();
  final _ageController = TextEditingController();
  final _genderController = TextEditingController();
  final _classController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _isDatamatched = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: SingleChildScrollView(
              child: GetBuilder<StudentDbController>(
                  init: StudentDbController(),
                  builder: (StudentDbController studentData) {
                    return Container(
                      margin: EdgeInsets.only(top: 20),
                      height: 700,
                      width: 350,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              colors: [
                                Colors.white.withOpacity(.5),
                                Color.fromRGBO(39, 90, 107, .6),
                                Color.fromRGBO(41, 139, 168, .5)
                              ],
                              stops: [
                                0,
                                0.35,
                                1
                              ],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter),
                          shape: BoxShape.rectangle,
                          color: const Color.fromRGBO(84, 57, 96, 1),
                          borderRadius: BorderRadius.circular(160.0),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.grey,
                              blurRadius: 1,
                            )
                          ]),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            kHeight10,
                            Container(
                              child: Padding(
                                padding: EdgeInsets.only(top: 15.0),
                                child: Stack(
                                  clipBehavior: Clip.none,
                                  children: [
                                    CircleAvatar(
                                        radius: 80,
                                        backgroundImage: studentData
                                                    .studentImageFile !=
                                                null
                                            ? FileImage(File(
                                                studentData.studentImageFile!,
                                              )) as ImageProvider
                                            : AssetImage(
                                                "assets/images/usericon.jpg")),
                                    Positioned(
                                        left: 100,
                                        right: 0,
                                        bottom: 10,
                                        child: GestureDetector(
                                          onTap: () {
                                            Get.bottomSheet(
                                              ImageSelectSheet(),
                                              backgroundColor: kWhiteColor,
                                              isDismissible: true,
                                            );
                                          },
                                          child: CircleAvatar(
                                            child: Icon(Icons.add_a_photo),
                                            backgroundColor: kWhiteColor,
                                          ),
                                        ))
                                  ],
                                ),
                              ),
                            ),
                            kHeight15,
                            Text("ADD PHOTO"),
                            kHeight15,
                            Padding(
                              padding: padding25,
                              child: TextFormField(
                                controller: _nameController,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.circular(30.0)),
                                  hintText: 'Name',
                                  fillColor: Colors.white,
                                  filled: true,
                                  prefixIcon: const Icon(Icons.person_add),
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return "Empty Fields";
                                  }
                                },
                              ),
                            ),
                            kHeight15,
                            Padding(
                              padding: padding25,
                              child: TextFormField(
                                keyboardType: TextInputType.number,
                                controller: _ageController,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.circular(30.0)),
                                  hintText: 'Age',
                                  fillColor: Colors.white,
                                  filled: true,
                                  prefixIcon: const Icon(Icons.badge),
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return "Empty Fields";
                                  }
                                },
                              ),
                            ),
                            kHeight15,
                            Padding(
                              padding: padding25,
                              child: TextFormField(
                                controller: _genderController,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.circular(30.0)),
                                  hintText: 'Gender',
                                  fillColor: Colors.white,
                                  filled: true,
                                  prefixIcon: const Icon(Icons.wc),
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return "Empty Fields";
                                  }
                                },
                              ),
                            ),
                            kHeight15,
                            Padding(
                              padding: padding25,
                              child: TextFormField(
                                controller: _classController,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.circular(30.0)),
                                  hintText: 'Class',
                                  fillColor: Colors.white,
                                  filled: true,
                                  prefixIcon: const Icon(Icons.school),
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return "Empty Fields";
                                  }
                                },
                              ),
                            ),
                            kHeight15,
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 90, right: 90),
                              child: ElevatedButton.icon(
                                  style: buttonStyle(),
                                  onPressed: () {
                                    if (_formKey.currentState!.validate()) {
                                      onAddStudentButtonClicked(context);
                                    }
                                  },
                                  icon: const Icon(Icons.add),
                                  label: const Text(
                                    "Add Student",
                                    style: TextStyle(fontSize: 16),
                                  )),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> onAddStudentButtonClicked(BuildContext context) async {
    final String image;
    if (controller.studentImageFile == null) {
      image = 'assets/images/usericon.jpg';
    } else {
      image = controller.studentImageFile!;
    }

    final _name = _nameController.text.trim();
    final _age = _ageController.text.trim();
    final _gender = _genderController.text.trim();
    final _class = _classController.text.trim();
    if (_name.isEmpty || _age.isEmpty || _gender.isEmpty || _class.isEmpty) {
      return;
    }
    print('$_name');
    final StudentModel _student = StudentModel(
      name: _name,
      age: _age,
      gender: _gender,
      standard: _class,
      image: image,
    );
    controller.addStudent(_student);
    log(_student.name.toString());
    ElegantNotification.success(
            notificationPosition: NotificationPosition.top,
            onDismiss: () {
              print("object");
            },
            title: Text("Success"),
            description: Text("Student Data Successfully Added"))
        .show(context);
    // Get.snackbar(
    //     messageText: TextWidget(text: "STUDENT DETAILS SUCCESSFULLY ADDED"),
    //     snackStyle: SnackStyle.FLOATING,
    //     dismissDirection: DismissDirection.horizontal,
    //     shouldIconPulse: true,
    //     colorText: kWhiteColor,
    //     backgroundColor: kBlackColor,
    //     "",
    //     "",
    //     snackPosition: SnackPosition.TOP);
    controller.studentImageFile = null;
    _nameController.clear();
    _ageController.clear();
    _genderController.clear();
    _classController.clear();
  }

  //   void checkLogin(BuildContext ctx) async {
  //   final _namefield = _nameController.text;
  //   final _agefield =_ageController.text;
  //   final _namefield = _nameController.text;
  //   final _agefield =_ageController.text;
  //   if (_username == _usernameDefined && _password == _passwordDefined) {
  //     //go to Ho
  //     final _sharedPrefs = await SharedPreferences.getInstance();
  //     await _sharedPrefs.setBool(SAVE_KEY_NAME, true);
  //     Navigator.of(ctx)
  //         .pushReplacement(MaterialPageRoute(builder: (ctx1) => ScreenHome()));
  //   } else {}
  // }
}

class TextWidget extends StatelessWidget {
  final String text;
  TextWidget({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        text,
        style: TextStyle(color: kWhiteColor),
      ),
    );
  }
}
