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
          child: (Catelog.Items.isNotEmpty)
              ? GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
                  itemBuilder: (context, index) {
                    var item = Catelog.Items[index];
                    return Card(
                      clipBehavior: Clip.antiAlias,
                      margin: EdgeInsets.all(10),
                      elevation: 0.3,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      child: GridTile(
                        child: Image.network(item.image),
                        header: Container(
                          decoration: BoxDecoration(
                              color: Color.fromARGB(255, 241, 253, 255)),
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Text(item.name),
                          ),
                        ),
                        footer: Container(
                          decoration: BoxDecoration(
                              color: Color.fromARGB(255, 1, 72, 82)),
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Text(
                              "\$${item.price.toString()}",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                  itemCount: Catelog.Items.length,
                )
              : Center(
                  child: CircularProgressIndicator(),
                )),
      drawer: MyDrawer(),
    );
  }
}
