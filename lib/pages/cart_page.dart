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
      body: Column(
        children: [
          CartList().p12().expand(),
          Divider(),
          SizedBox(
            height: 100,
            child: _cartPrice(),
          )
        ],
      ),
    );
  }
}

class _cartPrice extends StatelessWidget {
  const _cartPrice({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        "\$9999".text.xl4.make(),
        ElevatedButton(
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: "Buying not Supported yet".text.make()));
          },
          child: "Buy".text.make(),
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(MyTheme.darkBlue)),
        ).w24(context).h(50)
      ],
    );
  }
}

class CartList extends StatefulWidget {
  const CartList({super.key});

  @override
  State<CartList> createState() => _CartListState();
}

class _CartListState extends State<CartList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 15,
      itemBuilder: (context, index) {
        return ListTile(
          leading: Icon(Icons.done),
          title: "Item 1".text.make(),
          trailing: IconButton(
              onPressed: () {}, icon: Icon(Icons.remove_circle_outline)),
        );
      },
    );
  }
}
