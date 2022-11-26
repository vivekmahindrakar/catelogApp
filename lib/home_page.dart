import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/container.dart';
import "package:matcher/matcher.dart";

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("BeeTheChange")),
      backgroundColor: const Color.fromARGB(255, 112, 3, 76),
      body: Material(
        child: Center(
          child: Container(
            child: Text("We won the Battle"),
          ),
        ),
      ),
    );
  }
}
