import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/models/task_model.dart';

class FirebaseFunctions {
  static FirebaseFirestore firestore = FirebaseFirestore.instance;

  static CollectionReference<TaskModel> mainFunction() {
    return firestore.collection("Tasks").withConverter(
      fromFirestore: (snapshot, options) {
        return TaskModel.fromjson(snapshot.data()!);
      },
      toFirestore: (value, options) {
        return value.tojson();
      },
    );
  }

  static Future<void> addTask(TaskModel task) async {
    var ref = mainFunction();
    var docref = ref.doc();
    task.id = docref.id;
    await docref.set(task);
  }

  static Future<QuerySnapshot<TaskModel>> getTasks(DateTime time) {
    var ref = mainFunction();
    return ref
        .where("date",
            isEqualTo: DateUtils.dateOnly(time).millisecondsSinceEpoch)
        .get();
  }

  static void deleteTask(String id) async {
    var ref = mainFunction();
    await ref.doc(id).delete();
  }

  static void setDone(TaskModel task) async {
    var ref = mainFunction();
    task.isDone = !task.isDone;
    await ref.doc(task.id).update(task.tojson());
  }
}
