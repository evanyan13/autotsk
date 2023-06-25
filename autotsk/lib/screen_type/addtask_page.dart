import 'package:autotsk/util/color.dart';
import 'package:flutter/material.dart';
import 'package:autotsk/util/text_input_field.dart';
import 'package:autotsk/util/multi_line_text_input.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: 1000,
          height: 1000,
          decoration: BoxDecoration(
            color: signUpBgColour,
          ),
          child: Column(
            children: <Widget>[
              SizedBox(height: 15),
              Container(
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
                    SizedBox(
                      width: 5,
                    ),
                  ],
                ),
              ),

              /* Stack(
                children: <Widget>[
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.all(
                        Radius.circular(40.0),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 5,
                    top: 5,
                    child: Container(
                      height: 30,
                      width: 30,
                      child: ElevatedButton(
                        onPressed: () {},
                        child: Text(
                          'X',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 22,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: signUpBgColour,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(50.0),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ), */
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
              SizedBox(height: 5),
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
              Container(
                width: 330,
                child: TextInputField(
                  textEditingController: _titleController,
                  hintText: 'Add a title',
                  textInputType: TextInputType.text,
                ),
              ),
              SizedBox(height: 20),
              Row(
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
                            Container(
                              width: 141,
                              child: TextInputField(
                                textEditingController: _dateController,
                                hintText: 'Add a Date',
                                textInputType: TextInputType.text,
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
                            Container(
                              width: 141,
                              child: TextInputField(
                                textEditingController: _priorController,
                                hintText: 'Priority level',
                                textInputType: TextInputType.text,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
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
                  Row(
                    children: [
                      SizedBox(width: 28),
                      SizedBox(
                        width: 50,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: crossbuttonColor,
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
                          color: catColor,
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
                          color: catColor,
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
                          color: catColor,
                          borderRadius: BorderRadius.all(
                            Radius.circular(10.0),
                          ),
                        ),
                      ),
                    ],
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
                    // print('hello');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: crossbuttonColor,
                    padding: EdgeInsets.fromLTRB(50, 0, 50, 0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(15.0),
                      ),
                    ),
                  ),
                  child: Text(
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
