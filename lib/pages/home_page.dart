import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/catelog.dart';
import 'package:flutter_application_1/widget/drawer.dart';

import '../widget/item_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final dummyList = List.generate(20, (index) => Catelog.Items[0]);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Catelog App",
        ),
      ),
      body: Material(
          child: ListView.builder(
              itemCount: dummyList.length,
              itemBuilder: ((context, index) {
                return ItemWidget(item: dummyList[index]);
              }))),
      drawer: MyDrawer(),
    );
  }
}
