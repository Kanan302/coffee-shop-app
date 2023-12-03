import 'package:flutter/material.dart';
import 'signup.dart';
import 'package:coffee_shop_app/reusable_widget/reusable_widget.dart';
import 'homepage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';


class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreen();
}


class _SignInScreen extends State<SignInScreen> {

  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _passwordTextController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
            Color(0xffD8B660),
            Color(0xff946E32),
            Color(0xff614720),
            Color(0xff2A1502),
          ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
          child: Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: <Widget>[
                    logoImage("photos/coffee_shop_icon.png"),
                    resuableTextField("Enter Email", Icons.person_outlined,
                        false, _emailTextController),
                    SizedBox(
                      height: 30,
                    ),
                    resuableTextField("Enter Password", Icons.lock_outlined,
                        true, _passwordTextController),
                    SizedBox(
                      height: 30,
                    ),
                    SignInSignUpButton(context, true, () async{ 
                      await Firebase.initializeApp();
                      await FirebaseAuth.instance.signInWithEmailAndPassword(
                        email: _emailTextController.text, 
                        password: _passwordTextController.text,
                      )
                      .then((value) {Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));})
                      .onError((error, stackTrace) {print("Error: ${error.toString()}");});
                    }),
                    signUpOption()
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }


  Row signUpOption() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Don't have an account?",
          style: TextStyle(color: Colors.white70, fontSize: 14),
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpScreen()));
          },
          child: Text(
            " Sign Up",
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.w700, fontSize: 14),
          ),
        )
      ],
    );
  }
}
