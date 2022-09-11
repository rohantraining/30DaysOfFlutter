// u-Untracked aur A-Add hogayi sari files git cmds ke liye
import 'package:flutter/material.dart';
import 'package:flutter_application_2/home_page.dart';

void main() {
  //main method hain aur runApp method call kar ho raha
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // double pi = 3.14;
    // bool isMale = true;
    // num temp = 30.5;

    // var day = "Sunday";
    // const pi = 3.14;
    // final mein data modify kar sakte hain aur const mein nhi kar sakte hain

    return MaterialApp(
      home: HomePage(),
    );
  }
}
