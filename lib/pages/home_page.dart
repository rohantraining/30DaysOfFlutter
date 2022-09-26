// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert'; //dart convert provides json encoder decoder

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_2/utils/routes.dart';
import 'package:velocity_x/velocity_x.dart';

import 'package:flutter_application_2/models/catalog.dart';
import 'package:flutter_application_2/widgets/drawer.dart';
import 'package:flutter_application_2/widgets/themes.dart';

import '../widgets/home_widgets/catalog_header.dart';
import '../widgets/home_widgets/catalog_list.dart';
import '../widgets/item_widget.dart';
// import 'home_widgets/catalog_header.dart';
// import 'home_widgets/catalog_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final int days = 30;

  final String name = "Rohan";

  @override
  void initState() {
    super.initState();
    loadData(); //loadData ek method hain
  }

  loadData() async {
    await Future.delayed(Duration(seconds: 2));
    // await, sync matlab time lo aur sab load karo, file do
    final catalogJson =
        await rootBundle.loadString("assets/files/catalog.json");
    final decodedData = jsonDecode(
        catalogJson); // json decode gives dynamic value matlab string se dusre format mein convert karna,
    //json encode means dusre format se string mein convert karna
    var productsData = decodedData["products"];
    CatalogModel.items = List.from(productsData)
        .map<Item>((item) => Item.fromMap(item))
        .toList();
    setState(() {}); //list of item
  }

  @override
  Widget build(BuildContext context) {
    //build method hain
    return Scaffold(
        backgroundColor: MyTheme.creamColor,
        floatingActionButton: FloatingActionButton(
          backgroundColor: MyTheme.darkBluishColor, //for cart button
          onPressed: () => Navigator.pushNamed(context, MyRoutes.cartRoute),
          child: Icon(CupertinoIcons.cart),
        ),
        body: SafeArea(
          child: Container(
            padding: Vx
                .m32, //32 ki paddin from all sides basically just like edgeinsets.all ki tarah hain
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CatalogHeader(),
                if (CatalogModel.items != null && CatalogModel.items.isNotEmpty)
                  CatalogList().py16().expand()
                else
                  CircularProgressIndicator()
                      .centered()
                      .expand(), //padding from yaxis
              ],
            ),
          ),
        ));
  }
}

class CatalogImage extends StatelessWidget {
  final String image;
  const CatalogImage({
    Key? key,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.network(image)
        .box
        .rounded
        .p16 //andar kaa white kaa
        .color(MyTheme.creamColor)
        .make()
        .p16() // pura box ka
        .w40(context);
  }
}
