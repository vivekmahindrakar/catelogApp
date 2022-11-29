class Catelog {
  static final Items = [
    Item(1, "Iphone 12 pro", "Apple Iphone 12th gen", 999, "#33505a",
        "https://m.media-amazon.com/images/I/71xkMA+gvYL._SL1500_.jpg")
  ];
}

class Item {
  final int id;
  final String name;
  final String desc;
  final num price;
  final String color;
  final String image;

  Item(this.id, this.name, this.desc, this.price, this.color, this.image);
}
