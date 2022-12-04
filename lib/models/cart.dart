import 'package:flutter_application_1/core/store.dart';
import 'package:flutter_application_1/models/catelog.dart';
import 'package:velocity_x/velocity_x.dart';

class CartModel {
  static final cartModel = CartModel.initiate();
  CartModel.initiate();

  factory CartModel() => cartModel;

  Catelog _catelog = Catelog();

  Catelog get catelog => _catelog;

  List<num> _itemIds = [];

  set catelog(Catelog newCatelog) {
    _catelog = newCatelog;
  }

  List<num> get setTtemIds => _itemIds;
  set itemIds(int id) {
    _itemIds.add(id);
  }

  List<Item> get item => _itemIds.map((id) => _catelog.getById(id)).toList();

  num get totalPrice =>
      item.fold(0, (previousValue, element) => previousValue + element.price);

//add item
  void add(Item item) {
    _itemIds.add(item.id);
  }

//remove item
  void remove(Item item) {
    _itemIds.remove(item.id);
  }
}

class AddMutation extends VxMutation<MyStore?> {
  final Item item;

  AddMutation(this.item);

  @override
  perform() {
    store!.cart!._itemIds.add(item.id);
    throw UnimplementedError();
  }
}
