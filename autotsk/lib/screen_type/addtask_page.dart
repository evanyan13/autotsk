// ignore_for_file: prefer_const_constructors

import 'package:autotsk/util/color.dart';
import 'package:flutter/material.dart';
import 'package:autotsk/util/text_input_field.dart';
import 'package:autotsk/util/multi_line_text_input.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:autotsk/form_Sub/form_method.dart';

class AddTask extends StatefulWidget {
  const AddTask({super.key});

  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _priorController = TextEditingController();
  final TextEditingController _locController = TextEditingController();
  final TextEditingController _notesController = TextEditingController();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  late String uid;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    userId();
  }

  void AddTasktoDb() async {
    setState(() {
      _isLoading = true;
    });

    String resp = await AddFormMethod().AddFormtoUserDb(
      uid: await userId(),
      title: _titleController.text,
      date: _dateController.text,
      priority: _priorController.text,
      location: _locController.text,
      notes: _notesController.text,
    );

    setState(() {
      _isLoading = false;
    });
  }

  Future<String> userId() async {
    DocumentSnapshot snap = await FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get();
    setState(() {
      uid = (snap.data()! as Map<String, dynamic>)['uid'];
    });

    return uid;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: signUpBgColour,
      body: Container(
        padding: EdgeInsets.only(top: 24.0),
        child: SingleChildScrollView(
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height: 15),
                  SizedBox(
                    width: 330,
                    child: Container(
                      child: Row(
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.of(context).pop(context);
                            },
                            child: Image(
                              image: AssetImage('assets/cross-circle.png'),
                              width: 35.0,
                              height: 35.0,
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    width: 330,
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "New Task",
                      style: TextStyle(
                        fontSize: 30,
                        fontFamily: "Neometric",
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.5,
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    width: 330,
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Title",
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: "Neometric",
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.5,
                      ),
                    ),
                  ),
                  SizedBox(height: 3),
                  SizedBox(
                    width: 330,
                    child: TextInputField(
                      textEditingController: _titleController,
                      hintText: 'Add a title',
                      textInputType: TextInputType.text,
                      icon: Icon(Icons.title),
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    child: Row(
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            Container(
                              width: 105,
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Date',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "Neometric",
                                  letterSpacing: 1.5,
                                ),
                              ),
                            ),
                            SizedBox(height: 3),
                            Container(
                              child: Row(
                                children: <Widget>[
                                  SizedBox(width: 33),
                                  SizedBox(
                                    width: 141,
                                    child: TextInputField(
                                      textEditingController: _dateController,
                                      hintText: 'Add a Date',
                                      textInputType: TextInputType.text,
                                      icon: Icon(Icons.calendar_month),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: <Widget>[
                            Container(
                              width: 100,
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Priority',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "Neometric",
                                  letterSpacing: 1.5,
                                ),
                              ),
                            ),
                            SizedBox(height: 3),
                            Container(
                              child: Row(
                                children: <Widget>[
                                  SizedBox(width: 45),
                                  SizedBox(
                                    width: 141,
                                    child: TextInputField(
                                      textEditingController: _priorController,
                                      hintText: 'Priority',
                                      textInputType: TextInputType.text,
                                      icon: Icon(Icons.low_priority_sharp),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Column(
                    children: <Widget>[
                      SizedBox(height: 10),
                      Container(
                        width: 325,
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Category",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            fontFamily: "Neometric",
                            letterSpacing: 1.5,
                          ),
                        ),
                      ),
                      SizedBox(height: 5),
                      Container(
                        child: Row(
                          children: [
                            SizedBox(width: 28),
                            SizedBox(
                              width: 50,
                              height: 50,
                              child: ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: buttondarkBlueClr,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(50.0),
                                    ),
                                  ),
                                ),
                                child: Text(
                                  '+',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: "Neometric",
                                    fontWeight: FontWeight.bold,
                                    fontSize: 35,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 15),
                            Container(
                              width: 80,
                              height: 40,
                              clipBehavior: Clip.none,
                              decoration: BoxDecoration(
                                color: buttonLightBlueClr,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10.0),
                                ),
                              ),
                            ),
                            SizedBox(width: 15),
                            Container(
                              width: 80,
                              height: 40,
                              clipBehavior: Clip.none,
                              decoration: BoxDecoration(
                                color: buttonLightBlueClr,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10.0),
                                ),
                              ),
                            ),
                            SizedBox(width: 15),
                            Container(
                              width: 80,
                              height: 40,
                              clipBehavior: Clip.none,
                              decoration: BoxDecoration(
                                color: buttonLightBlueClr,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10.0),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 15),
                  Container(
                    width: 325,
                    child: Text(
                      "Location",
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: "Neometric",
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.5,
                      ),
                    ),
                  ),
                  SizedBox(height: 3),
                  Container(
                    width: 325,
                    child: TextInputField(
                      textEditingController: _locController,
                      hintText: 'Enter address',
                      textInputType: TextInputType.text,
                      icon: Icon(Icons.location_on),
                    ),
                  ),
                  SizedBox(height: 15),
                  Container(
                    width: 325,
                    child: Text(
                      "Notes",
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: "Neometric",
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.5,
                      ),
                    ),
                  ),
                  SizedBox(height: 3),
                  SizedBox(
                    width: 330,
                    height: 180,
                    child: MultiLineText(
                      textEditingController: _notesController,
                      hintText: 'Add Description',
                      textInputType: TextInputType.multiline,
                    ),
                  ),
                  SizedBox(height: 15),
                  SizedBox(
                    height: 50,
                    width: 335,
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          AddTasktoDb();
                          Navigator.of(context).pop(context);
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: buttondarkBlueClr,
                        padding: EdgeInsets.fromLTRB(50, 0, 50, 0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(15.0),
                          ),
                        ),
                      ),
                      child: _isLoading
                          ? Container(
                              height: 40,
                              child: Center(
                                child: CircularProgressIndicator(
                                  color: mainLightBgColour,
                                ),
                              ),
                            )
                          : Text(
                              'Add Task',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Neometric',
                              ),
                            ),
                    ),
                  ),
                ],
            ),
          ),
        ),
    );
  }
}
