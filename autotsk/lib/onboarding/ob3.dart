import 'package:flutter/material.dart';
import 'package:autotsk/util/color.dart';
import 'package:autotsk/routing/hero_dialog_route.dart';
import 'package:autotsk/screen_type/signin_page.dart';
import 'package:autotsk/util/ListOfQuotes.dart';

class OnboardingThird extends StatefulWidget {
  const OnboardingThird({super.key});

  @override
  State<OnboardingThird> createState() => _OnboardingThirdState();
}

class _OnboardingThirdState extends State<OnboardingThird> {
  Widget UIquoteDisplay() {
    return ListOfQuotes().quoteDisplay();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: SafeArea(
          child: Container(
        // width and height to be edited to be proportional
        // to the page instead of hard coding values.
        width: 1000,
        height: 1000,
        decoration: BoxDecoration(
          /* borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50),
                  topRight: Radius.circular(50),
                  bottomLeft: Radius.circular(50),
                  bottomRight: Radius.circular(50),
                ), */
          gradient: LinearGradient(
              begin: Alignment(-1.0762932300567627, -2.155672550201416),
              end: Alignment(2.155672788619995, -5.058534145355225),
              colors: [
                mainLightBgColour,
                mainLightBgColour2,
              ]),
        ),

        child: Column(
          children: <Widget>[
            // autoTsk logo image
            Row(children: <Widget>[
              SizedBox(
                width: 15,
              ),
              Column(
                children: <Widget>[
                  SizedBox(
                    height: 10,
                  ),
                  Image(
                    image: AssetImage('assets/logobg.png'),
                  ),
                ],
              ),
            ]),

            // Avatar in the middle of the page image
            Image(
              image: AssetImage('assets/businessguy.png'),
              height: 500,
            ),

            Stack(
              clipBehavior: Clip.none,
              children: <Widget>[
                // Container for short description
                Container(
                  width: 300,
                  height: 150,
                  child: UIquoteDisplay(),
                  decoration: BoxDecoration(
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 10,
                      ),
                    ],
                    borderRadius: BorderRadius.all(
                      Radius.circular(20.0),
                    ),
                    color: Colors.white,
                  ),
                  padding: EdgeInsets.fromLTRB(25.0, 20.0, 15.0, 10.0),
                ),

                Positioned(
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).push(
                        HeroDialogRoute(
                          builder: (context) => Center(
                            child: Signin(),
                          ),
                        ),
                      );
                    },
                    child: Image(
                      image: AssetImage('assets/signinButton.png'),
                    ),
                  ),
                  bottom: -30,
                  left: 200,
                ),
              ],
            ),
          ],
        ),
      )),
    ));
  }
}
