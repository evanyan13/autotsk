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
  List<String> items = ["item 0"];
  late int tasksCount;
  late String username;
  List<String> taskList = [];

  Future<void> addtasktoItems() async {
    QuerySnapshot<Map<String, dynamic>> tasksCollection =
        await FirebaseFirestore.instance
            .collection('users')
            .doc(FirebaseAuth.instance.currentUser!.uid)
            .collection('tasks')
            .get();

    if (items.length != tasksCollection.docs.length) {
      for (int i = 1; i < tasksCollection.docs.length; i++) {
        items.add("items ${i}");
      }
      if (items.length > tasksCollection.docs.length) {
        items.length = tasksCollection.docs.length;
      }

      if (items.length > 8) {
        items.length = 8;
      }
    }
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
    // return snap.docs.map((task) => task.data()).toList();
  }

  Future getAllTaskremoveDup() async {
    Set<String> seen = Set<String>();
    taskList = taskList.where((task) => seen.add(task)).toList();

    return taskList;
  }

  @override
  void initState() {
    addtasktoItems();
    getAllTaskDetails();
    getAllTaskremoveDup();
    super.initState();
  }

  Future<DocumentSnapshot> getinfo(String taskid) async {
    DocumentSnapshot task = await FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection('tasks')
        .doc(taskid)
        .get();

    return task;
  }

  Future<Widget> buildDisplay(String taskid) async {
    DocumentSnapshot task = await getinfo(taskid);
    TaskModel taskModel = TaskModel(
      uid: task['Task ID'],
      title: task['title'],
      date: task['date'],
      startTime: task['Start Time'],
      endTime: task['end Time'],
      priority: task['priority'],
      location: task['Location'],
      notes: task['Notes'],
    );

    return Container(
      child: Text('hello'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FutureBuilder(
            future: getAllTaskremoveDup(),
            builder: (context, snapshot) {
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
                      child: Row(
                        children: <Widget>[
                          Text('$index'),
                        ],
                      ),
                    ),
                    // Image.asset(images, fit: BoxFit.fitHeight),
                  );
                },
                options: CarouselOptions(
                  height: MediaQuery.of(context).size.width * 0.4,
                  enableInfiniteScroll: true,
                  enlargeCenterPage: true,
                  onPageChanged: (index, reason) =>
                      setState(() => activeIndex = index),
                ),
              );
            },
          ),
          SizedBox(height: 16.0),
          buildIndicator(),
        ],
      ),
    );
  }

  Widget buildIndicator() => AnimatedSmoothIndicator(
        onDotClicked: animateToSlide,
        effect: ExpandingDotsEffect(
            dotHeight: 12, dotWidth: 12, activeDotColor: Colors.lightBlue),
        activeIndex: activeIndex,
        count: items.length,
      );

  void animateToSlide(int index) => controller.animateToPage(index);

  Widget buildItem(String items, int index) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.8,
      decoration: BoxDecoration(
        color: homePageBgLightPurpleClr,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Center(
        child: Row(
          children: <Widget>[
            Center(
              child: Text('$index'),
            ),
          ],
        ),
      ),
      // Image.asset(images, fit: BoxFit.fitHeight),
    );
  }
}
