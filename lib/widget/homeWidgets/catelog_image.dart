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
    return Image.network(item.image).box.rounded.p12.make().w32(context).p(10);
  }
}
