// U-Untracked aur A-Add hogayi sari files git cmds ke liye. class ek blueprint hain usse jo bana woh object hain
// 3 trees in flutter:- Widget(what we write, immutable), Element(it calls build method and redraws,mutable) and Render Tree(render paints).
// _catalog means private banaya hain
//fn+f2 to change name of class
// The info goes from widget to element and element to render
//React Native use native widgets/components, flutter draws by itself
//see video 4:10:40

import 'package:flutter/material.dart';
import 'package:flutter_application_2/pages/cart_page.dart';
import 'package:flutter_application_2/pages/home_page.dart';
import 'package:flutter_application_2/pages/login_page.dart';
import 'package:flutter_application_2/utils/routes.dart';
import 'package:flutter_application_2/widgets/themes.dart';
import 'package:google_fonts/google_fonts.dart';

//cmd + click to see anyones documentation

void main() {
  //main method hain aur runApp method call kar ho raha
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  //class hain stateless widget
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
      themeMode: ThemeMode.system,
      theme: MyTheme.lightTheme(context),
      darkTheme: MyTheme.darkTheme(context),
      debugShowCheckedModeBanner: false,

      // initialRoute: "/home", // by default home page open hota hain
      initialRoute: MyRoutes.homeRoute, //login page pe jata hain
      routes: {
        "/": (context) => LoginPage(),
        MyRoutes.homeRoute: (context) => HomePage(),
        MyRoutes.loginRoute: (context) => LoginPage(),
        MyRoutes.cartRoute: (context) => CartPage(),
      },
    );
  }
}
