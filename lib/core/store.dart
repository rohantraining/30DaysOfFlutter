import 'package:flutter_application_2/models/cart.dart';
import 'package:velocity_x/velocity_x.dart';

import '../models/catalog.dart';

//store will carry all operations permirmed in the app
//creating an object of 2 midels ie cart and catalog
class MyStore extends VxStore {
  late CatalogModel catalog;
  late CartModel cart;

  MyStore() {
    //catalog is constructor and we initialize by writing CatalogModel
    catalog = CatalogModel();
    cart = CartModel();
    cart.catalog = catalog;
  }
}
