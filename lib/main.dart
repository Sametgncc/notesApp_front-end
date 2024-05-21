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
          Oturumac: () {
            Navigator.pushNamed(context, '/home');
          },
        ),
        '/register': (context) => RegisterPage(
          Girisyap: () {
            Navigator.pushNamed(context, '/login');
          },
          Kayitol: () async {
            Navigator.pushNamed(context, '/home');
          },
        ),
        '/home': (context) => HomePage(),
      },
    );
  }
}
