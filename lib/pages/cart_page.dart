import 'package:flutter/material.dart';
import 'package:flutter_application_2/models/cart.dart';
import 'package:flutter_application_2/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.canvasColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: "Cart".text.make(),
      ),

      body: Column(
        children: [
          _CardList().p32().expand(),
          Divider(),
          _CardTotal(),
        ], //divider ek niche line dikhata hain
      ), //creates white blank page
    );
  }
}

//creating widget for CardTotal
class _CardTotal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _cart = CartModel();
    return SizedBox(
      height: 200,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          "\$${_cart.totalPrice}"
              .text
              .xl5
              .color(context.theme.accentColor)
              .make(),
          30.widthBox,
          ElevatedButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: "Buying not supported yet".text.make(),
              ));
            },
            style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all(context.theme.buttonColor)),
            child: "Buy".text.white.make(),
          ).w32(context)
        ],
      ),
    );
  }
}

class _CardList extends StatefulWidget {
  @override
  State<_CardList> createState() => _CardListState();
}

class _CardListState extends State<_CardList> {
  final _cart = CartModel();
  @override
  Widget build(BuildContext context) {
    return _cart.items.isEmpty
        ? "Nothing to show".text.xl3.makeCentered()
        : ListView.builder(
            itemCount: _cart.items.length, //if not working ?.
            itemBuilder: (context, index) => ListTile(
              leading: Icon(Icons.done), //done icon right box hota hain
              trailing: IconButton(
                icon: Icon(Icons.remove_circle_outline),
                onPressed: () {
                  _cart.remove(_cart.items[index]); //to remove items from cart
                  setState(() {}); //set state to tell that UI is rebuild
                },
              ),
              title: _cart.items[index].name.text.make(),
            ),
          );
  }
}
