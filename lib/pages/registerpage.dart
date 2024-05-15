import 'package:flutter/material.dart';
import 'package:notesapp/components/mybutton.dart';
import 'package:notesapp/components/mytextfield.dart';
import 'package:notesapp/components/squaretile.dart';

class RegisterPage extends StatelessWidget {

  const RegisterPage({Key? key}) : super(key: key);

  void registerUser() {
    // Kullanıcı kayıt işlemi burada yapılacak
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                const SizedBox(height: 50),

                // Hesap Oluştur!
                Text(
                  'Hesap Oluştur!',
                  style: TextStyle(
                    color: Colors.grey[700],
                    fontSize: 20,
                  ),
                ),
                const SizedBox(height: 25),

                // Kullanıcı adı metin alanı
                MyTextField(
                  controller: TextEditingController(),
                  hintText: 'Kullanıcı Adı',
                  obscureText: false,
                ),
                const SizedBox(height: 10),

                // E-posta metin alanı
                MyTextField(
                  controller: TextEditingController(),
                  hintText: 'E-posta',
                  obscureText: false,
                ),
                const SizedBox(height: 10),

                // Şifre metin alanı
                MyTextField(
                  controller: TextEditingController(),
                  hintText: 'Şifre',
                  obscureText: true,
                ),
                const SizedBox(height: 10),
                // Kayıt ol düğmesi
                MyButton(onTap: registerUser, text: 'Kayıt Ol'),
                const SizedBox(height: 50),

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
                const SizedBox(height: 50),

                // Zaten üye misin? Giriş yap
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Zaten üye misin',
                      style: TextStyle(color: Colors.grey[700]),
                    ),
                    const SizedBox(width: 4),
                    const Text(
                      'Giriş Yap',
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
