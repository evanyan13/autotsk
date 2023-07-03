// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:autotsk/add_task/task_model.dart';
import 'package:autotsk/util/color.dart';
import 'package:flutter/material.dart';
import 'package:autotsk/util/text_input_field.dart';
import 'package:autotsk/util/multi_line_text_input.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:autotsk/util/font_style.dart';
import 'package:quickalert/quickalert.dart';

import 'add_task_db.dart';

class AddTask extends StatefulWidget {
  const AddTask({super.key});

  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _timeController = TextEditingController();
  final TextEditingController _priorController = TextEditingController();
  final TextEditingController _locController = TextEditingController();
  final TextEditingController _notesController = TextEditingController();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  late String uid;
  DateTime _selectedDate = DateTime.now();
  String _startTime = DateFormat("hh:mm a").format(DateTime.now()).toString();
  String _endTime = DateFormat("hh:mm a")
      .format(DateTime.now().add(Duration(hours: 1)))
      .toString();
  bool _isLoading = false;
  String _selectedLevel = "Low";
  List<String> priorityList = [
    "High",
    "Medium",
    "Low",
  ];

  @override
  void initState() {
    super.initState();
    userId();
  }

  void addTasktoDb() async {
    setState(() {
      _isLoading = true;
    });

    final task = TaskModel(
      uid: await userId(),
      title: _titleController.text,
      date: DateFormat.yMd().format(_selectedDate),
      startTime: _startTime,
      endTime: _endTime,
      priority: _selectedLevel,
      location: _locController.text,
      notes: _notesController.text,
    );

    String resp = await AddFormMethod().addFormtoUserDb(task);

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
        padding: EdgeInsets.all(24.0),
        child: SingleChildScrollView(
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              _buildTopBar(),
              _buildTitle(),
              _buildDateRow(),
              _buildTimeRow(),
              _buildCategory(),
              _buildLocation(),
              _buildNotes(),
              _buildAddTaskButton(),
            ],
          ),
        ),
      ),
    );
  }

  Column _buildTopBar() {
    return Column(
      children: [
        SizedBox(height: 16),
        SizedBox(
          width: 330,
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
            ],
          ),
        ),
        SizedBox(height: 32),
        Container(
          width: 330,
          alignment: Alignment.centerLeft,
          child: Text(
            "New Task",
            style: headerStyle,
          ),
        ),
      ],
    );
  }

  Column _buildTitle() {
    return Column(
      children: [
        SizedBox(height: 8),
        Container(
          width: 330,
          alignment: Alignment.centerLeft,
          child: Text(
            "Title",
            style: subHeaderStyle,
          ),
        ),
        SizedBox(
          width: 330,
          child: TextInputField(
            textEditingController: _titleController,
            hintText: 'Add a title',
            textInputType: TextInputType.text,
            icon: Icon(Icons.title),
          ),
        ),
      ],
    );
  }

  Column _buildDateRow() {
    return Column(
      children: [
        SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Column(
              children: <Widget>[
                Container(
                  width: 165,
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Date',
                    style: subHeaderStyle,
                  ),
                ),
                SizedBox(
                  width: 165,
                  child: TextInputField(
                    textEditingController: _dateController,
                    hintText: DateFormat("yMd").format(_selectedDate),
                    textInputType: TextInputType.text,
                    widget: IconButton(
                      icon: Icon(Icons.calendar_month_rounded),
                      color: buttondarkBlueClr,
                      iconSize: 24,
                      onPressed: () {
                        print("Tapped");
                        _getDateFromUser();
                        // _getTimeFromUser(isStartTime: true);
                      },
                    ),
                  ),
                ),
              ],
            ),
            Column(
              // mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: 165,
                  // alignment: Alignment.centerLeft,
                  child: Text(
                    'Priority',
                    style: subHeaderStyle,
                  ),
                ),
                SizedBox(
                  width: 165,
                  child: TextInputField(
                    textEditingController: _priorController,
                    hintText: _selectedLevel,
                    textInputType: TextInputType.text,
                    widget: DropdownButton(
                      icon: Icon(
                        Icons.keyboard_arrow_down_rounded,
                        color: buttondarkBlueClr,
                      ),
                      iconSize: 24,
                      // elevation: 4,
                      underline: Container(height: 0),
                      style: subHeaderStyle,
                      items: priorityList.map<DropdownMenuItem<String>>(
                        (String? level) {
                          return DropdownMenuItem<String>(
                            value: level,
                            child: Text(level!,
                                style: TextStyle(
                                    color: buttondarkBlueClr,
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold)),
                          );
                        },
                      ).toList(),
                      onChanged: (String? newLevel) {
                        setState(() {
                          _selectedLevel = newLevel!;
                        });
                      },
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }

  Column _buildTimeRow() {
    return Column(
      children: [
        SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                Container(
                  width: 165,
                  // alignment: Alignment.centerLeft,
                  child: Text(
                    'Start Time',
                    style: subHeaderStyle,
                  ),
                ),
                SizedBox(
                  width: 165,
                  child: TextInputField(
                    textEditingController: _dateController,
                    hintText: _startTime,
                    textInputType: TextInputType.text,
                    widget: IconButton(
                      icon: Icon(Icons.access_time_rounded),
                      color: buttondarkBlueClr,
                      iconSize: 24,
                      onPressed: () {
                        _getTimeFromUser(isStartTime: true);
                        // _getTimeFromUser(isStartTime: true);
                      },
                    ),
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Container(
                  width: 165,
                  // alignment: Alignment.centerLeft,
                  child: Text(
                    'End Time',
                    style: subHeaderStyle,
                  ),
                ),
                SizedBox(
                  width: 165,
                  child: TextInputField(
                    textEditingController: _dateController,
                    hintText: _endTime,
                    textInputType: TextInputType.text,
                    widget: IconButton(
                      icon: Icon(Icons.access_time_rounded),
                      color: buttondarkBlueClr,
                      iconSize: 24,
                      onPressed: () {
                        _getTimeFromUser(isStartTime: false);
                        // _getTimeFromUser(isStartTime: true);
                      },
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }

  Column _buildCategory() {
    return Column(
      children: <Widget>[
        SizedBox(height: 12),
        Container(
          width: 330,
          alignment: Alignment.centerLeft,
          child: Text(
            "Category",
            style: subHeaderStyle,
          ),
        ),
        SizedBox(height: 4),
        Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
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
              SizedBox(width: 16),
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
              SizedBox(width: 16),
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
              SizedBox(width: 16),
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
    );
  }

  Column _buildLocation() {
    return Column(
      children: [
        SizedBox(height: 12),
        Container(
          width: 325,
          child: Text(
            "Location",
            style: subHeaderStyle,
          ),
        ),
        Container(
          width: 325,
          child: TextInputField(
            textEditingController: _locController,
            hintText: 'Enter address',
            textInputType: TextInputType.text,
            icon: Icon(Icons.location_on),
          ),
        ),
      ],
    );
  }

  Column _buildNotes() {
    return Column(
      children: [
        SizedBox(height: 12),
        Container(
          width: 325,
          child: Text(
            "Notes",
            style: subHeaderStyle,
          ),
        ),
        Container(
          width: 325,
          child: TextInputField(
            textEditingController: _notesController,
            hintText: 'Add Description',
            textInputType: TextInputType.multiline,
            icon: Icon(Icons.note_add),
          ),
        ),
      ],
    );
  }

  Column _buildAddTaskButton() {
    return Column(
      children: [
        SizedBox(height: 16),
        SizedBox(
          height: 50,
          width: 325,
          child: ElevatedButton(
            onPressed: () {
              if (_validateDate() == true) {
                addTasktoDb();
              }
              // setState(() {
              //   _validateDate();
              //   // AddTasktoDb();
              //   // Navigator.of(context).pop(context);
              // });
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: buttondarkBlueClr,
              // padding: EdgeInsets.fromLTRB(50, 0, 50, 0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(15.0),
                ),
              ),
            ),
            child: _isLoading
                ? Container(
                    height: 48,
                    child: Center(
                      child: CircularProgressIndicator(
                        color: mainLightBgColour,
                      ),
                    ),
                  )
                : Text(
                    'Add Task',
                    style: subHeaderStyle,
                  ),
          ),
        ),
      ],
    );
  }

  _getDateFromUser() async {
    DateTime? _pickDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2013),
        lastDate: DateTime(2040));

    if (_pickDate != null) {
      setState(() {
        _selectedDate = _pickDate;
      });
    } else {
      print("No Date Selected");
    }
  }

  _getTimeFromUser({required bool isStartTime}) async {
    var pickedTime = await _showTimePicker();
    String _formatedTime = pickedTime.format(context);
    if (pickedTime == null) {
      print("Time not selected");
    } else if (isStartTime == true) {
      setState(() {
        _startTime = _formatedTime;
      });
    } else if (isStartTime == false) {
      setState(() {
        _endTime = _formatedTime;
      });
    }
  }

  _showTimePicker() {
    return showTimePicker(
        context: context,
        initialEntryMode: TimePickerEntryMode.input,
        initialTime: TimeOfDay(
          hour: int.parse(_startTime.split(":")[0]),
          minute: int.parse(_startTime.split(":")[1].split(" ")[0]),
        ));
  }

  _validateDate() {
    bool funcState = false;
    if (_titleController.text.isNotEmpty) {
      Navigator.of(context).pop(context);
      funcState = true;
    } else if (_titleController.text.isEmpty) {
      return QuickAlert.show(
        context: context,
        type: QuickAlertType.error,
        text: "All Fields are required",
      );
    }
    return funcState;
  }
}
