import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/catelog.dart';
import 'package:velocity_x/velocity_x.dart';

class CatelogImage extends StatelessWidget {
  const CatelogImage({
    Key? key,
    required this.item,
  }) : super(key: key);
  final Item item;
  @override
  Widget build(BuildContext context) {
    return Image.network(item.image)
        .box
        .rounded
        .p12
        .make()
        .wPCT(context: context, widthPCT: context.isMobile ? 32 : 20)
        .p(10);
  }
}
