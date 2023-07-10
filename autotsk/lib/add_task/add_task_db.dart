import 'package:autotsk/add_task/task_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class AddFormMethod extends GetxController {
  static AddFormMethod get instance => Get.find();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Write task information to Firestore
  Future<String> addFormtoUserDb(TaskModel task) async {
    String res = "success";
    CollectionReference listOfUsers = _firestore.collection('users');
    try {
      if (task.title.isNotEmpty ||
          task.date.isNotEmpty ||
          task.priority.isNotEmpty) {
        listOfUsers.doc(task.uid).collection('tasks').add(task.toJson());
      }
    } catch (err) {
      res = err.toString();
    }
    return res;
  }

  // Fetch single task details or all tasks details
  Future<TaskModel> getSingleTask(String id) async {
    final snapshot = await _firestore
        .collection('tasks')
        .where("Task ID", isEqualTo: id)
        .get();
    final taskData = snapshot.docs.map((e) => TaskModel.fromSnapshot(e)).single;
    return taskData;
  }

  Future<List<TaskModel>> getAllTasks(String id) async {
    final snapshot = await _firestore.collection('tasks').get();
    final taskData =
        snapshot.docs.map((e) => TaskModel.fromSnapshot(e)).toList();
    return taskData;
  }
}
