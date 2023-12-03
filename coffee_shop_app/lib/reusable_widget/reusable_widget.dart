import 'package:flutter/material.dart';

Image logoImage(String imagename) {
  return Image.asset(
    imagename,
    fit: BoxFit.fitWidth,
    width: 240,
    height: 240,
  );
}

TextField resuableTextField(String text, IconData icon, bool isPasswordType,
    TextEditingController controller) {
  bool isPasswordVisible = false;

  return TextField(
    controller: controller,
    obscureText: isPasswordType && !isPasswordVisible,
    enableSuggestions: !isPasswordType,
    autocorrect: !isPasswordType,
    cursorColor: Colors.white,
    style: TextStyle(
        color: Colors.white.withOpacity(0.9),
        fontWeight: FontWeight.w600,
        fontSize: 19),
    decoration: InputDecoration(
      prefixIcon: Icon(
        icon,
        color: Colors.white70,
      ),
      labelText: text,
      labelStyle: TextStyle(color: Colors.white.withOpacity(0.9)),
      filled: true,
      floatingLabelBehavior: FloatingLabelBehavior.never,
      fillColor: Colors.white.withOpacity(0.3),
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
          borderSide: BorderSide(width: 0, style: BorderStyle.none)),
      // suffixIcon: isPasswordType
      //     ? IconButton(
      //         icon: Icon(
      //           isPasswordVisible
      //               // ignore: dead_code
      //               ? Icons.visibility
      //               : Icons.visibility_off,
      //           color: Colors.white70,
      //         ),
      //         onPressed: () {
      //           isPasswordVisible = !isPasswordVisible;
      //         },
      //       )
      //     : null,
    ),
    keyboardType: isPasswordType
        ? TextInputType.visiblePassword
        : TextInputType.emailAddress,
  );
}
Container SignInSignUpButton(BuildContext context, bool isLogin, Function ontap) {
  return Container(
    width: MediaQuery.of(context).size.width,
    height: 50,
    margin: EdgeInsets.fromLTRB(0, 10, 0, 20),
    decoration: BoxDecoration(borderRadius: BorderRadius.circular(90)),
    child: ElevatedButton(
      onPressed: () {
        ontap();},
      child: Text(
        isLogin ? "Log In" : "Sign Up",
        style: TextStyle(
          color: Colors.black87,
          fontWeight: FontWeight.bold,
          fontSize: 19,
        ),
      ),
      style: ButtonStyle( 
          backgroundColor: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.pressed)) {
              return Colors.black26;
            }
            return Colors.white;
          }),
          shape: MaterialStateProperty.all(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)))),
    ),
  );
}


final backgroundColor = Colors.grey[300];
