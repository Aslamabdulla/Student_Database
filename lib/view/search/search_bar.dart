import 'package:flutter/material.dart';
import 'package:flutter_application_4/controllers/student_controller.dart';
import 'package:flutter_application_4/core/colors/colors.dart';
import 'package:flutter_application_4/core/constants/constants.dart';
import 'package:flutter_application_4/view/search/search_view.dart';
import 'package:get/get.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({super.key});
  final StudentDbController getxController = Get.put(StudentDbController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: AppBar(
            backgroundColor: kLightBlue,
            automaticallyImplyLeading: false,
            title: Text("SEARCH STUDENT"),
            centerTitle: true,
            actions: [
              IconButton(
                  onPressed: () {
                    showSearch(context: context, delegate: SearchView());
                  },
                  icon: Icon(Icons.search))
            ],
          ),
        ),
        body: Container(
          margin: EdgeInsets.all(15),
          height: double.infinity,
          decoration: BoxDecoration(
              gradient: kGradient, borderRadius: BorderRadius.circular(100)),
        ));
  }
}
