import 'package:flutter/material.dart';
import 'package:notlar/components/mybutton.dart';
import 'package:notlar/components/mytextfield.dart';


class RegisterPage extends StatelessWidget {
  final VoidCallback Girisyap;
  final VoidCallback Kayitol;

  const RegisterPage({Key? key, required this.Girisyap,required this.Kayitol}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final usernamecontroller=TextEditingController();
    final passwordcontroller=TextEditingController();
    final mailcontroller=TextEditingController();
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
                  controller: usernamecontroller,
                  hintText: 'Kullanıcı Adı',
                  obscureText: false,
                ),
                SizedBox(height: 10),

                // E-posta metin alanı
                MyTextField(
                  controller: mailcontroller,
                  hintText: 'E-posta',
                  obscureText: false,
                ),
                SizedBox(height: 10),

                // Şifre metin alanı
                MyTextField(
                  controller: passwordcontroller,
                  hintText: 'Şifre',
                  obscureText: true,
                ),
                SizedBox(height: 10),

                // Kayıt ol düğmesi
                MyButton(
                  onTap: () {
                    // Boş mu kontrolü
                    if (usernamecontroller.text.isNotEmpty && mailcontroller.text.isNotEmpty && passwordcontroller.text.isNotEmpty) {
                      // Kayıt işlemi gerçekleştirilir
                      Kayitol();
                    } else {
                      // Uyarı mesajı
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
