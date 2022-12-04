import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/store.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../models/cart.dart';
import '../../models/catelog.dart';
import '../../utils/themes/theme.dart';

class AddToCart extends StatelessWidget {
  final Item catItem;
  AddToCart({
    Key? key,
    required this.catItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on: [AddMutation]);
    CartModel _cart = (VxState.store as MyStore).cart!;
    bool isInCart = _cart.item.contains(catItem);
    return ElevatedButton(
      onPressed: (() {
        if (!isInCart) {
          AddMutation(catItem);
          //setState(() {});
        }
      }),
      child: isInCart ? Icon(Icons.done) : Icon(CupertinoIcons.cart_badge_plus),
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(MyTheme.darkBlue),
          shape: MaterialStateProperty.all(StadiumBorder())),
    );
  }
}
