// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/cart.dart';
import 'package:velocity_x/velocity_x.dart';

import 'package:flutter_application_1/models/catelog.dart';
import 'package:flutter_application_1/pages/product_details_page.dart';
import 'package:flutter_application_1/utils/routes/myroutes.dart';
import 'package:flutter_application_1/utils/themes/theme.dart';
import 'package:flutter_application_1/widget/homeWidgets/catelog_image.dart';

class CatelogList extends StatelessWidget {
  const CatelogList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
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
    return VxBox(
        child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Hero(tag: item.id, child: CatelogImage(item: item)),
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
                _AddToCart(
                  catItem: item,
                )
              ],
            ).p(0)
          ],
        ))
      ],
    )).rounded.square(160).color(Colors.white).make().py(10);
  }
}

class _AddToCart extends StatefulWidget {
  final Item catItem;
  const _AddToCart({
    Key? key,
    required this.catItem,
  }) : super(key: key);

  @override
  State<_AddToCart> createState() => _AddToCartState();
}

class _AddToCartState extends State<_AddToCart> {
  bool isAdded = false;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: (() {
        isAdded = isAdded.toggle();
        Catelog _catelog = new Catelog();
        CartModel _cart = new CartModel();

        _cart.catelog = _catelog;
        _cart.add(widget.catItem);
        setState(() {});
      }),
      child: isAdded
          ? Icon(Icons.done)
          : "Add to Cart".text.color(Colors.white).make(),
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(MyTheme.darkBlue),
          shape: MaterialStateProperty.all(StadiumBorder())),
    );
  }
}
