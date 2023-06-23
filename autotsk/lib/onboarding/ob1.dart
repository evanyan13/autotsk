import 'package:flutter/material.dart';
import 'package:autotsk/util/color.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OnboardingFirst extends StatefulWidget {
  const OnboardingFirst({super.key});

  @override
  State<OnboardingFirst> createState() => _OnboardingFirstState();
}

class _OnboardingFirstState extends State<OnboardingFirst> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
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

          Image(
            image: AssetImage('assets/Person1.png'),
            height: 500,
            width: 500,
          ),

          // Avatar in the middle of the page image
          Stack(
            clipBehavior: Clip.none,
            children: <Widget>[
              // Container for short description
              Container(
                width: 300,
                height: 150,
                child: Text(
                  'short description of onboarding process',
                  style: TextStyle(
                    fontFamily: 'Neometric',
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(20.0),
                  ),
                  color: Colors.grey,
                ),
                padding: EdgeInsets.fromLTRB(20.0, 15.0, 10.0, 10.0),
              ),

              Positioned(
                child: Stack(
                  children: <Widget>[
                    // sign in button
                    Image(
                      image: AssetImage('assets/signin.png'),
                    ),

                    Stack(
                      children: <Widget>[
                        Positioned(
                          child: Text(
                            'Sign in',
                            style: TextStyle(
                              fontFamily: 'Neometric',
                              fontSize: 20,
                              color: mainLightBgColour,
                            ),
                          ),
                          left: 40,
                          top: 15,
                        ),
                        Opacity(
                          opacity: 0,
                          child: Container(
                            child: FractionallySizedBox(
                              alignment: Alignment.center,
                              widthFactor: 1.0,
                              heightFactor: 1.0,
                              child: TextButton(
                                onPressed: () {
                                  // TO REMOVE
                                  print('hello');
                                },
                                child: Text(''),
                              ),
                              /* shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(20.0),
                                ),
                              ), */
                            ),
                            margin: EdgeInsets.fromLTRB(4.0, 0.0, 0.0, 0.0),
                            height: 60,
                            width: 130,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(20.0),
                              ),
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                bottom: -30,
                left: 200,
              ),
            ],
          ),
        ],
      ),
    )));
  }
}
