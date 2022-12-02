// ignore_for_file: public_member_api_docs, sort_constructors_first
import "package:flutter/material.dart";
import 'package:flutter_application_1/utils/themes/theme.dart';
import "package:velocity_x/velocity_x.dart";

import '../models/catelog.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({
    Key? key,
    required this.item,
  }) : super(key: key);

  final Item item;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Hero(
            tag: item.id,
            child: Image.network(item.image),
          ).h32(context).centered().p16(),
          Expanded(
            child: VxArc(
              edge: VxEdge.TOP,
              arcType: VxArcType.CONVEY,
              height: 20,
              child: Container(
                color: Color.fromARGB(255, 240, 243, 243),
                width: context.screenWidth,
                child: Column(
                  children: [
                    item.name.text.xl4.bold.make(),
                    item.desc.text.xl
                        .textStyle(context.captionStyle)
                        .bold
                        .make(),
                    12.heightBox,
                  ],
                ).py32(),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: ButtonBar(
        alignment: MainAxisAlignment.spaceBetween,
        children: [
          "\$${item.price}".text.xl2.bold.make(),
          ElevatedButton(
            onPressed: (() {}),
            child: "Buy".text.color(Colors.white).make(),
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(MyTheme.darkBlue),
                shape: MaterialStateProperty.all(StadiumBorder())),
          ).wh(100, 50)
        ],
      )
          .pOnly(right: 8.0, bottom: 16, left: 8)
          .color(Color.fromARGB(255, 240, 243, 243)),
    );
  }
}
