import 'package:flutter/material.dart';
import 'package:flutter_application_4/controllers/student_controller.dart';
import 'package:flutter_application_4/functions/db_functions.dart';
import 'package:flutter_application_4/view/add_student_widget.dart';
import 'package:flutter_application_4/view/list_student_widget.dart';
import 'package:flutter_application_4/view/screen_main.dart';
import 'package:flutter_application_4/widgets/bottom_nav.dart';
import 'package:get/get.dart';

class ScreenHome extends StatefulWidget {
  const ScreenHome({Key? key}) : super(key: key);

  @override
  State<ScreenHome> createState() => _ScreenHomeState();
}

final StudentDbController getxController = Get.put(StudentDbController());

class _ScreenHomeState extends State<ScreenHome> {
  int currentSelectedIndex = 0;
  final _pages = [
    ScreenMain(),
    AddStudentWidget(),
    ListenStudentWidget(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: ValueListenableBuilder(
              valueListenable: indexChangeNotifier,
              builder: (context, int index, child) => _pages[index])),
      bottomNavigationBar: BottomNavWidget(),
    );
  }
}
