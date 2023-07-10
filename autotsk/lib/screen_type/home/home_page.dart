// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, sort_child_properties_last
import 'package:flutter/material.dart';
import 'package:autotsk/util/color.dart';
import 'package:autotsk/screen_type/home/components/body.dart';
import 'package:autotsk/screen_type/common_components/side_bar.dart';
import 'package:autotsk/screen_type/calendar/calendar_page.dart';
import 'package:autotsk/screen_type/to_do/to_do_page.dart';
import 'package:autotsk/screen_type/reminder/reminder_page.dart';
import 'package:autotsk/add_task/addtask_page.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late PageController _pageController;
  int _currentIndex = 0;
  int _previousIndex = 0;
  bool isLight = false;
  List<Widget> pageList = [
    Body(),
    CalendarPage(),
    ToDoPage(),
    ReminderPage(),
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: homePageBgDarkPurpleClr,
      appBar: buildAppBar(),
      drawer: SideBar(),
      body: SizedBox.expand(
        child: PageView(
          controller: _pageController,
          onPageChanged: (index) {
            setState(
              () {
                _currentIndex = index;
              },
            );
          },
          children: <Widget>[
            Body(),
            CalendarPage(),
            ToDoPage(),
            ReminderPage(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add,
          color: Colors.white,
          size: 40,
        ),
        backgroundColor: buttonLightBlueClr,
        hoverColor: buttondarkBlueClr,
        onPressed: () => Navigator.of(context).push(
          MaterialPageRoute(
            builder: ((context) => AddTask()),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.only(bottom: 8.0),
        color: isLight ? mainLightBgColour : homePageBgDarkPurpleClr,
        child: SalomonBottomBar(
          backgroundColor:
              isLight ? mainLightBgColour : homePageBgDarkPurpleClr,
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _previousIndex = _currentIndex;
              _currentIndex = index;
              if (_currentIndex == 1 ||
                  _currentIndex == 2 ||
                  _currentIndex == 3) {
                isLight = true;
              } else if (_currentIndex == 0) {
                isLight = false;
              }
              _pageController.jumpToPage(_currentIndex);
            });
          },
          items: isLight
              ? [
                  SalomonBottomBarItem(
                    icon: Icon(Icons.home),
                    title: Text("Home"),
                    selectedColor: Colors.blue,
                    unselectedColor: buttondarkBlueClr,
                  ),
                  SalomonBottomBarItem(
                    icon: Icon(Icons.calendar_month),
                    title: Text("Calendar"),
                    selectedColor: Colors.blue,
                    unselectedColor: buttondarkBlueClr,
                  ),
                  SalomonBottomBarItem(
                    icon: Icon(Icons.list_rounded),
                    title: Text("To-Do"),
                    selectedColor: Colors.blue,
                    unselectedColor: buttondarkBlueClr,
                  ),
                  SalomonBottomBarItem(
                    icon: Icon(Icons.alarm_rounded),
                    title: Text("Reminder"),
                    selectedColor: Colors.blue,
                    unselectedColor: buttondarkBlueClr,
                  ),
                ]
              : [
                  SalomonBottomBarItem(
                    icon: Icon(Icons.home),
                    title: Text("Home"),
                    selectedColor: Colors.lightBlue,
                    unselectedColor: Colors.white,
                  ),
                  SalomonBottomBarItem(
                    icon: Icon(Icons.calendar_month),
                    title: Text("Calendar"),
                    selectedColor: Colors.lightBlue,
                    unselectedColor: Colors.white,
                  ),
                  SalomonBottomBarItem(
                    icon: Icon(Icons.list_rounded),
                    title: Text("To-Do"),
                    selectedColor: Colors.lightBlue,
                    unselectedColor: Colors.white,
                  ),
                  SalomonBottomBarItem(
                    icon: Icon(Icons.alarm_rounded),
                    title: Text("Reminder"),
                    selectedColor: Colors.lightBlue,
                    unselectedColor: Colors.white,
                  ),
                ],
        ),
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      title: isLight
          ? Image.asset("assets/logobg.png")
          : Image.asset("assets/LogoLight.png"),
      centerTitle: true,
      backgroundColor: isLight ? mainLightBgColour : homePageBgDarkPurpleClr,
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
