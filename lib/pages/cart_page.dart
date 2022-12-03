import 'package:flutter/material.dart';
import 'package:flutter_application_1/utils/themes/theme.dart';
import 'package:velocity_x/velocity_x.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: "Cart".text.textStyle(TextStyle(color: MyTheme.darkBlue)).make(),
      ),
      body: Container(),
    );
  }
}
