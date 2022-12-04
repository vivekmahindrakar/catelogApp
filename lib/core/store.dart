import 'package:flutter_application_1/models/cart.dart';
import 'package:flutter_application_1/models/catelog.dart';
import 'package:velocity_x/velocity_x.dart';

class MyStore extends VxStore {
  Catelog? catelog;
  CartModel? cart;
  MyStore() {
    catelog = Catelog();
    cart = CartModel();
    cart!.catelog = catelog!;
  }
}
