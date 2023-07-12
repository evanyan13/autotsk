// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, sort_child_properties_last

import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";
import "package:autotsk/util/color.dart";
import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:autotsk/screen_type/common_components/side_bar.dart';
import 'package:intl/intl.dart';

class CalendarPage extends StatefulWidget {
  const CalendarPage({super.key});

  @override
  State<CalendarPage> createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  // to set the current date to reference from
  DateTime _selectedDate = DateTime.now();
  late int _numMonth = _currentDate.month;

  // to use to get correct reference
  late DateTime _currentDate = _selectedDate;
  late int _currentMonth = _numMonth;
  late int _currentday = _currentDate.day;
  late String _selectedMonth = getMonth(_currentDate.month);

  String getMonth(int currentMonthIndex) {
    return DateFormat('MMM').format(DateTime(0, currentMonthIndex)).toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: mainLightBgColour,
        drawer: SideBar(),
        body: Column(
          children: [
            // To select month of the current view
            buildMonthBar(),
            // Date Picker Slider
            buildDateBar(),
            // showTasks(), returns a Container widget that displays the task
            SizedBox(height: 10),
            showTasks(),
          ],
        ));
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
                    ))))
      ],
    );
  }

  Container buildDateBar() {
    return Container(
      margin: EdgeInsets.only(top: 16, left: 16),
      child: DatePicker(
        _currentDate,
        height: 100,
        width: 80,
        initialSelectedDate: _currentDate,
        daysCount: 31,
        selectionColor: buttondarkPurpleClr,
        selectedTextColor: Colors.white,
        dateTextStyle: TextStyle(
          fontFamily: 'Neometric',
          fontWeight: FontWeight.normal,
          fontSize: 25,
        ),
        onDateChange: (selectedDate) {
          _currentDate = selectedDate;
        },
      ),
    );
  }

  Container buildMonthBar() {
    return Container(
      padding: const EdgeInsets.only(top: 8.0),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(
                  Icons.arrow_back_ios,
                  color: buttondarkBlueClr,
                  size: 16,
                ),
                TextButton(
                  onPressed: () {
                    setState(() {
                      _currentMonth = _currentMonth - 1;
                      _currentDate = DateTime(
                        DateTime.now().year,
                        _currentMonth,
                        _currentday,
                      );
                      _selectedMonth = getMonth(_currentMonth);
                    });
                  },
                  child: Text(
                    "${getMonth(_currentDate.month - 1)}",
                    style: TextStyle(
                      color: buttondarkBlueClr,
                      fontFamily: 'Neometric',
                      fontWeight: FontWeight.normal,
                      fontSize: 14,
                    ),
                  ),
                ),
              ],
            ),
            CupertinoButton(
              child: Container(
                padding: EdgeInsets.all(0.0),
                alignment: Alignment.center,
                height: 60,
                width: 120,
                child: Text(
                  '$_selectedMonth',
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Neometric',
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: buttondarkPurpleClr,
                ),
              ),
              onPressed: () {
                showCupertinoModalPopup(
                  context: context,
                  builder: (BuildContext context) => SizedBox(
                    width: double.infinity,
                    height: 250,
                    child: CupertinoPicker(
                      backgroundColor: Colors.white,
                      itemExtent: 30,
                      scrollController: FixedExtentScrollController(
                        initialItem: _currentMonth - 1,
                      ),
                      children: [
                        Text('January'),
                        Text('February'),
                        Text('March'),
                        Text('April'),
                        Text('May'),
                        Text('June'),
                        Text('July'),
                        Text('August'),
                        Text('September'),
                        Text('October'),
                        Text('November'),
                        Text('December'),
                      ],
                      onSelectedItemChanged: (int currentMonth) {
                        setState(() {
                          _currentMonth = currentMonth + 1;
                          _currentDate = DateTime(
                            _currentDate.year,
                            _currentMonth,
                          );
                          _selectedMonth = getMonth(_currentMonth);
                        });
                      },
                    ),
                  ),
                );
              },
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  _currentMonth = _currentMonth + 1;
                  _currentDate = DateTime(
                    DateTime.now().year,
                    _currentMonth,
                    _currentday,
                  );
                  _selectedMonth = getMonth(_currentMonth);
                });
              },
              child: Text(
                "${getMonth(_currentDate.month + 1)}",
                style: TextStyle(
                  color: buttondarkBlueClr,
                  fontFamily: 'Neometric',
                  fontWeight: FontWeight.normal,
                  fontSize: 14,
                ),
              ),
            ),
            Icon(
              Icons.arrow_forward_ios,
              color: buttondarkBlueClr,
              size: 16,
            ),
          ],
        ),
      ),
    );
  }

  Widget showTasks() {
    return Expanded(
      child: Container(
        color: homePageBgDarkPurpleClr,
        child: Column(
          children: [
            Align(
              widthFactor: 0.5,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(width: 25),
                  Text(
                    "Today's",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      letterSpacing: 1.0,
                      fontFamily: 'Neometric',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 5),
            Container(
              width: 345,
            ),
          ],
        ),
      ),
    );
  }
}
