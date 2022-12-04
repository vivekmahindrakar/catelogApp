import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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

  CartModel _cart = new CartModel();

  @override
  Widget build(BuildContext context) {
    bool isInCart = _cart.item.contains(catItem);
    return ElevatedButton(
      onPressed: (() {
        if (!isInCart) {
          isInCart = isInCart.toggle();
          Catelog _catelog = new Catelog();

          _cart.catelog = _catelog;
          _cart.add(catItem);
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
