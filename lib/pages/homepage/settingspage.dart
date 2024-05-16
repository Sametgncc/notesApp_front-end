import 'package:flutter/material.dart';
import 'package:notesapp/pages/homepage/changepassword.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _isDarkModeEnabled = false;
  double _fontSize = 16.0; // Örnek bir yazı tipi boyutu

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ayarlar'),
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          ListTile(
            title: Text('Tema Seçimi'),
            subtitle: Text(_isDarkModeEnabled
                ? 'Uygulamanın temasını karanlık moda geçirin'
                : 'Uygulamanın temasını aydınlık moda geçirin'),
            trailing: IconButton(
              icon: Icon(_isDarkModeEnabled ? Icons.dark_mode : Icons.light_mode),
              onPressed: () {
                setState(() {
                  _isDarkModeEnabled = !_isDarkModeEnabled;
                  _changeTheme(_isDarkModeEnabled);
                });
              },
            ),
          ),
          Divider(),
          ListTile(
            title: Text('Şifre Değiştir'),
            subtitle: Text('Şifrenizi değiştirmek için tıklayın'),
            onTap: () {
              // Şifre değiştirme sayfasına git
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ChangePasswordPage()),
              );
            },
          ),
          Divider(),
          ListTile(
            title: Text('Yazı Tipi Boyutu'),
            subtitle: Text('Yazı tipi boyutunu ayarlamak için tıklayın'),
            onTap: () {
              _showFontSizeDialog(); // Yazı tipi boyutu ayarları için bir dialog göster
            },
          ),
        ],
      ),
    );
  }

  void _changeTheme(bool isDarkModeEnabled) {
    setState(() {
      // Uygulama temasını güncelle
      ThemeData themeData = isDarkModeEnabled ? ThemeData.dark() : ThemeData.light();
      // MaterialApp'ın theme özelliğini güncelle
      // Örneğin:
      // MaterialApp(
      //   theme: themeData,
      //   ...
      // );
    });
  }

  void _showFontSizeDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Yazı Tipi Boyutu'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Yazı tipi boyutunu seçin:'),
              SizedBox(height: 16.0),
              Slider(
                value: _fontSize,
                min: 10,
                max: 30,
                divisions: 20,
                onChanged: (newValue) {
                  setState(() {
                    _fontSize = newValue;
                  });
                },
              ),
              Text('${_fontSize.toStringAsFixed(1)} pt'), // Yazı tipi boyutunu göster
            ],
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Tamam'),
            ),
          ],
        );
      },
    );
  }
}
