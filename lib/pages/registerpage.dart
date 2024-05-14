import 'package:flutter/material.dart';
import 'package:notesapp/components/mybutton.dart';
import 'package:notesapp/components/mytextfield.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  // Form için bir GlobalKey oluşturulur.
  final _formKey = GlobalKey<FormState>();
  // Kullanıcı adı ve şifre için TextEditingController'lar oluşturulur.
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  // Widget'ın yok edilmesi durumunda controller'lar serbest bırakılır.
  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  // Kayıt işlemi için bir yöntem tanımlanır.
  void _register() {
    if (_formKey.currentState!.validate()) {
      // Kayıt işlemini burada gerçekleştirin
      print('Kullanıcı adı: ${_usernameController.text}');
      print('Şifre: ${_passwordController.text}');
    }
  }

  // Giriş sayfasına yönlendirme için bir yöntem tanımlanır.
  void _navigateToLogin() {
    Navigator.pushNamed(context, '/login');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const SizedBox(height: 50),
                  // Hesap oluştur başlığı
                  Text(
                    'Hesap Oluştur',
                    style: TextStyle(
                      color: Colors.grey[700],
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(height: 25),

                  // Kullanıcı adı metin alanı
                  MyTextField(
                    controller: _usernameController,
                    hintText: 'Kullanıcı adı',
                    obscureText: false,
                  ),
                  const SizedBox(height: 10),

                  // Şifre metin alanı
                  MyTextField(
                    controller: _passwordController,
                    hintText: 'Şifre',
                    obscureText: true,
                  ),
                  const SizedBox(height: 25),

                  // Kayıt ol düğmesi
                  MyButton(
                    onTap: _register,
                    text: 'Kayıt Ol',
                  ),
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

                  // Hesabınız var mı? Giriş Yap
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Hesabınız var mı?',
                        style: TextStyle(color: Colors.grey[700]),
                      ),
                      const SizedBox(width: 4),
                      GestureDetector(
                        onTap: _navigateToLogin,
                        child: const Text(
                          'Giriş Yap',
                          style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
