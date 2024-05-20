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
          Uyeol: () { // Login'deki üyeol ile register'a geçiş
            Navigator.pushNamed(context, '/register');
          },
          Oturumac: () { //Login'deki Oturumaç ile home'a geçiş
            Navigator.pushNamed(context, '/home');
          }, OturumAc: () {  },
        ),
        '/register': (context) => RegisterPage(
          Girisyap: () { // Register'daki Girisyap ile Login'e geçiş
            Navigator.pushNamed(context, '/login');
          },
          Kayitol: () {  //Register'daki Kayıtol ile home'a geçiş
            Navigator.pushNamed(context, '/home');
          },
        ),
        '/home': (context) => HomePage(),
      },
    );
  }
}
