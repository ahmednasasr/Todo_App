// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:todo_app/models/task_model.dart';
// import 'package:firebase_auth/firebase_auth.dart';
//
// import '../models/user_model.dart';
//
//
// class FirebaseFunctions {
//   static FirebaseFirestore firestore = FirebaseFirestore.instance;
//
//   static CollectionReference<TaskModel> mainFunction() {
//     return firestore.collection("Tasks").withConverter(
//       fromFirestore: (snapshot, options) {
//         return TaskModel.fromjson(snapshot.data()!);
//       },
//       toFirestore: (value, options) {
//         return value.tojson();
//       },
//     );
//   }
//
//   static Future<void> addTask(TaskModel task) async {
//     var ref = mainFunction();
//     var docref = ref.doc();
//     task.id = docref.id;
//     await docref.set(task);
//   }
//
//   static Future<QuerySnapshot<TaskModel>> getTasks(DateTime date) {
//     var ref = mainFunction();
//     return ref
//         .where("date",
//             isEqualTo: DateUtils.dateOnly(date).millisecondsSinceEpoch)
//         .get();
//   }
//
//   static void deleteTask(String id) async {
//     var ref = mainFunction();
//     await ref.doc(id).delete();
//   }
//
//   static void setDone(TaskModel task) async {
//     var ref = mainFunction();
//     task.isDone = !task.isDone;
//     await ref.doc(task.id).update(task.tojson());
//   }
//   static Future<void> updateTask(TaskModel task) async {
//     var ref = mainFunction();
//     await ref.doc(task.id).update(task.tojson());
//   }
//   static addUser(UserModel user) async {
//     var ref = userMainFireStore();
//     await ref.doc(user.id).set(user);
//   }
//
//   static Future<UserModel> getUser() async {
//     var ref = userMainFireStore();
//     var data =
//     await ref.doc(FirebaseAuth.instance.currentUser?.uid ?? "").get();
//     UserModel userModel = data.data()!;
//     return userModel;
//   }
//
//   static Future<UserCredential> createAccount(
//       String email, String password, String name, String phone) async {
//     try {
//       final credential =
//       await FirebaseAuth.instance.createUserWithEmailAndPassword(
//         email: email,
//         password: password,
//       );
//       credential.user!.sendEmailVerification();
//       addUser(UserModel(
//           email: email, name: name, id: credential.user!.uid, phone: phone));
//       return credential;
//     } on FirebaseAuthException catch (e) {
//       if (e.code == 'weak-password') {
//         print('The password provided is too weak.');
//       } else if (e.code == 'email-already-in-use') {
//         print('The account already exists for that email.');
//       }
//       throw e.toString();
//     } catch (e) {
//       print(e);
//       throw e.toString();
//     }
//   }
//
//   static Future<UserCredential> login(String email, String password) async {
//     try {
//       final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
//         email: email,
//         password: password,
//       );
//       return credential;
//     } on FirebaseAuthException catch (e) {
//       if (e.code == 'weak-password') {
//         print('The password provided is too weak.');
//       } else if (e.code == 'email-already-in-use') {
//         print('The account already exists for that email.');
//       }
//       throw e.toString();
//     } catch (e) {
//       throw e.toString();
//     }
//   }
//
//   static logout() {
//     FirebaseAuth.instance.signOut();
//   }
// }
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/models/task_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../models/user_model.dart';


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

  static Future<QuerySnapshot<TaskModel>> getTasks(DateTime date) {
    var ref = mainFunction();
    return ref
        .where("date",
        isEqualTo: DateUtils.dateOnly(date).millisecondsSinceEpoch)
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

  static Future<void> updateTask(TaskModel task) async {
    var ref = mainFunction();
    await ref.doc(task.id).update(task.tojson());
  }

  static addUser(UserModel user) async {
    var ref = userMainFireStore();
    await ref.doc(user.id).set(user);
  }

  static Future<UserModel> getUser() async {
    var ref = userMainFireStore();
    var data = await ref.doc(FirebaseAuth.instance.currentUser?.uid ?? "").get();
    UserModel userModel = data.data()!;
    return userModel;
  }

  static Future<UserCredential> createAccount(
      String email, String password, String name, String phone) async {
    try {
      final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      credential.user!.sendEmailVerification();
      addUser(UserModel(
          email: email, name: name, id: credential.user!.uid, phone: phone));
      return credential;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
      throw e.toString();
    } catch (e) {
      print(e);
      throw e.toString();
    }
  }

  static Future<UserCredential> login(String email, String password) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credential;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
      throw e.toString();
    } catch (e) {
      throw e.toString();
    }
  }

  static logout() {
    FirebaseAuth.instance.signOut();
  }

  // الدالة المفقودة التي ترجع مرجعًا إلى مجموعة "Users"
  static CollectionReference<UserModel> userMainFireStore() {
    return firestore.collection("Users").withConverter(
      fromFirestore: (snapshot, options) {
        return UserModel.fromJson(snapshot.data()!);
      },
      toFirestore: (value, options) {
        return value.toJson();
      },
    );
  }
}

