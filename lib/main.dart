import 'package:flutter/material.dart';

import 'package:matcher/matcher.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Material(
        child: Center(
          child: Container(
            child: Text("We won the Battle"),
          ),
        ),
      ),
    );
  }
}
