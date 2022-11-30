import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/models/catelog.dart';
import 'package:flutter_application_1/widget/drawer.dart';

import '../widget/item_widget.dart';

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
      appBar: AppBar(
        title: Text(
          "Catelog App",
        ),
      ),
      body: Material(
          child: (Catelog.Items != null && Catelog.Items.isNotEmpty)
              ? ListView.builder(
                  itemCount: Catelog.Items.length,
                  itemBuilder: ((context, index) {
                    return ItemWidget(item: Catelog.Items[index]);
                  }))
              : Center(
                  child: CircularProgressIndicator(),
                )),
      drawer: MyDrawer(),
    );
  }
}
