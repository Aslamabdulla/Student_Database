import 'package:flutter/material.dart';
import 'package:flutter_application_4/controllers/student_controller.dart';
import 'package:flutter_application_4/model/data_model.dart';
import 'package:flutter_application_4/view/screen_home.dart';
import 'package:get/get.dart';

import 'package:hive_flutter/hive_flutter.dart';

late Box<StudentModel> studentDb;
late StudentDbController controller = Get.put(StudentDbController());
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  if (!Hive.isAdapterRegistered(StudentModelAdapter().typeId)) {
    Hive.registerAdapter(StudentModelAdapter());
    studentDb = await Hive.openBox<StudentModel>('student_db');
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Student Database',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: ScreenHome(),
    );
  }
}
