import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_application_4/controllers/student_controller.dart';
import 'package:flutter_application_4/core/colors/colors.dart';
import 'package:flutter_application_4/core/constants/constants.dart';
import 'package:flutter_application_4/model/data_model.dart';
import 'package:flutter_application_4/view/studentdetails.dart';
import 'package:get/get.dart';

final searchGetxController = Get.put(StudentDbController());

class SearchView extends SearchDelegate<dynamic> {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return <Widget>[
      IconButton(
          onPressed: () {
            if (query.isEmpty) {
              close(context, null);
            } else {
              query = '';
            }
          },
          icon: Icon(Icons.clear))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          return close(context, null);
        },
        icon: Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    final List<StudentModel> searchKeyWord = searchGetxController.studentList
        .where((StudentModel element) => element.name.toLowerCase().contains(
              query.toLowerCase(),
            ))
        .toList();
    return Scaffold(
        backgroundColor: kLightBlue,
        body: searchKeyWord.isEmpty
            ? ListView(
                children: [
                  Center(
                    child: Icon(Icons.error),
                  ),
                  Center(
                    child: Text("NO DATA FOUND"),
                  )
                ],
              )
            : Padding(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                child: ListView.separated(
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        decoration: BoxDecoration(
                          color: kWhiteColor,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: ListTile(
                          leading: CircleAvatar(
                              radius: 40,
                              backgroundImage:
                                  searchKeyWord[index].image.toString() !=
                                          'assets/images/usericon.jpg'
                                      ? FileImage(File(
                                          searchKeyWord[index].image,
                                        )) as ImageProvider
                                      : kAssetImageUrl),
                          onTap: () async {
                            Get.to(StudentDetails(
                                name: searchKeyWord[index].name,
                                age: searchKeyWord[index].age,
                                gender: searchKeyWord[index].gender,
                                standard: searchKeyWord[index].standard,
                                imagestudent: searchKeyWord[index].image));
                          },
                          title: Text(searchKeyWord[index].name),
                        ),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return kHeight10;
                    },
                    itemCount: searchKeyWord.length),
              ));
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final List<StudentModel> searchKeyword = searchGetxController.studentList
        .where((StudentModel element) =>
            element.name.toLowerCase().contains(query.toLowerCase()))
        .toList();
    return Scaffold(
        backgroundColor: kLightBlue,
        body: searchKeyword.isEmpty
            ? ListView(
                children: [
                  Center(
                    child: Icon(Icons.error),
                  ),
                  Center(
                    child: Text("NO DATA FOUND"),
                  )
                ],
              )
            : Padding(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                child: ListView.separated(
                    physics: BouncingScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Container(
                        decoration: BoxDecoration(
                          color: kWhiteColor,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: ListTile(
                          leading: CircleAvatar(
                              radius: 40,
                              backgroundImage:
                                  searchKeyword[index].image.toString() !=
                                          'assets/images/usericon.jpg'
                                      ? FileImage(File(
                                          searchKeyword[index].image,
                                        )) as ImageProvider
                                      : kAssetImageUrl),
                          onTap: () {
                            Get.to(StudentDetails(
                                name: searchKeyword[index].name,
                                age: searchKeyword[index].age,
                                gender: searchKeyword[index].gender,
                                standard: searchKeyword[index].standard,
                                imagestudent: searchKeyword[index].image));
                          },
                          title: Text(searchKeyword[index].name),
                        ),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return SizedBox(
                        height: 10,
                      );
                    },
                    itemCount: searchKeyword.length),
              ));
  }
}
