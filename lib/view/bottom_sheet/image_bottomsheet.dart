// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_application_4/controllers/student_controller.dart';

import 'package:flutter_application_4/core/colors/colors.dart';
import 'package:flutter_application_4/core/constants/constants.dart';
import 'package:flutter_application_4/view/bottom_sheet/widget/icons.dart';
import 'package:get/get.dart';
import 'package:get/get_core/get_core.dart';

class ImageSelectSheet extends StatelessWidget {
  const ImageSelectSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
        Color.fromRGBO(39, 90, 107, 1),
        Color.fromRGBO(41, 139, 168, .5)
      ], stops: [
        0,
        1
      ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
      height: 180,
      child: Column(
        children: [
          kHeight10,
          Text(
            "SELECT PHOTO",
            style: TextStyle(fontSize: 15, color: kWhiteColor.withOpacity(.5)),
          ),
          kHeight15,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                height: 110,
                width: 90,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.amber.withOpacity(.5)),
                child: IconButton(
                    onPressed: () async {
                      Get.find<StudentDbController>().openCamera();
                      Get.back();
                    },
                    icon: IconsWidget(
                      icon: Icons.photo_camera,
                    )),
              ),
              Container(
                height: 110,
                width: 90,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.amber.withOpacity(.5)),
                child: IconButton(
                    onPressed: () {
                      Get.find<StudentDbController>().openGallery();
                      Get.back();
                    },
                    icon: IconsWidget(icon: Icons.photo_library)),
              )
            ],
          ),
        ],
      ),
    );
  }
}
