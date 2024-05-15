import 'package:flutter/material.dart';
import 'package:notesapp/components/mybutton.dart';
import 'package:notesapp/components/mytextfield.dart';
import 'package:notesapp/components/squaretile.dart';

class RegisterPage extends StatelessWidget {
  final VoidCallback GirisYap;
  final VoidCallback KayitOl;

  const RegisterPage({Key? key, required this.GirisYap,required this.KayitOl}) : super(key: key);

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
                  controller: TextEditingController(),
                  hintText: 'Kullanıcı Adı',
                  obscureText: false,
                ),
                SizedBox(height: 10),

                // E-posta metin alanı
                MyTextField(
                  controller: TextEditingController(),
                  hintText: 'E-posta',
                  obscureText: false,
                ),
                SizedBox(height: 10),

                // Şifre metin alanı
                MyTextField(
                  controller: TextEditingController(),
                  hintText: 'Şifre',
                  obscureText: true,
                ),
                SizedBox(height: 10),

                // Kayıt ol düğmesi
                MyButton(onTap: KayitOl, text: 'Kayıt Ol'),
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
                  onTap: GirisYap,
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
