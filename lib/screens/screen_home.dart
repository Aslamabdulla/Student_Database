import 'package:flutter/material.dart';
import 'package:flutter_application_4/functions/db_functions.dart';
import 'package:flutter_application_4/screens/add_student_widget.dart';
import 'package:flutter_application_4/screens/list_student_widget.dart';
import 'package:flutter_application_4/screens/screen_main.dart';

class ScreenHome extends StatefulWidget {
  const ScreenHome({Key? key}) : super(key: key);

  @override
  State<ScreenHome> createState() => _ScreenHomeState();
}

int currentSelectedIndex = 0;

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
      body: SafeArea(child: _pages[currentSelectedIndex]),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.deepOrangeAccent,
        unselectedItemColor: Colors.deepPurple,
        currentIndex: currentSelectedIndex,
        onTap: (newIndex) {
          setState(() {
            currentSelectedIndex = newIndex;
          });
        },
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "HOME",
              backgroundColor: Color.fromRGBO(100, 100, 100, 1)),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_add),
              label: "ADD STUDENTS",
              backgroundColor: Color.fromRGBO(100, 100, 100, 1)),
          BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: "DETAILS",
              backgroundColor: Color.fromRGBO(100, 100, 100, 1)),
        ],
      ),
    );
  }
}
