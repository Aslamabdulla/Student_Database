import 'package:flutter/material.dart';
import 'package:flutter_application_4/controllers/student_controller.dart';
import 'package:flutter_application_4/core/colors/colors.dart';
import 'package:flutter_application_4/functions/db_functions.dart';

import 'package:flutter_application_4/view/editscreen.dart';
import 'package:flutter_application_4/view/studentdetails.dart';
import 'package:flutter_application_4/widgets/common_widgets.dart';
import 'package:get/get.dart';

List StudentImages = [
  'assets/images/studentimage/1 (1).jpeg',
  'assets/images/studentimage/1 (2).jpeg',
  'assets/images/studentimage/1 (3).jpeg',
  'assets/images/studentimage/1 (4).jpeg',
  'assets/images/studentimage/1 (5).jpeg',
  'assets/images/studentimage/1 (6).jpeg',
  'assets/images/studentimage/1 (7).jpeg',
  'assets/images/studentimage/1 (8).jpeg',
  'assets/images/studentimage/1 (9).jpeg',
  'assets/images/studentimage/1 (10).jpeg',
  'assets/images/studentimage/1 (11).jpeg',
  'assets/images/studentimage/1 (12).jpeg',
  'assets/images/studentimage/1 (13).jpeg',
  'assets/images/studentimage/1 (14).jpeg',
  'assets/images/studentimage/1 (15).jpeg',
  'assets/images/studentimage/1 (16).jpeg',
  'assets/images/studentimage/1 (17).jpeg',
  'assets/images/studentimage/1 (18).jpeg',
  'assets/images/studentimage/1 (19).jpeg',
  'assets/images/studentimage/1 (20).jpeg',
  'assets/images/studentimage/1 (21).jpeg',
  'assets/images/studentimage/1 (22).jpeg',
  'assets/images/studentimage/1 (23).jpeg',
  'assets/images/studentimage/1 (24).jpeg',
  'assets/images/studentimage/1 (25).jpeg',
  'assets/images/studentimage/1 (26).jpeg',
  'assets/images/studentimage/1 (27).jpeg',
  'assets/images/studentimage/1 (28).jpeg',
  'assets/images/studentimage/1 (29).jpeg',
  'assets/images/studentimage/1 (30).jpeg',
  'assets/images/studentimage/1 (31).jpeg',
  'assets/images/studentimage/1 (32).jpeg',
  'assets/images/studentimage/1 (30).jpeg',
];
final StudentDbController getxController = Get.put(StudentDbController());

class ListenStudentWidget extends StatelessWidget {
  ListenStudentWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: ListView(
            children: [
              SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, left: 40, right: 40),
                child: Center(
                  child: Text(
                    "STUDENT DETAILS",
                    style: textStyleHead(),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: Container(
                  height: 680,
                  width: 380,
                  decoration: boxDecorationContainerTwo(),
                  child: GetBuilder<StudentDbController>(
                    init: StudentDbController(),
                    builder: (StudentDbController studentList) {
                      return studentList.studentList.isNotEmpty
                          ? ListView.separated(
                              itemBuilder: (ctx, index) {
                                final data = studentList.studentList[index];
                                return Card(
                                  elevation: 5,
                                  child: ListTile(
                                    onLongPress: () {
                                      Get.to(EditingScreen(
                                        namelist: data.name,
                                        agelist: data.age,
                                        genderlist: data.gender,
                                        classlist: data.standard,
                                        listkey: data.key,
                                        imagelist: StudentImages[index],
                                      ));
                                    },
                                    leading: CircleAvatar(
                                      radius: 30,
                                      child: Image(
                                        image: AssetImage(StudentImages[index]),
                                      ),
                                      backgroundColor: Colors.white,
                                    ),
                                    subtitle: Text("Age: ${data.age}"),
                                    title: Text(
                                        "Name: ${studentList.studentList[index].name.toUpperCase()}"),
                                    trailing: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        IconButton(
                                          onPressed: () {
                                            Get.defaultDialog(
                                              title: 'Confirm Delete',
                                              titleStyle: TextStyle(
                                                  fontSize: 25,
                                                  color: kBlackColor),
                                              middleText:
                                                  'Please Confirm Deletion',
                                              middleTextStyle: TextStyle(
                                                  fontSize: 25,
                                                  color: kBlackColor),
                                              textConfirm: 'YES',
                                              textCancel: 'NO',
                                              cancelTextColor: kBlackColor,
                                              confirmTextColor: kBlackColor,
                                              onConfirm: () {
                                                if (data.key != null) {
                                                  studentList.deleteStudent(
                                                      studentList
                                                          .studentList[index]
                                                          .id!,
                                                      index);
                                                  Get.back();
                                                  // print('deleted');
                                                } else {
                                                  //   print('Student is null');
                                                }
                                              },
                                              onCancel: () {
                                                Get.back();
                                              },
                                            );
                                          },
                                          icon: Icon(Icons.edit),
                                          color: Colors.black,
                                        ),
                                        IconButton(
                                          onPressed: () {
                                            Get.defaultDialog(
                                              title: 'Confirm Delete',
                                              titleStyle: TextStyle(
                                                  fontSize: 25,
                                                  color: kBlackColor),
                                              middleText:
                                                  'Please Confirm Deletion',
                                              middleTextStyle: TextStyle(
                                                  fontSize: 25,
                                                  color: kBlackColor),
                                              textConfirm: 'YES',
                                              textCancel: 'NO',
                                              cancelTextColor: kBlackColor,
                                              confirmTextColor: kBlackColor,
                                              onConfirm: () {
                                                if (data.key != null) {
                                                  studentList.deleteStudent(
                                                      studentList
                                                          .studentList[index]
                                                          .id!,
                                                      index);
                                                  Get.back();
                                                  // print('deleted');
                                                } else {
                                                  //   print('Student is null');
                                                }
                                              },
                                              onCancel: () {
                                                Get.back();
                                              },
                                            );
                                          },
                                          icon: Icon(Icons.delete),
                                          color: Colors.red,
                                        ),
                                      ],
                                    ),
                                    onTap: () {
                                      Get.to(StudentDetails(
                                        name: data.name,
                                        age: data.age,
                                        gender: data.gender,
                                        standard: data.standard,
                                        imagestudent: StudentImages[index],
                                      ));
                                    },
                                  ),
                                );
                              },
                              separatorBuilder: (context, index) {
                                return const SizedBox(
                                  height: 5,
                                );
                              },
                              itemCount: studentList.studentList.length,
                            )
                          : Center(
                              child: Text("Please Add Some Students"),
                            );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
