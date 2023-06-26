// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:autotsk/animation/custom_rect_tween.dart';
import 'package:flutter/material.dart';
import 'package:autotsk/util/color.dart';
import 'package:autotsk/util/text_input_field.dart';
import 'package:autotsk/auth/auth_methods.dart';
import 'package:autotsk/util/snackbar.dart';
import 'package:autotsk/screen_type/home/home_page.dart';
// dimensions, width: 365, height: 623

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

const String _heroAddTodo = 'add-todo-hero';

class _SignUpState extends State<SignUp> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passWController = TextEditingController();
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _usernameController.dispose();
    _passWController.dispose();
  }

  void signUpUser() async {
    setState(() {
      _isLoading = true;
    });

    String resp = await AuthMethods().signUpUser(
      username: _usernameController.text,
      email: _emailController.text,
      password: _passWController.text,
    );

    setState(() {
      _isLoading = false;
    });

    if (resp == 'success') {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => const HomePage(),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(0.0),
        child: Hero(
          tag: _heroAddTodo,
          createRectTween: (begin, end) {
            return CustomRectTween(begin: begin, end: end);
          },
          child: Material(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
            child: SingleChildScrollView(
              child: Stack(
                clipBehavior: Clip.none,
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      color: signUpBgColour,
                      borderRadius: BorderRadius.all(
                        Radius.circular(20.0),
                      ),
                    ),
                    width: 365,
                    height: 623,
                    child: Column(
                      // mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(
                          height: 40,
                        ),

                        Text(
                          "Sign Up",
                          style: TextStyle(
                            fontFamily: 'Neometric',
                            fontWeight: FontWeight.bold,
                            fontSize: 35,
                          ),
                        ),

                        SizedBox(height: 10),

                        Row(
                          children: <Widget>[
                            SizedBox(width: 40),
                            Text(
                              "Username",
                              style: TextStyle(
                                fontFamily: 'Neometric',
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),

                        SizedBox(height: 5),
                        // text field for email input
                        Row(
                          children: <Widget>[
                            Container(
                              width: 40,
                            ),
                            Expanded(
                              child: TextInputField(
                                textEditingController: _usernameController,
                                hintText: 'Enter your Username',
                                textInputType: TextInputType.text,
                              ),
                            ),
                            Container(
                              width: 35,
                            ),
                          ],
                        ),

                        SizedBox(height: 10),

                        Row(
                          children: <Widget>[
                            SizedBox(width: 40),
                            Text(
                              "Email",
                              style: TextStyle(
                                fontFamily: 'Neometric',
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),

                        SizedBox(height: 5),

                        // text field for email input
                        Row(
                          children: <Widget>[
                            Container(
                              width: 40,
                            ),
                            Expanded(
                              child: TextInputField(
                                textEditingController: _emailController,
                                hintText: 'Enter your Email',
                                textInputType: TextInputType.text,
                              ),
                            ),
                            Container(
                              width: 35,
                            ),
                          ],
                        ),

                        SizedBox(height: 10),

                        Row(
                          children: <Widget>[
                            SizedBox(width: 40),
                            Text(
                              "Password",
                              style: TextStyle(
                                fontFamily: 'Neometric',
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),

                        SizedBox(height: 5),

                        // text field for password input
                        Row(
                          children: <Widget>[
                            Container(
                              width: 40,
                            ),
                            Expanded(
                              child: TextInputField(
                                textEditingController: _passWController,
                                hintText: 'Enter your Password',
                                textInputType: TextInputType.text,
                                isPassW: true,
                              ),
                            ),
                            Container(
                              width: 35,
                            ),
                          ],
                        ),

                        SizedBox(height: 20),

                        SizedBox(
                          height: 50,
                          width: 290,
                          child: ElevatedButton(
                            onPressed: signUpUser,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: signButtonColour,
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
                                    'Sign Up',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Neometric',
                                    ),
                                  ),
                          ),
                        ),

                        SizedBox(height: 20),

                        Opacity(
                          opacity: 0,
                          child: Container(
                            child: Text('Sign Up with Google or Apple'),
                          ),
                        ),

                        Row(
                          children: <Widget>[
                            SizedBox(width: 58),
                            Row(
                              children: <Widget>[
                                Image(
                                  image: AssetImage('assets/strLine.png'),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  'OR',
                                  style: TextStyle(
                                    fontFamily: "Neometric",
                                    fontSize: 16,
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Image(
                                  image: AssetImage('assets/strLine.png'),
                                ),
                              ],
                            ),
                            SizedBox(width: 40),
                          ],
                        ),

                        SizedBox(height: 10),

                        Text(
                          'Sign Up with Google or Apple',
                          style: TextStyle(
                            fontSize: 15,
                            fontFamily: "Neometric",                        
                          ),
                        ),

                        SizedBox(height: 17),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            SizedBox(
                              width: 20,
                            ),
                            Image(
                              image: AssetImage('assets/Googleicon.png'),
                            ),
                            Column(
                              children: <Widget>[
                                Image(
                                  image: AssetImage('assets/Appleicon.png'),
                                ),
                                SizedBox(height: 3),
                              ],
                            ),
                            SizedBox(
                              width: 10,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: 600,
                    right: 155,
                    child: SizedBox(
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
                          'X',
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: "Neometric",
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
