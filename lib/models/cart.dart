import 'package:flutter_application_2/models/catalog.dart';

class CartModel {
  //creating singleton class
  static final cartModel = CartModel._internal();

  CartModel._internal(); //creating a constructor
  factory CartModel() => cartModel;

  //catalog field
  late CatalogModel _catalog;

  //collection of IDs - store Ids of each item
  final List<int> _itemIds = [];

  CatalogModel get catalog => _catalog;

  set catalog(CatalogModel newCatalog) {
    assert(newCatalog != null);
    _catalog = newCatalog;
  }

  //get items in the cart
  List<Item> get items => _itemIds.map((id) => _catalog.getById(id)).toList();

  //get total price, watch video 6:52:35
  num get totalPrice =>
      items.fold(0, (total, current) => total + current.price);

  //add item
  void add(Item item) {
    _itemIds.add(item.id);
  }

  //remove item
  void remove(Item item) {
    _itemIds.remove(item.id);
  }
}
