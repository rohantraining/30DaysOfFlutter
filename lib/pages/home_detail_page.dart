import 'package:flutter/material.dart';
import 'package:flutter_application_2/models/catalog.dart';
import 'package:flutter_application_2/widgets/home_widgets/add_to_cart.dart';
import 'package:flutter_application_2/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeDetailPage extends StatelessWidget {
  final Item catalog;

  const HomeDetailPage({Key? key, required this.catalog})
      : assert(catalog != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppBar(backgroundColor: Colors.transparent), //cross button to go back
      backgroundColor: context.canvasColor,
      bottomNavigationBar: Container(
        color: context.cardColor,
        child: ButtonBar(
          alignment: MainAxisAlignment.spaceBetween,
          buttonPadding: EdgeInsets.zero, //edgeinsets.zero = Vx.zero
          children: [
            "\$${catalog.price}"
                .text
                .bold
                .xl4
                .red800
                .make(), //$999 ka size increase hoga
            AddToCart(
              catalog: catalog,
            ).wh(130, 50) // width, height button ka badhtan hain
          ],
        ).p32(),
      ),
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Hero(
              tag: Key(catalog.id.toString()),
              child: Image.network(catalog.image),
            ).h32(context),
            Expanded(
                child: VxArc(
              height: 30.0,
              arcType: VxArcType.CONVEY,
              edge: VxEdge.TOP,
              child: Container(
                color: context
                    .cardColor, //card colour gives black and context.theme.canvascolor gives blue
                width: context.screenWidth,
                child: Column(
                  children: [
                    catalog.name.text.xl4
                        .color(context
                            .accentColor) //iphone12 pro ko white font dega
                        .bold
                        .make(),
                    catalog.desc.text.textStyle(context.captionStyle).xl.make(),
                    10.heightBox,
                    "One of the best shops where you will find different types of mobile, laptops, earphones and many more accessories. Check out our trending products and get an additional 10% off from our app. Offer valid till 30th of October,2022!!"
                        .text
                        .textStyle(context.captionStyle)
                        .make()
                        .p16()
                  ],
                ).py64(),
              ),
            ))
          ],
        ),
      ),
    );
  }
}
