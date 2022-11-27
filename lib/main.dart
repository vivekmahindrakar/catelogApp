import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/home_page.dart';
import 'package:flutter_application_1/pages/login_page.dart';

import 'package:matcher/matcher.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Be The Change",
      themeMode: ThemeMode.light,
      home: HomePage(),
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
      ),
      initialRoute: "/login",
      routes: {"/login": (context) => const LoginPage()},
    );
  }
}
