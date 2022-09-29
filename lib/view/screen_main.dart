import 'package:flutter/material.dart';
import 'package:flutter_application_4/functions/db_functions.dart';
import 'package:flutter_application_4/model/data_model.dart';
import 'package:flutter_application_4/view/add_student_widget.dart';
import 'package:flutter_application_4/view/editscreen.dart';
import 'package:flutter_application_4/view/list_student_widget.dart';
import 'package:flutter_application_4/view/screen_homelist.dart';
import 'package:flutter_application_4/widgets/common_widgets.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:flutter_application_4/view/screen_home.dart';

import 'studentdetails.dart';

class ScreenMain extends StatefulWidget {
  ScreenMain({Key? key}) : super(key: key);

  @override
  State<ScreenMain> createState() => _ScreenMainState();
}

class _ScreenMainState extends State<ScreenMain> {
  final _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // getAllStudents();
    Box box;
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            "HOME",
            textAlign: TextAlign.center,
          ),
        ),
        backgroundColor: commonPurple(),
        toolbarHeight: 80,
      ),
      body: SafeArea(
        child: Center(
          child: Container(
            height: 700,
            width: 300,
            child: ListView(
              children: [
                SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (ctx) {
                          return AddStudentWidget();
                        },
                      ),
                    );
                  },
                  child: Container(
                      decoration: boxDecorationContainerHomeScreen(),
                      height: 200,
                      width: 400,
                      child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Center(
                              child: Text("ADD STUDENTS",
                                  style: textStyleHomeHead())))),
                ),
                SizedBox(
                  height: 15,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (ctx) {
                          return ListenStudentWidget();
                        },
                      ),
                    );
                  },
                  child: Container(
                      decoration: boxDecorationContainerHomeOneScreen(),
                      height: 200,
                      width: 400,
                      child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Center(
                              child: Text(
                            "EDIT STUDENTS",
                            style: textStyleHomeHead(),
                          )))),
                ),
                SizedBox(
                  height: 15,
                ),
                GestureDetector(
                  onTap: () {
                    // Navigator.of(context).push(
                    //   MaterialPageRoute(
                    //     builder: (ctx) {
                    //       return ScreenViewAll();
                    //     },
                    //   ),
                    // );
                  },
                  child: Container(
                      decoration: boxDecorationContainerHomeTwoScreen(),
                      height: 200,
                      width: 400,
                      child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Center(
                              child: Text(
                            "VIEW ALL",
                            style: textStyleHomeHead(),
                          )))),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
