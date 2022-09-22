import 'package:flutter/material.dart';
import 'package:flutter_application_2/widgets/drawer.dart';

class HomePage extends StatelessWidget {
  final int days = 30;
  final String name = "Rohan";
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //build method hain
    return Scaffold(
      appBar: AppBar(
        title: Text("Catalog App"),
      ),
      body: Center(
        child: Container(
          child: Text(
              "Welcome to $days days of Flutter by $name"), //$days is string interpolation
        ),
      ),
      drawer: MyDrawer(),
    );
  }
}
