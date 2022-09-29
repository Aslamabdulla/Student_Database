import 'package:flutter/material.dart';
import 'package:flutter_application_4/controllers/student_controller.dart';
import 'package:flutter_application_4/core/colors/colors.dart';
import 'package:flutter_application_4/model/data_model.dart';
import 'package:get/get.dart';

class IconButtonWidget extends StatelessWidget {
  StudentDbController studentList;
  int index;
  IconButtonWidget({
    Key? key,
    required this.studentList,
    required this.index,
    required this.data,
  }) : super(key: key);

  final StudentModel data;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        Get.defaultDialog(
          title: 'Confirm Delete',
          titleStyle: TextStyle(fontSize: 25, color: kBlackColor),
          middleText: 'Please Confirm Deletion',
          middleTextStyle: TextStyle(fontSize: 25, color: kBlackColor),
          textConfirm: 'YES',
          textCancel: 'NO',
          cancelTextColor: kBlackColor,
          confirmTextColor: kBlackColor,
          onConfirm: () {
            if (data.key != null) {
              studentList.deleteStudent(
                  studentList.studentList[index].id!, index);
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
    );
  }
}
