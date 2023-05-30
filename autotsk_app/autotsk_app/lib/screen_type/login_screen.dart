import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:autotsk_app/utilities/colors_scheme.dart';
import 'package:autotsk_app/text_input_widget/text_field_input.dart';
import 'package:autotsk_app/resources/auth_methods.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailcontroller = TextEditingController();
  final TextEditingController _passWcontroller = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _emailcontroller.dispose();
    _passWcontroller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 32),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Flexible(child: Container(), flex: 1),
              // logo image
              SizedBox(height: 20.0),

              Container(
                color: thirdColor,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(110.0, 10.0, 110.0, 10.0),
                  child: Text(
                    "autoTsk",
                    style: TextStyle(
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                      color: primaryColor,
                    ),
                  ),
                ),
              ),

              SizedBox(height: 100.0),

              // text field for email
              TextFieldInput(
                textEditingController: _emailcontroller,
                hintText: 'Enter your Email',
                textInputType: TextInputType.emailAddress,
              ),

              SizedBox(height: 20.0),

              // text field for password
              TextFieldInput(
                textEditingController: _passWcontroller,
                hintText: 'Enter your Password',
                textInputType: TextInputType.emailAddress,
                isPassW: true,
              ),

              SizedBox(height: 20.0),

              // button login
              TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/login_comp');
                  },
                  child: Container(
                    child: const Text('Log In',
                        style: TextStyle(color: primaryColor)),
                    width: double.infinity,
                    alignment: Alignment.center,
                    padding: EdgeInsets.symmetric(vertical: 12.0),
                    decoration: const ShapeDecoration(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(4))),
                      color: secondColor,
                    ),
                  )),

              Flexible(child: Container(), flex: 2),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    child: Text(
                      "Don't have an account?",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 8),
                  ),
                  SizedBox(width: 10.0),
                  TextButton(
                    onPressed: () {
                      // route to the signup page when user clicks
                      Navigator.pushNamed(context, '/signup');
                    },
                    child: Text("Sign Up here",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: secondColor,
                        )),
                    // padding: const EdgeInsets.symmetric(vertical: 8),
                  ),
                ],
              ),

              SizedBox(height: 15.0),
              // transitioning to signup page
            ],
          ),
        ),
      ),
    );
  }
}
