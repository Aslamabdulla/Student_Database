// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:flutter/material.dart';
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
      body: Center(
        child: SingleChildScrollView(
          child: GetBuilder<StudentDbController>(
              init: StudentDbController(),
              builder: (StudentDbController studentData) {
                return Container(
                  height: 600,
                  width: 350,
                  decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      color: const Color.fromRGBO(205, 180, 219, 1),
                      borderRadius: BorderRadius.circular(160.0),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.grey,
                          blurRadius: 5,
                        )
                      ]),
                  child: Form(
                    key: _formKey,
                    child: ListView(
                      children: [
                        Container(
                          child: const Padding(
                            padding: EdgeInsets.only(top: 15.0),
                            child: Image(
                              image: AssetImage(
                                  'assets/images/casual-life-3d-boy-carrying-books.png'),
                              height: 150,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15, right: 15),
                          child: TextFormField(
                            controller: _nameController,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30.0)),
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
                        const SizedBox(height: 8),
                        Padding(
                          padding: const EdgeInsets.only(left: 15, right: 15),
                          child: TextFormField(
                            keyboardType: TextInputType.number,
                            controller: _ageController,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30.0)),
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
                        const SizedBox(
                          height: 8,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15, right: 15),
                          child: TextFormField(
                            controller: _genderController,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30.0)),
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
                        const SizedBox(
                          height: 8,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15, right: 15),
                          child: TextFormField(
                            controller: _classController,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30.0)),
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
                        const SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 90, right: 90),
                          child: ElevatedButton.icon(
                              style: buttonStyle(),
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  onAddStudentButtonClicked();
                                }
                              },
                              icon: const Icon(Icons.add),
                              label: const Text("Add Student")),
                        ),
                      ],
                    ),
                  ),
                );
              }),
        ),
      ),
    );
  }

  Future<void> onAddStudentButtonClicked() async {
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
      image: "",
    );
    controller.addStudent(_student);
    log(_student.name.toString());
    Get.snackbar(
        messageText: TextWidget(text: "STUDENT DETAILS SUCCESSFULLY ADDED"),
        snackStyle: SnackStyle.FLOATING,
        dismissDirection: DismissDirection.horizontal,
        shouldIconPulse: true,
        colorText: kWhiteColor,
        backgroundColor: kBlackColor,
        "",
        "",
        snackPosition: SnackPosition.TOP);
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
