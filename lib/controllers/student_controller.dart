import 'package:flutter_application_4/main.dart';
import 'package:flutter_application_4/model/data_model.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class StudentDbController extends GetxController {
  @override
  void onReady() {
    studentList.clear();
    studentList.addAll(studentDb.values);
    update();
    super.onReady();
  }

  List<StudentModel> studentList = <StudentModel>[];
  String? studentImage;
  String? studentImageFile;
  Future<void> openCamera() async {
    final XFile? images =
        await ImagePicker().pickImage(source: ImageSource.camera);
    studentImageFile = images!.path;
    update();
  }

  Future<void> openGallery() async {
    final XFile? images =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    studentImageFile = images!.path;
    update();
  }

  Future<void> addStudent(StudentModel details) async {
    final int id = await studentDb.add(details);
    final StudentModel studentDetails = StudentModel(
        name: details.name,
        age: details.age,
        gender: details.gender,
        standard: details.standard,
        id: id,
        image: details.image);
    await studentDb.put(id, studentDetails);
    studentList.add(studentDetails);
    update();
  }

  void deleteStudent(int id, int index) {
    studentDb.delete(id);
    studentList.removeAt(index);
    update();
  }

  Future<void> updateStudent(StudentModel editedStudent, int index) async {
    await studentDb.put(controller.studentList[index], editedStudent);
    studentList.removeAt(index);
    studentList.insert(index, editedStudent);
    update();
  }
}
