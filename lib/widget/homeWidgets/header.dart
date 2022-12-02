import 'package:flutter/material.dart';
import 'package:flutter_application_1/utils/themes/theme.dart';
import 'package:velocity_x/velocity_x.dart';

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
