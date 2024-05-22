import 'package:flutter/material.dart';
import 'package:notlar/pages/homepage/homepage.dart';
import 'package:notlar/pages/loginpage/loginpage.dart';
import 'package:notlar/pages/registerpage/registerpage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/login',
      routes: {
        '/login': (context) => LoginPage(
          Uyeol: () {
            Navigator.pushNamed(context, '/register');
          },
        ),
        '/register': (context) => RegisterPage(
          Girisyap: () {
            Navigator.pushReplacementNamed(context, '/login');
          },
        ),
        '/home': (context) => HomePage(),
      },
    );
  }
}
