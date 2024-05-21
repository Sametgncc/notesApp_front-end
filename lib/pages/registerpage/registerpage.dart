import 'package:flutter/material.dart';
import 'package:notlar/components/mybutton.dart';
import 'package:notlar/components/mytextfield.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class RegisterPage extends StatelessWidget {
  final VoidCallback Girisyap;
  final VoidCallback Kayitol;

  const RegisterPage({Key? key, required this.Girisyap,required this.Kayitol}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final usernameController=TextEditingController();
    final passwordController=TextEditingController();
    final mailController=TextEditingController();

    Future<void> _register(String username, String password, String email, BuildContext context) async {
      try {
        if (email.isEmpty) {
          // E-posta alanı boş ise kayıt işlemi gerçekleştirilmez
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Text("Hata"),
              content: Text("E-posta alanı boş olamaz."),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text("Tamam"),
                ),
              ],
            ),
          );
          return;
        }

        final response = await http.post(
          Uri.parse('http://localhost:8085/users/register'),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(<String, String>{
            'username': username,
            'password': password,
            'email': email,
          }),
        );

        if (response.statusCode == 200) {
          // Kayıt başarılı
          Kayitol();
        } else {
          // Kayıt başarısız
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Text("Hata"),
              content: Text("Kayıt başarısız. Lütfen tekrar deneyin."),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text("Tamam"),
                ),
              ],
            ),
          );
        }
      } catch (e) {
        // Hata oluştu
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text("Hata"),
            content: Text("Bir hata oluştu: $e"),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text("Tamam"),
              ),
            ],
          ),
        );
      }
    }

    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: 50),

                // Hesap Oluştur!
                Text(
                  'Hesap Oluştur!',
                  style: TextStyle(
                    color: Colors.grey[700],
                    fontSize: 20,
                  ),
                ),
                SizedBox(height: 25),

                // Kullanıcı adı metin alanı
                MyTextField(
                  controller: usernameController,
                  hintText: 'Kullanıcı Adı',
                  obscureText: false,
                ),
                SizedBox(height: 10),

                // E-posta metin alanı
                MyTextField(
                  controller: mailController,
                  hintText: 'E-posta',
                  obscureText: false,
                ),
                SizedBox(height: 10),

                // Şifre metin alanı
                MyTextField(
                  controller: passwordController,
                  hintText: 'Şifre',
                  obscureText: true,
                ),
                SizedBox(height: 10),

                // Kayıt ol düğmesi
                MyButton(
                  onTap: () {
                    // Kullanıcı adı, e-posta ve şifre kontrolü yapılıyor
                    if (usernameController.text.isNotEmpty && mailController.text.isNotEmpty && passwordController.text.isNotEmpty) {
                      // Kayıt işlemi gerçekleştirilir
                      Kayitol();
                    } else {
                      // Kullanıcıya bir uyarı gösterilebilir
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: Text("Hata"),
                          content: Text("Kullanıcı adı, e-posta ve şifre boş olamaz."),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: Text("Tamam"),
                            ),
                          ],
                        ),
                      );
                    }
                  },
                  text: 'Kayıt Ol',
                ),
                SizedBox(height: 50),

                // Veya devam et
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.grey[400],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Text(
                          'veya devam et',
                          style: TextStyle(color: Colors.grey[700]),
                        ),
                      ),
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.grey[400],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 50),

                // Zaten üye misin? Giriş yap
                GestureDetector(
                  onTap: Girisyap,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Zaten üye misin',
                        style: TextStyle(color: Colors.grey[700]),
                      ),
                      SizedBox(width: 4),
                      Text(
                        'Giriş Yap',
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}