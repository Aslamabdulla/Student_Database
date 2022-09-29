// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_application_4/functions/db_functions.dart';
import 'package:flutter_application_4/model/data_model.dart';
import 'package:flutter_application_4/widgets/common_widgets.dart';
import 'package:hive_flutter/hive_flutter.dart';

class EditingScreen extends StatefulWidget {
  EditingScreen({
    Key? key,
    required this.namelist,
    required this.agelist,
    required this.genderlist,
    required this.classlist,
    required this.imagelist,
    this.listkey,
  }) : super(key: key);

  var namelist;
  var listkey;
  var genderlist;
  var agelist;
  var classlist;
  String imagelist;

  @override
  State<EditingScreen> createState() => _EditingScreenState();
}

class _EditingScreenState extends State<EditingScreen> {
  final _name1Controller = TextEditingController();

  final _age1Controller = TextEditingController();

  final _gender1Controller = TextEditingController();

  final _class1Controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(205, 180, 219, 1),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 110.0),
            child: Center(
              child: Container(
                width: 350,
                height: 600,
                decoration: boxDecorationContainerEdit(),
                child: Padding(
                  padding:
                      const EdgeInsets.only(top: 30.0, right: 60, left: 60),
                  child: Column(
                    children: [
                      Text(
                        "Edit Details",
                        style: textStyleHead(),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      CircleAvatar(
                        radius: 50,
                        backgroundColor: Colors.transparent,
                        child: Image(
                          image: AssetImage(widget.imagelist),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        controller: _name1Controller,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30.0)),
                          hintText: widget.namelist,
                          hintStyle: textStyleSubBody(),
                          fillColor: Colors.white,
                          filled: true,
                          prefixIcon: const Icon(Icons.edit),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        keyboardType: TextInputType.number,
                        controller: _age1Controller,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30.0)),
                          hintText: widget.agelist,
                          hintStyle: textStyleSubBody(),
                          fillColor: Colors.white,
                          filled: true,
                          prefixIcon: const Icon(Icons.edit),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        controller: _gender1Controller,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30.0)),
                          hintText: widget.genderlist,
                          hintStyle: textStyleSubBody(),
                          fillColor: Colors.white,
                          filled: true,
                          prefixIcon: const Icon(Icons.edit),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        controller: _class1Controller,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30.0)),
                          hintText: widget.classlist,
                          hintStyle: textStyleSubBody(),
                          fillColor: Colors.white,
                          filled: true,
                          prefixIcon: const Icon(Icons.edit),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 50, right: 50),
                        child: ElevatedButton(
                            style: elevatedButtonStyle(),
                            onPressed: () {
                              editDetails(widget.listkey, context);
                              print(widget.listkey);
                            },
                            child: Text("EDIT")),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> editDetails(int listkey, BuildContext context) async {
    var _name = _name1Controller.text.trim();
    var _age = _age1Controller.text.trim();
    var _gender = _gender1Controller.text.trim();
    var _class = _class1Controller.text.trim();
    if (_name.isEmpty) {
      _name = widget.namelist;
    }
    if (_age.isEmpty) {
      _age = widget.agelist;
    }
    if (_gender.isEmpty) {
      _gender = widget.genderlist;
    }
    if (_class.isEmpty) {
      _class = widget.classlist;
    }
    final _student = StudentModel(
        name: _name, age: _age, gender: _gender, standard: _class, image: "");
    // getAllStudents()
    ;
    final studentDB = await Hive.openBox<StudentModel>('student_db');
    studentDB.put(listkey, _student);
    // getAllStudents();
  }
}
