// ignore_for_file: prefer_const_constructors, sort_child_properties_last, unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:autotsk/util/color.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:autotsk/add_task/task_model.dart';

class TaskContent extends StatefulWidget {
  const TaskContent({super.key});

  @override
  State<TaskContent> createState() => _TaskContentState();
}

class _TaskContentState extends State<TaskContent> {
  int activeIndex = 0;
  final controller = CarouselController();
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
      constraints: BoxConstraints(maxWidth: 325),
      child: Column(
        children: [
          SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
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
            ],
          ),
          Row(
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
            children: [
              Container(
                width: 300 / 2 - 6.5,
                height: 30,
                child: Column(
                  children: [
                    Text(
                      "Importance: ${taskModel.priority}",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
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
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FutureBuilder(
            future: awaitMethod(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Center(
                  child: Text(
                    snapshot.error.toString(),
                  ),
                );
              } else {
                return CarouselSlider.builder(
                  carouselController: controller,
                  itemCount: taskList.length,
                  itemBuilder: (context, index, secondIndex) {
                    return Container(
                      width: MediaQuery.of(context).size.width * 0.8,
                      decoration: BoxDecoration(
                        color: homePageBgLightPurpleClr,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Center(
                        child: display.isEmpty
                            ? Text(
                                "Yay! you have no outstanding Tasks",
                              )
                            : Center(
                                child: display[index],
                              ),
                      ),
                      // Image.asset(images, fit: BoxFit.fitHeight),
                    );
                  },
                  options: CarouselOptions(
                    scrollPhysics: taskList.length <= 1
                        ? NeverScrollableScrollPhysics()
                        : AlwaysScrollableScrollPhysics(),
                    autoPlay: taskList.length <= 1 ? false : true,
                    autoPlayInterval: Duration(seconds: 5),
                    height: MediaQuery.of(context).size.width * 0.4,
                    enableInfiniteScroll: true,
                    enlargeCenterPage: true,
                    onPageChanged: (index, reason) {
                      setState(
                        () => activeIndex = index,
                      );
                    },
                  ),
                );
              }
            },
          ),
          SizedBox(height: 16.0),
          FutureBuilder(
            future: awaitMethod(),
            builder: (context, snapshot) {
              return buildIndicator();
            },
          ),
        ],
      ),
    );
  }

  Widget buildIndicator() {
    return AnimatedSmoothIndicator(
      onDotClicked: animateToSlide,
      effect: ExpandingDotsEffect(
        dotHeight: 12,
        dotWidth: 12,
        activeDotColor: Colors.lightBlue,
      ),
      activeIndex: activeIndex,
      count: taskList.length,
    );
  }

  void animateToSlide(int index) => controller.animateToPage(index);
}
