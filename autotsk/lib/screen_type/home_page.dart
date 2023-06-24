import 'package:flutter/material.dart';
import 'package:autotsk/util/color.dart';
import 'package:autotsk/screen_type/side_bar.dart';
import 'package:autotsk/screen_type/calendar_page.dart';
import 'package:autotsk/screen_type/to_do_page.dart';

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
        title: Image.asset("assets/LogoLight.png"),
        centerTitle: true,
        backgroundColor: homePageBgDarkPurpleClr,
        elevation: 0,
        // leading: IconButton(
        //   icon: const Icon(Icons.menu_rounded),
        //   onPressed: () {},
        // ),
        actions: <Widget>[
          Padding(padding: EdgeInsets.symmetric(horizontal: 8),
            child: Transform.scale(
              scale: 0.8,
              child: CircleAvatar(
                  radius: 24,
                  backgroundColor: Colors.white,
                  child: CircleAvatar(
                    backgroundImage: AssetImage("assets/profileAvatar.png"),
                    radius: 20,
                  )))
          )
        ],
      ),
      drawer: SideBar(),
    );
  }
}
