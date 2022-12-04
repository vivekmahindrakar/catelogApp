import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/cart_page.dart';
import 'package:flutter_application_1/pages/home_page.dart';
import 'package:flutter_application_1/pages/login_page.dart';
import 'package:flutter_application_1/utils/routes/myroutes.dart';
import 'package:flutter_application_1/utils/themes/theme.dart';

import 'package:velocity_x/velocity_x.dart';

import 'core/store.dart';

void main(List<String> args) {
  runApp(VxState(store: MyStore(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Be The Change",
      themeMode: ThemeMode.light,
      debugShowCheckedModeBanner: false,
      //home: HomePage(),
      theme: MyTheme.lightTheme(context),
      initialRoute: MyRoutes.HomePage,
      routes: {
        MyRoutes.LoginPage: (context) => const LoginPage(),
        MyRoutes.HomePage: (context) => const HomePage(),
        MyRoutes.CartsPage: (context) => const CartPage(),
      },
    );
  }
}
