// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
//import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter_application_1/utils/routes/myroutes.dart';
import 'package:flutter_application_1/widget/homeWidgets/catelog_list.dart';
import "package:velocity_x/velocity_x.dart";
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_application_1/models/catelog.dart';
import 'package:flutter_application_1/utils/themes/theme.dart';

import '../widget/homeWidgets/header.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(Duration(seconds: 3));
    final catelogStr = await rootBundle.loadString("assets/files/catelog.json");
    final catelogJson = jsonDecode(catelogStr);
    var products = catelogJson["products"];
    Catelog.Items =
        List.from(products).map((item) => Item.fromMap(item)).toList();

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: Vx.m24,
          margin: EdgeInsets.only(),
          decoration: BoxDecoration(color: MyTheme.cream),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Header(),
              SizedBox(
                height: 20,
              ),
              if (Catelog.Items.isNotEmpty)
                CatelogList().expand()
              else
                CircularProgressIndicator().centered().expand()
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: MyTheme.darkBlue,
        onPressed: () {
          Navigator.pushNamed(context, MyRoutes.CartsPage);
        },
        child: Icon(CupertinoIcons.cart),
      ),
    );
  }
}
