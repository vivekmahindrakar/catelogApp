import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/catelog.dart';
import 'package:flutter_application_1/pages/product_details_page.dart';
import 'package:flutter_application_1/utils/routes/myroutes.dart';
import 'package:flutter_application_1/utils/themes/theme.dart';
import 'package:flutter_application_1/widget/homeWidgets/catelog_image.dart';
import 'package:velocity_x/velocity_x.dart';

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
                ElevatedButton(
                  onPressed: (() {}),
                  child: "Buy".text.color(Colors.white).make(),
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(MyTheme.darkBlue),
                      shape: MaterialStateProperty.all(StadiumBorder())),
                )
              ],
            ).pOnly(right: 8.0)
          ],
        ))
      ],
    )).rounded.square(150).color(Colors.white).make().p(10);
  }
}
