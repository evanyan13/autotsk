// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";
import "package:autotsk/util/color.dart";
import 'package:autotsk/screen_type/common_components/side_bar.dart';
import 'package:autotsk/screen_type/common_components/nav_bar_dark.dart';
import 'package:autotsk/screen_type/common_components/get_datadb.dart';
import 'package:autotsk/add_task/task_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:intl/intl.dart';

class ReminderPage extends StatefulWidget {
  const ReminderPage({super.key});

  @override
  State<ReminderPage> createState() => _ReminderPageState();
}

class _ReminderPageState extends State<ReminderPage> {
  bool isLight = false;
  late List<String> taskList = [];
  late int task_length;
  GetDataDb dataObject = GetDataDb();
  late int upcomingTaskLength = 0;
  late List<Widget> upcomingDisplay = [];
  late List upcomingTaskList = [];

  @override
  void initState() {
    super.initState();
    awaitMethods();
  }

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

  Future awaitMethods() async {
    task_length = await getTaskCount();
    taskList = await getTaskDetailsOnce();
  }

  bool isUpcoming(List<String> todaysDate, List<String> taskDate) {
    //parse each value of todaysDate
    int month = int.parse(todaysDate[0]);
    int day = int.parse(todaysDate[1]);
    int year = int.parse(todaysDate[2]);

    int tmonth = int.parse(taskDate[0]);
    int tday = int.parse(taskDate[1]);
    int tyear = int.parse(taskDate[2]);

    if (tyear > year) {
      return true;
    } else if (tyear == year) {
      // logic here
      if (tmonth > month) {
        return true;
      } else if (tmonth == month) {
        // logic for day here
        if (tday >= day) {
          return true;
        } else {
          return false;
        }
      } else {
        return false;
      }
    } else {
      return false;
    }
  }

  Future getUpcomingTask() async {
    dynamic allTask = await getTaskDetailsOnce();
    String todaysDate = DateFormat.yMd().format(DateTime.now());
    // split date String into different parts and compare the int value of the month, day and year to determine if it is upcoming or past.
    List<String> splitTodaysDate = todaysDate.split("/");
    for (int i = 0; i < allTask.length / 2; i++) {
      List<String> splitTaskDate = (await getTaskDate(allTask[i])).split("/");
      if (isUpcoming(splitTodaysDate, splitTaskDate)) {
        Widget ui = await buildDisplay(allTask[i]);
        upcomingDisplay.add(ui);
        upcomingTaskList.add(allTask[i]);
      }
    }
    upcomingTaskLength = upcomingTaskList.length;
    return upcomingTaskList.length;
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainLightBgColour,
      drawer: SideBar(),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 10),
            Text(
              "Upcoming Tasks",
              style: TextStyle(
                fontFamily: 'Neometric',
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
            SizedBox(height: 10),
            FutureBuilder(
              future: getUpcomingTask(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Column(
                    children: [
                      SizedBox(height: 300),
                      Center(
                        child: CircularProgressIndicator(),
                      ),
                    ],
                  );
                } else {
                  return Expanded(
                    child: ListView.separated(
                      itemCount: upcomingTaskLength,
                      itemBuilder: (context, index) {
                        return upcomingDisplay[index];
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return const Divider(
                          color: mainLightBgColour,
                          height: 10,
                        );
                      },
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      title: Image.asset("assets/logobg.png"),
      centerTitle: true,
      elevation: 0,
      iconTheme: IconThemeData(color: Colors.black),
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
