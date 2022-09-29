import 'package:flutter/material.dart';
import 'package:flutter_application_4/main.dart';

import 'package:flutter_application_4/model/data_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

ValueNotifier<List<StudentModel>> studentListNotifier = ValueNotifier([]);

Future<void> addStudent(StudentModel value) async {
  //studentListNotifier.value.add(value);

  // final studentDB = await Hive.openBox<StudentModel>('student_db');
  // await studentDB.add(value);
  final id = await studentDb.add(value);
  // final value.id = id;

  // studentListNotifier.value.add(value);
  //  studentListNotifier.notifyListeners();
  getAllStudents();
}

Future<void> getAllStudents() async {
  final studentDB = await Hive.openBox<StudentModel>('student_db');
  studentListNotifier.value.clear();
  studentListNotifier.value.addAll(studentDB.values);
  studentListNotifier.notifyListeners();
}

Future<void> deleteStudent(int id) async {
  final studentDB = await Hive.openBox<StudentModel>('student_db');

  await studentDB.delete(id);

  getAllStudents();
}
