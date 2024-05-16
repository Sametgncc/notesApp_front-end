import 'package:flutter/material.dart';

class ChangePasswordPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Şifre Değiştir'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Mevcut Şifre',
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            TextFormField(
              obscureText: true, // Şifrenin görünmesini engeller
              decoration: InputDecoration(
                hintText: 'Mevcut şifrenizi girin',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              'Yeni Şifre',
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            TextFormField(
              obscureText: true, // Şifrenin görünmesini engeller
              decoration: InputDecoration(
                hintText: 'Yeni şifrenizi girin',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              'Yeni Şifre Tekrar',
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            TextFormField(
              obscureText: true, // Şifrenin görünmesini engeller
              decoration: InputDecoration(
                hintText: 'Yeni şifrenizi tekrar girin',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 24.0),
            ElevatedButton(
              onPressed: () {
                // Yeni şifreleri kontrol ederek değiştirme işlemini gerçekleştir
                _changePassword(context);
              },
              child: Text('Şifreyi Değiştir'),
            ),
          ],
        ),
      ),
    );
  }

  void _changePassword(BuildContext context) {
    // Yeni şifreleri kontrol ederek değiştirme işlemini gerçekleştir
    // Burada gerekli işlemleri yapabilirsiniz
    // Örneğin:
    // - Kullanıcının mevcut şifresini kontrol etme
    // - Yeni şifrelerin eşleşip eşleşmediğini kontrol etme
    // - Şifreyi değiştirme işlemini gerçekleştirme
    // - Kullanıcıyı bilgilendirme mesajı gösterme
  }
}
