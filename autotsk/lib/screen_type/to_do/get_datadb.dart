import 'package:autotsk/util/color.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class GetDataDb {
  bool isLight = false;
  late String username;
  late List<String> taskList = [];
  late int task_length;

  Future<List> awaitMethod() async {
    task_length = await taskCount();
    taskList = await getAllTaskremoveDup();

    return taskList;
  }

  Future<int> taskCount() async {
    QuerySnapshot<Map<String, dynamic>> tasksCollection =
        await FirebaseFirestore.instance
            .collection('users')
            .doc(FirebaseAuth.instance.currentUser!.uid)
            .collection('tasks')
            .get();

    return tasksCollection.docs.length;
  }

  // create a function that creates a container, placing all the neccessary details that needs to be displayed on the card, inside this function
  Future getAllTaskDetails() async {
    await FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection('tasks')
        .get()
        .then(
          (snapshot) => snapshot.docs.forEach((element) {
            taskList.add(element.reference.id);
          }),
        );

    // print(snap.docs.map((task) => task.data()));
  }

  Future getAllTaskremoveDup() async {
    await getAllTaskDetails();
    Set<String> seen = Set<String>();
    taskList = taskList.where((task) => seen.add(task)).toList();
    return taskList;
  }

  Future<DocumentReference> getinfo(String taskid) async {
    DocumentReference task = await FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection('tasks')
        .doc(taskid);

    return task;
  }
}
