import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Material(
        child: Center(
          child: Text(
            "This is the login page",
            style: TextStyle(
                fontSize: 40,
                fontFamily: "Raleway",
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 255, 59, 157)),
          ),
        ),
      ),
    );
  }
}
