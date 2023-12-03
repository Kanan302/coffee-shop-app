import 'package:coffee_shop_app/screens/signin.dart';
import 'package:flutter/material.dart';
import 'package:coffee_shop_app/reusable_widget/reusable_widget.dart';
// import 'homepage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController _confirmPasswordController = TextEditingController();
  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _passwordTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          "Sign Up",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xffD8B660),
              Color(0xff946E32),
              Color(0xff614720),
              Color(0xff2A1502),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: <Widget>[
                  logoImage("photos/coffee_shop_icon.png"),
                  resuableTextField(
                    "Enter Email",
                    Icons.person_outlined,
                    false,
                    _emailTextController,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  resuableTextField(
                    "Enter Password",
                    Icons.lock_outlined,
                    true,
                    _passwordTextController,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  resuableTextField(
                    "Confirm Password",
                    Icons.lock_outlined,
                    true,
                    _confirmPasswordController,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  SignInSignUpButton(context, false, () async {
                    if (_passwordTextController.text == _confirmPasswordController.text) {
                      await Firebase.initializeApp();
                      await FirebaseAuth.instance.createUserWithEmailAndPassword(
                        email: _emailTextController.text,
                        password: _passwordTextController.text,
                      );
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("Created account"),
                          duration: Duration(seconds: 2),
                        ),
                      );
                      Navigator.push(context, MaterialPageRoute(builder: (context) => SignInScreen()),)
                      .onError((error, stackTrace) {
                        print("Error ${error.toString()}");
                      });
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("Passwords do not match"),
                          duration: Duration(seconds: 3),
                        ),
                      );
                    }
                  }),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
