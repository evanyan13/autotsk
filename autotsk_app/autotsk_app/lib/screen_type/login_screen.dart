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
              /* SvgPicture.asset(
                'assets/ic_instagram.svg',
                height: 64,
                color: primaryColor,
              ), */

              SizedBox(height: 20.0),
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
              Container(
                child: const Text('Log In'),
                width: double.infinity,
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(vertical: 12.0),
                decoration: const ShapeDecoration(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(4))),
                  color: blueColor,
                ),
              ),

              Flexible(child: Container(), flex: 1),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    child: Text("Don't have an account?"),
                    padding: const EdgeInsets.symmetric(vertical: 8),
                  ),
                  SizedBox(width: 10.0),
                  GestureDetector(
                    onTap: () {},
                    child: Text("Sign Up",
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    // padding: const EdgeInsets.symmetric(vertical: 8),
                  ),
                ],
              ),

              // transitioning to signup page
            ],
          ),
        ),
      ),
    );
  }
}
