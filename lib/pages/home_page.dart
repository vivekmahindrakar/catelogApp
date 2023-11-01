// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'dart:io';
//import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter_application_1/core/store.dart';
import 'package:flutter_application_1/models/cart.dart';
import 'package:flutter_application_1/utils/routes/myroutes.dart';
import 'package:flutter_application_1/widget/homeWidgets/catelog_list.dart';
import "package:velocity_x/velocity_x.dart";
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

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
    final response = await rootBundle.loadString("assets/files/catelog.json");
    // String url = "https://api.jsonbin.io/b/604dbddb683e7e079c4eefd3";
    // String url = "http://localhost:9000/.netlify/functions/app";
    // var response = await http.get(Uri.parse(url));
    final catelogJson = jsonDecode(response);
    var products = catelogJson["products"];
    Catelog.Items =
        List.from(products).map((item) => Item.fromMap(item)).toList();

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final _cart = (VxState.store as MyStore).cart;
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
      floatingActionButton: VxBuilder(
        mutations: const {AddMutation, RemoveMutation},
        builder: (context, store, status) => FloatingActionButton(
          backgroundColor: MyTheme.darkBlue,
          onPressed: () {
            Navigator.pushNamed(context, MyRoutes.CartsPage);
          },
          child: Icon(CupertinoIcons.cart),
        ).badge(
            color: _cart!.item.length == 0
                ? Color.fromARGB(255, 231, 231, 231)
                : Color.fromARGB(255, 211, 37, 24),
            count: _cart.item.length,
            size: 21.5),
      ),
    );
  }
}
