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
          Uyeol: () { // LoginPage'deki Uyeol fonksiyonu ile RegisterPage'e geçiş
            Navigator.pushNamed(context, '/register');
          },
          OturumAc: () { //LoginPage'deki Oturum Aç fonksiyonu ile HomePage'e geçiş
            Navigator.pushNamed(context, '/home');
          },
        ),
        '/register': (context) => RegisterPage(
          GirisYap: () { // RegisterPage'deki GirisYap fonksiyonu ile LoginPage'e geçiş
            Navigator.pushNamed(context, '/login');
          },
          KayitOl: () {  //RegisterPage'deki Kayıt Ol fonksiyonu ile HomePage'e geçiş
            Navigator.pushNamed(context, '/home');
          },
        ),
        '/home': (context) => HomePage(),
      },
    );
  }
}
