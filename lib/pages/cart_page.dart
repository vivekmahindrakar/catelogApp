import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/cart.dart';
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
    final cart = CartModel();
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        VxBuilder(
            builder: ((context, store, status) =>
                "\$${cart.totalPrice}".text.xl4.make()),
            mutations: const {RemoveMutation}),
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

class CartList extends StatelessWidget {
  final cart = CartModel();
  Widget build(BuildContext context) {
    VxState.watch(context, on: [RemoveMutation]);
    return cart.item.length == 0
        ? "Nothing to show".text.xl3.make().centered()
        : ListView.builder(
            itemCount: cart.item.length,
            itemBuilder: (context, index) {
              return ListTile(
                leading: Icon(Icons.done),
                title: cart.item[index].name.text.make(),
                trailing: IconButton(
                    onPressed: () {
                      RemoveMutation(cart.item[index]);
                      // setState(() {});
                    },
                    icon: Icon(Icons.remove_circle_outline)),
              );
            },
          );
  }
}
