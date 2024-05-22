import 'package:flutter/material.dart';
import 'package:notlar/components/mybutton.dart';
import 'package:notlar/components/mytextfield.dart';
import 'package:notlar/services/user_service.dart';

import '../../service/UserService.dart'; // Paket adı düzeltildi

class LoginPage extends StatelessWidget {
  final VoidCallback Uyeol;
  final UserService _userService = UserService(); // UserService nesnesi oluşturuldu

  LoginPage({Key? key, required this.Uyeol}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController usernameController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 50),

              // Logo
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(
                    Icons.account_circle,
                    size: 125,
                  )
                ],
              ),

              SizedBox(height: 25),

              // Tekrar hoş geldin!
              Text(
                'Welcome back!',
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

              // Şifre metin alanı
              MyTextField(
                controller: passwordController,
                hintText: 'Şifre',
                obscureText: true,
              ),
              SizedBox(height: 10),

              // Şifreyi unuttum
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'Şifremi unuttum',
                      style: TextStyle(color: Colors.grey[600]),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 25),

              // Oturum aç düğmesi
              MyButton(
                onTap: () async {
                  // Kullanıcı adı ve şifre kontrolü yapılıyor
                  if (usernameController.text.isNotEmpty && passwordController.text.isNotEmpty) {
                    // Oturum açma isteği gönderiliyor
                    await _userService.login(usernameController.text, passwordController.text);
                  } else {
                    // Kullanıcıya bir uyarı gösterilebilir
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: Text("Hata"),
                        content: Text("Kullanıcı adı ve şifre boş olamaz."),
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
                text: 'Oturum Aç',
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

              // Üye değil misin? Kayıt ol
              GestureDetector(
                onTap: Uyeol,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Üye değil misin',
                      style: TextStyle(color: Colors.grey[700]),
                    ),
                    SizedBox(width: 4),
                    Text(
                      'Üye ol',
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
    );
  }
}
