import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:autotsk_app/utilities/colors_scheme.dart';
import 'package:autotsk_app/text_input_widget/text_field_input.dart';
import 'package:autotsk_app/resources/auth_methods.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _emailcontroller = TextEditingController();
  final TextEditingController _passWcontroller = TextEditingController();
  final TextEditingController _biocontroller = TextEditingController();
  final TextEditingController _usernamecontroller = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _emailcontroller.dispose();
    _passWcontroller.dispose();
    _biocontroller.dispose();
    _usernamecontroller.dispose();
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

              // Circular widget to accept and show our selected file.
              Stack(
                children: <Widget>[
                  CircleAvatar(
                    radius: 64,
                    backgroundImage: NetworkImage(
                        'https://images.unsplash.com/photo-1685141138254-f8aae33120e5?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2070&q=80'),
                  ),
                  Positioned(
                    bottom: -10,
                    left: 80,
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.add_a_photo),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 25.0),

              // text field for username
              TextFieldInput(
                textEditingController: _usernamecontroller,
                hintText: 'Enter a username for your account',
                textInputType: TextInputType.name,
              ),

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

              // text field for username
              TextFieldInput(
                textEditingController: _biocontroller,
                hintText: 'Enter a bio',
                textInputType: TextInputType.name,
              ),

              SizedBox(height: 15.0),

              // button login
              InkWell(
                onTap: () async {
                  String res = await AuthMethods().signUpUser(
                    email: _emailcontroller.text,
                    username: _usernamecontroller.text,
                    password: _passWcontroller.text,
                    bio: _biocontroller.text,
                  );
                  print(res);
                },
                child: Container(
                  child: const Text('Sign up'),
                  width: double.infinity,
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(vertical: 12.0),
                  decoration: const ShapeDecoration(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(4))),
                    color: blueColor,
                  ),
                ),
              ),

              Flexible(child: Container(), flex: 1),

              /* Row(
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
              ), */

              // transitioning to signup page
            ],
          ),
        ),
      ),
    );
  }
}
