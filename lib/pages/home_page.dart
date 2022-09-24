import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert'; //dart convert provides json encoder decoder
import 'package:flutter_application_2/models/catalog.dart';
import 'package:flutter_application_2/widgets/drawer.dart';

import '../widgets/item_widget.dart';

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
    // await, sync matlab time lo aur sab load karo, file do
    final catalogJson =
        await rootBundle.loadString("assets/files/catalog.json");
    final decodedData = jsonDecode(
        catalogJson); // json decode gives dynamic value matlab string se dusre format mein convert karna,
    //json encode means dusre format se string mein convert karna
    var productsData = decodedData["products"];
    print(productsData);
  }

  @override
  Widget build(BuildContext context) {
    final dummyList = List.generate(20, ((index) => CatalogModel.items[0]));
    //build method hain
    return Scaffold(
      appBar: AppBar(
        title: Text("Catalog App"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: dummyList.length,
          itemBuilder: (context, index) {
            return ItemWidget(
              item: dummyList[index],
            );
          },
        ),
      ),
      drawer: MyDrawer(),
    );
  }
}
