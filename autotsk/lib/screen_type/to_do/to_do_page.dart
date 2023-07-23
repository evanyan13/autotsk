// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:autotsk/add_task/task_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";
import "package:autotsk/util/color.dart";
import 'package:autotsk/screen_type/common_components/side_bar.dart';
import 'package:autotsk/screen_type/common_components/get_datadb.dart';
import 'package:intl/intl.dart';

class ToDoPage extends StatefulWidget {
  const ToDoPage({super.key});

  @override
  State<ToDoPage> createState() => _ToDoPageState();
}

class _ToDoPageState extends State<ToDoPage> {
  late int task_length;
  late List taskList;
  GetDataDb dataObject = GetDataDb();
  late int todaysTaskLength = 0;
  late int imptTaskLength = 0;
  late List imptDisplay = [];

  Future<int> getTaskCount() async {
    return await dataObject.taskCount();
  }

  Future getTaskDetails() async {
    return await dataObject.getAllTaskDetails();
  }

  Future getTaskDetailsOnce() async {
    return await dataObject.getAllTaskremoveDup();
  }

  Future getTaskInfo(String taskid) async {
    return await dataObject.getinfo(taskid);
  }

  Future getTodaysTask() async {
    dynamic allTask = await getTaskDetailsOnce();
    String todaysDate = DateFormat.yMd().format(DateTime.now());
    List todaysTaskList = [];
    for (int i = 0; i < allTask.length / 2; i++) {
      if ((await getTaskDate(allTask[i])) == todaysDate) {
        todaysTaskList.add(allTask[i]);
      }
    }
    todaysTaskLength = todaysTaskList.length;
    return todaysTaskList.length;
  }

  Future getTaskDate(String taskid) async {
    DocumentReference tasking = await getTaskInfo(taskid);
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
    return taskModel.date;
  }

  Future getImportantTask() async {
    dynamic allTask = await getTaskDetailsOnce();
    List imptTaskList = [];
    for (int i = 0; i < allTask.length / 2; i++) {
      if ((await getTaskPriority(allTask[i])) == "High") {
        Widget ui = await buildDisplay(allTask[i]);
        imptDisplay.add(ui);
        imptTaskList.add(allTask[i]);
      }
    }

    imptTaskLength = imptTaskList.length;
    return imptTaskLength;
  }

  Future getTaskPriority(String taskid) async {
    DocumentReference tasking = await getTaskInfo(taskid);
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

    return taskModel.priority;
  }

  Future awaitMethods() async {
    task_length = await getTaskCount();
    taskList = await getTaskDetailsOnce();
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
        color: buttondarkBlueClr,
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
  void initState() {
    super.initState();
    awaitMethods();
  }

  Widget catTaskCont(String task, int numTask) {
    return Container(
      child: Container(
        height: 100,
        width: 150,
        child: Column(
          children: [
            SizedBox(
              height: 12,
            ),
            Row(
              children: [
                SizedBox(width: 20),
                Text(
                  '$task',
                  style: TextStyle(
                    color: buttondarkBlueClr,
                    fontFamily: "Neometric",
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
            SizedBox(height: 11),
            Row(
              children: [
                SizedBox(width: 20),
                Text(
                  numTask <= 1 ? '$numTask Task' : '$numTask Tasks',
                  style: TextStyle(
                    color: buttondarkBlueClr,
                    fontFamily: "Neometric",
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      height: 80,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.4),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 2), // changes position of shadow
          ),
        ],
        color: offWhiteColor,
        borderRadius: BorderRadius.all(
          Radius.circular(20.0),
        ),
      ),
    );
  }

  Widget taskCont(String task, int numTask) {
    return Container(
      child: Container(
        height: 100,
        width: 325,
        child: Column(
          children: [
            SizedBox(
              height: 12,
            ),
            Row(
              children: [
                SizedBox(width: 20),
                Text(
                  '$task',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            SizedBox(height: 11),
            Row(
              children: [
                SizedBox(width: 20),
                Text(
                  numTask <= 1 ? '$numTask Task' : '$numTask Tasks',
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: "Neometric",
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      height: 80,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.4),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 2), // changes position of shadow
          ),
        ],
        color: homePageBgDarkPurpleClr,
        borderRadius: BorderRadius.all(
          Radius.circular(20.0),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: mainLightBgColour,
        drawer: SideBar(),
        body: Container(
          height: double.infinity,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 15),
              FutureBuilder(
                future: getTodaysTask(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return CircularProgressIndicator();
                  } else {
                    return taskCont('Today', todaysTaskLength);
                  }
                },
              ),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      catTaskCont('Run', 3),
                      SizedBox(height: 20),
                      catTaskCont('Fly', 4),
                    ],
                  ),
                  SizedBox(width: 20),
                  Column(
                    children: [
                      catTaskCont('Meetings', 3),
                      SizedBox(height: 20),
                      catTaskCont('Work', 4),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 25),
              Row(
                children: [
                  SizedBox(
                    width: 40,
                  ),
                  Text(
                    "Most Important Tasks",
                    style: TextStyle(
                      fontFamily: 'Neometric',
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 15),
              FutureBuilder(
                future: getImportantTask(),
                builder: (builder, snapshot) {
                  return Expanded(
                    child: ListView.separated(
                      itemCount: imptTaskLength,
                      itemBuilder: (context, index) {
                        return imptDisplay[index];
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return const Divider(
                          color: mainLightBgColour,
                          height: 10,
                        );
                      },
                    ),
                  );
                },
              ),
            ],
          ),
        ),
        // bottomNavigationBar: NavBarDark(),
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      title: Image.asset("assets/logobg.png"),
      centerTitle: true,
      backgroundColor: mainLightBgColour,
      elevation: 0,
      iconTheme: IconThemeData(color: Colors.white),
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
                    ))))
      ],
    );
  }
}

/*              Container(
                height: 100,
                width: 325,
                decoration: BoxDecoration(
                  color: homePageBgLightPurpleClr,
                  borderRadius: BorderRadius.all(
                    Radius.circular(20.0),
                  ),
                ),
              ),
              SizedBox(height: 15),
              Container(
                height: 100,
                width: 325,
                decoration: BoxDecoration(
                  color: homePageBgLightPurpleClr,
                  borderRadius: BorderRadius.all(
                    Radius.circular(20.0),
                  ),
                ),
              ),
              SizedBox(height: 15),
              Container(
                height: 100,
                width: 325,
                decoration: BoxDecoration(
                  color: homePageBgLightPurpleClr,
                  borderRadius: BorderRadius.all(
                    Radius.circular(20.0),
                  ),
                ),
              ), */