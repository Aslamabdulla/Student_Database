import 'package:flutter/material.dart';
import 'package:flutter_application_4/functions/db_functions.dart';
import 'package:flutter_application_4/model/data_model.dart';
import 'package:flutter_application_4/screens/add_student_widget.dart';
import 'package:flutter_application_4/screens/editscreen.dart';
import 'package:flutter_application_4/screens/list_student_widget.dart';
import 'package:flutter_application_4/screens/studentdetails.dart';
import 'package:flutter_application_4/widgets/common_widgets.dart';

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

class ScreenViewAll extends StatelessWidget {
  const ScreenViewAll({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    getAllStudents();
    // return Text("Hello");
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "ALL STUDENTS",
          textAlign: TextAlign.center,
        ),
        backgroundColor: commonPurple(),
        toolbarHeight: 80,
      ),
      body: Container(
        decoration: boxDecorationContainerView(),
        child: ValueListenableBuilder(
          valueListenable: studentListNotifier,
          builder: (BuildContext ctx, List<StudentModel> studentList,
              Widget? child) {
            return ListView.separated(
              itemBuilder: (ctx, index) {
                final data = studentList[index];
                return Card(
                  elevation: 10,
                  child: ListTile(
                    onLongPress: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (ctx) {
                            return EditingScreen(
                              namelist: data.name,
                              agelist: data.age,
                              genderlist: data.gender,
                              classlist: data.standard,
                              listkey: data.key,
                              imagelist: StudentImages[index],
                            );
                          },
                        ),
                      );
                    },
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (ctx) {
                            return StudentDetails(
                              name: data.name,
                              age: data.age,
                              gender: data.gender,
                              standard: data.standard,
                              imagestudent: StudentImages[index],
                            );
                          },
                        ),
                      );
                    },
                    leading: CircleAvatar(
                      radius: 30,
                      child: Image(
                        image: AssetImage(StudentImages[index]),
                      ),
                      backgroundColor: Colors.white,
                    ),
                    subtitle: Text("Gender: ${data.gender}"),
                    title: Text("Name: ${data.name}"),
                    trailing: Text("Class: ${data.standard}"),
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return const Divider();
              },
              itemCount: studentList.length,
            );
          },
        ),
      ),
    );
  }
}
