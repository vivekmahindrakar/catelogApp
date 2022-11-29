import 'package:flutter/material.dart';
import 'package:flutter_application_1/widget/drawer.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Catelog App",
        ),
      ),
      body: Material(
        child: Center(
          child: Text("This is the Home page"),
        ),
      ),
      drawer: MyDrawer(),
    );
  }
}
