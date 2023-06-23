import 'package:autotsk/screen_type/calendar_page.dart';
import 'package:autotsk/screen_type/to_do_page.dart';
import 'package:autotsk/util/color.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: homePageBgDarkPurpleClr,
      appBar: AppBar(
        title: const Text("A U T O T S K"),
        centerTitle: true,
        backgroundColor: homePageBgDarkPurpleClr,
        elevation: 0,
        // leading: IconButton(
        //   icon: const Icon(Icons.menu_rounded),
        //   onPressed: () {},
        // ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.person),
            onPressed: () {},
          )
        ],
      ),
      drawer: Drawer(
        child: Container(
            color: homePageBgLightPurpleClr,
            child: ListView(children: [
              DrawerHeader(
                  child: Icon(
                Icons.home,
                size: 35,
              )),
              ListTile(
                  leading: Icon(Icons.home),
                  title: Text(
                    "Page 1",
                    style: TextStyle(fontSize: 20),
                  ),
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => CalendarPage()));
                  }),
              ListTile(
                  leading: Icon(Icons.home),
                  title: Text(
                    "Page 2",
                    style: TextStyle(fontSize: 20),
                  ),
                  onTap: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => ToDoPage()));
                  })
            ])),
      ),
    );
  }
}
