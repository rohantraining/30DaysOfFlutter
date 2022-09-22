// U-Untracked aur A-Add hogayi sari files git cmds ke liye. class ek blueprint hain usse jo bana woh object hain
import 'package:flutter/material.dart';
import 'package:flutter_application_2/pages/home_page.dart';
import 'package:flutter_application_2/pages/login_page.dart';
import 'package:flutter_application_2/utils/routes.dart';
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
      themeMode: ThemeMode.light,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        fontFamily: GoogleFonts.lato().fontFamily,
      ),
      debugShowCheckedModeBanner: false,
      darkTheme: ThemeData(
        brightness: Brightness.dark,
      ),

      // initialRoute: "/home", // by default home page open hota hain
      initialRoute: "MyRoutes.homeRoute",
      routes: {
        "/": (context) => LoginPage(),
        MyRoutes.homeRoute: (context) => HomePage(),
        MyRoutes.loginRoute: (context) => LoginPage()
      },
    );
  }
}
