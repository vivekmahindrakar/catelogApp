// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
//import 'dart:html';

import "package:velocity_x/velocity_x.dart";
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_application_1/models/catelog.dart';
import 'package:flutter_application_1/utils/themes/theme.dart';
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
              Container(
                  padding: EdgeInsets.symmetric(vertical: 220, horizontal: 120),
                  child: Center(child: const CircularProgressIndicator()))
          ],
        ),
      ),
    ));
  }
}

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        "Catelog App".text.xl5.bold.color(MyTheme.darkBlue).make(),
        "Trending Products".text.xl2.bold.color(MyTheme.darkBlue).make(),
      ],
    );
  }
}

class CatelogList extends StatelessWidget {
  const CatelogList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.only(top: 20),
      itemCount: Catelog.Items.length,
      itemBuilder: (context, index) {
        var catelog = Catelog.Items[index];
        return CatelogItem(item: catelog);
      },
    );
  }
}

class CatelogItem extends StatelessWidget {
  const CatelogItem({
    Key? key,
    required this.item,
  }) : super(key: key);
  final Item item;
  @override
  Widget build(BuildContext context) {
    return VxBox(
        child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CatelogImage(item: item),
        Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            item.name.text.lg.bold.make(),
            item.desc.text.textStyle(context.captionStyle).bold.make(),
            ButtonBar(
              alignment: MainAxisAlignment.spaceBetween,
              buttonPadding: Vx.mH8,
              children: [
                "\$${item.price}".text.xl.bold.make(),
                ElevatedButton(
                  onPressed: (() {}),
                  child: "Buy".text.color(Colors.white).make(),
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(MyTheme.darkBlue)),
                )
              ],
            )
          ],
        ))
      ],
    )).rounded.square(150).color(Colors.white).make().p(10);
  }
}

class CatelogImage extends StatelessWidget {
  const CatelogImage({
    Key? key,
    required this.item,
  }) : super(key: key);
  final Item item;
  @override
  Widget build(BuildContext context) {
    return Image.network(item.image).box.rounded.p12.make().w32(context).p(10);
  }
}
