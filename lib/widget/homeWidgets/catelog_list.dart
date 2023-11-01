// ignore_for_file: public_member_api_docs, sort_constructors_first
//import 'dart:js';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/widget/homeWidgets/add_to_cart.dart';
import 'package:velocity_x/velocity_x.dart';

import 'package:flutter_application_1/models/catelog.dart';
import 'package:flutter_application_1/pages/product_details_page.dart';
import 'package:flutter_application_1/widget/homeWidgets/catelog_image.dart';

class CatelogList extends StatelessWidget {
  const CatelogList({super.key});

  @override
  Widget build(BuildContext context) {
    return !context.isMobile
        ? GridView.builder(
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
            padding: EdgeInsets.only(top: 20),
            itemCount: Catelog.Items.length,
            itemBuilder: (context, index) {
              Item catelog = Catelog.Items[index];
              return InkWell(
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ProductDetails(
                                item: catelog,
                              ))),
                  child: CatelogItem(item: catelog));
            },
          )
        : ListView.builder(
            padding: EdgeInsets.only(top: 20),
            itemCount: Catelog.Items.length,
            itemBuilder: (context, index) {
              Item catelog = Catelog.Items[index];
              return InkWell(
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ProductDetails(
                                item: catelog,
                              ))),
                  child: CatelogItem(item: catelog));
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
    var children2 = [
      Hero(tag: item.id, child: CatelogImage(item: item).color(Colors.white)),
      Expanded(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          item.name.text.lg.bold.make(),
          item.desc.text.textStyle(context.captionStyle).bold.make(),
          12.heightBox,
          ButtonBar(
            alignment: MainAxisAlignment.spaceBetween,
            children: [
              "\$${item.price}".text.xl.bold.make(),
              AddToCart(
                catItem: item,
              )
            ],
          ).p(0)
        ],
      ))
    ];
    return VxBox(
            child: !context.isMobile
                ? Column(
                    children: children2,
                  )
                : Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: children2,
                  ))
        .rounded
        .square(160)
        .color(Colors.white)
        .make()
        .pOnly(
            top: context.isMobile ? 10 : 20,
            bottom: context.isMobile ? 10 : 20,
            right: context.isMobile ? 0 : 10,
            left: context.isMobile ? 0 : 10);
  }
}
