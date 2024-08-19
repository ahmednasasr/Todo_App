import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/models/task_model.dart';
import 'package:todo_app/service/firebase_functions.dart';

class mainprovider extends ChangeNotifier {
  int selectindex = 0;
  DateTime selectedatepicker = DateTime.now();
  DateTime selectedDateTime = DateTime.now();
  ThemeMode themeMode = ThemeMode.light;
  TimeOfDay time=TimeOfDay.now();
  TextEditingController titleController = TextEditingController();
  TextEditingController desController = TextEditingController();
  void selectedindex(int index) {
    selectindex = index;
    notifyListeners();
  }

  void setdatepicker(DateTime datetime) {
    selectedatepicker = datetime;
    notifyListeners();
  }

  void changetheme(ThemeMode thememode) {
    themeMode = thememode;
    notifyListeners();
  }

  void setDateTimeTask(DateTime datetime) {
    selectedDateTime = datetime;
    notifyListeners();
  }

  void addTask() async {
    TaskModel taskModel = TaskModel(
      time: "${time.hour}:${time.minute}",
        title: titleController.text,
        desc: desController.text,
        date: DateUtils.dateOnly(selectedatepicker).millisecondsSinceEpoch,
        isDone: false);
    await FirebaseFunctions.addTask(taskModel);
    titleController.clear();
    desController.clear();
    notifyListeners();
  }

  Future<QuerySnapshot<TaskModel>> getTasks(){
    return FirebaseFunctions.getTasks(selectedatepicker);
  }

  void deleteTask(String id){
    FirebaseFunctions.deleteTask(id);
    notifyListeners();
  }
  void Isdone(TaskModel task){
    FirebaseFunctions.setDone(task);
    notifyListeners();
  }
  void setTime(TimeOfDay value){
    time=value;
    notifyListeners();
  }

}
