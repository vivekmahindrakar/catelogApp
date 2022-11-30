import "package:flutter/material.dart";
import 'package:flutter_application_1/models/catelog.dart';

class ItemWidget extends StatelessWidget {
  final Item item;

  const ItemWidget({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 8),
      child: Card(
        elevation: 0.9,
        child: ListTile(
          leading: Image.network(item.image),
          title: Text(item.name),
          subtitle: Text(item.desc),
          trailing: Text(
            "\$${item.price}",
            style: TextStyle(fontWeight: FontWeight.bold),
            textScaleFactor: 1.3,
          ),
        ),
      ),
    );
  }
}
