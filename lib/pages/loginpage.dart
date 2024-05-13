import 'package:flutter/material.dart';
import 'package:notesapp/components/mybutton.dart';
import 'package:notesapp/components/mytextfield.dart';
import 'package:notesapp/components/squaretile.dart';

class LoginPage extends StatelessWidget {
    const LoginPage({Key? key});

    void signUserIn(){

    }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const SizedBox(height: 50),

            // logo
            const Icon(
              Icons.lock,
              size: 100,
            ),

            const SizedBox(height: 50),

            // tekrar hoş geldin!
            Text(
              'Tekrar hoşgeldin',
              style: TextStyle(
                color: Colors.grey[700],
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 25),

            // kullanıcı adı metin alanı

            MyTextField(
              controller: TextEditingController(),
              hintText: 'Username',
              obscureText: false,
            ),

            const SizedBox(height: 10),

            // şifre metin alanı

            MyTextField(
              controller: TextEditingController(),
              hintText: 'Password',
              obscureText: true,
            ),
            const SizedBox(height: 10),

            // şifreyi unuttum
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'Şifremi unuttum',
                    style: TextStyle(color:Colors.grey[600]),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 25),

            // oturum aç düğmesi
            MyButton(
                onTap: signUserIn,
            ),
            const SizedBox(height: 50),

            // veya devam et
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Row(children: [
                Expanded(
                    child:Divider(
                      thickness: 0.5,
                      color: Colors.grey[400],
                    )
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Text(
                      'veya devam et',
                    style: TextStyle(color: Colors.grey[700]),
                  ),
                ),
                Expanded(
                    child:Divider(
                      thickness: 0.5,
                      color: Colors.grey[400],
                    )
                )
              ],
              ),
            ),
            const SizedBox(height: 50),
            // google ile oturum açma
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children:const  [
                SquareTile(imagePath: 'lib/images/google.png'),
            ],
            ),

            const SizedBox(height: 50),

            // üye değil misin? kayıt ol
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              Text(
                  'Üye değil misin',
              style: TextStyle(color: Colors.grey[700]),

              ),
              const SizedBox(width: 4),
              const Text(
                  'Üye ol',
                style: TextStyle(color: Colors.blue,
                  fontWeight:FontWeight.bold,
                ),
              )


            ],)
          ],
        ),
      ),
    );
  }
}
