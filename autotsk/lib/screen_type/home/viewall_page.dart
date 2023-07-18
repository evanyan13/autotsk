import 'package:autotsk/util/color.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../add_task/task_model.dart';

class ViewAll extends StatefulWidget {
  const ViewAll({super.key});

  @override
  State<ViewAll> createState() => _ViewAllState();
}

class _ViewAllState extends State<ViewAll> {
  bool isLight = false;
  late String username;
  late List<String> taskList = [];
  late int task_length;
  late List<Widget> display = [];

  @override
  void initState() {
    awaitMethod();
    super.initState();
  }

  Future<List> awaitMethod() async {
    task_length = await taskCount();
    taskList = await getAllTaskremoveDup();
    for (int i = 0; i < task_length; i++) {
      Widget ui = await buildDisplay(taskList[i]);
      display.add(ui);
    }

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

  Future<Widget> buildDisplay(String taskid) async {
    DocumentReference tasking = await getinfo(taskid);
    DocumentSnapshot task = await tasking.get();
    TaskModel taskModel = TaskModel(
      uid: task['Task ID'],
      title: task['Title'],
      date: task['Date'],
      startTime: task['Start Time'],
      endTime: task['End Time'],
      priority: task['Priority'],
      location: task['Location'],
      notes: task['Notes'],
    );
    return Container(
      constraints: BoxConstraints(maxWidth: 300),
      decoration: BoxDecoration(
        color: Colors.purple,
        borderRadius: BorderRadius.all(
          Radius.circular(30.0),
        ),
      ),
      height: 150,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Task: ${taskModel.title}",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 300 / 2 - 6.5,
                height: 40,
                child: Column(
                  children: [
                    SizedBox(height: 10),
                    Text(
                      "Date: ${taskModel.date}",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 40,
                width: 325 / 2 - 6.5,
                child: Column(
                  children: [
                    SizedBox(height: 4),
                    Text(
                      'Start Time: ${taskModel.startTime}',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 2),
                    Text(
                      'End Time: ${taskModel.endTime}',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 7),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(width: 10),
              Container(
                width: 300 / 2 - 6.5,
                height: 30,
                child: Text(
                  "Importance: ${taskModel.priority}",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Row(
                children: [
                  SizedBox(width: 10),
                  Container(
                    height: 30,
                    width: 325 / 2 - 6.5,
                    child: Text(
                      'Location: ${taskModel.location}',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 35,
            child: TextButton(
              onPressed: () {
                showCupertinoModalPopup(
                  context: context,
                  builder: (BuildContext buildcontext) {
                    return CupertinoPopupSurface(
                      child: Container(
                        height: 600,
                        width: double.infinity,
                        color: Colors.white,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            DefaultTextStyle(
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                              ),
                              child: Text(
                                'Title: ${taskModel.title}',
                              ),
                            ),
                            DefaultTextStyle(
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                              ),
                              child: Text(
                                'Location: ${taskModel.location}',
                              ),
                            ),
                            DefaultTextStyle(
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                              ),
                              child: Text(
                                'Date: ${taskModel.date}',
                              ),
                            ),
                            DefaultTextStyle(
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                              ),
                              child: Text(
                                'Start Time: ${taskModel.startTime}',
                              ),
                            ),
                            DefaultTextStyle(
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                              ),
                              child: Text(
                                'End Time: ${taskModel.endTime}',
                              ),
                            ),
                            DefaultTextStyle(
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                              ),
                              child: Text(
                                'Importance: ${taskModel.priority}',
                              ),
                            ),
                            DefaultTextStyle(
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                              ),
                              child: Text(
                                'Notes: ${taskModel.notes}',
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
              child: Text(
                'click to see the full details',
                style: TextStyle(
                  fontSize: 13,
                  color: Colors.orange,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: mainLightBgColour,
        appBar: buildAppBar(),
        body: FutureBuilder(
          future: awaitMethod(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }

            if (snapshot.hasError) {
              return Center(
                child: Text(
                  snapshot.error.toString(),
                ),
              );
            } else {
              return ListView.separated(
                itemCount: taskList.length,
                itemBuilder: (context, index) {
                  return display[index];
                },
                separatorBuilder: (BuildContext context, int index) {
                  return const Divider(
                    color: mainLightBgColour,
                    height: 10,
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      title: isLight
          ? Image.asset("assets/LogoLight.png")
          : Image.asset("assets/logobg.png"),
      centerTitle: true,
      backgroundColor: isLight ? homePageBgDarkPurpleClr : mainLightBgColour,
      elevation: 0,
      actions: <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8),
          child: Transform.scale(
            scale: 0.8,
            child: CircleAvatar(
              radius: 24,
              backgroundColor: Colors.white,
              child: CircleAvatar(
                backgroundImage: AssetImage("assets/profileAvatar.png"),
                radius: 20,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
