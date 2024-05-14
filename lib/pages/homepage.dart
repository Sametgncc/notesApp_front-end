import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notlarım'),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView(
        children: [
          // Profil Fotoğrafı
          ListTile(
            leading: CircleAvatar(
              radius: 30,
              backgroundImage: AssetImage(
                  'lib/images/emiröztürk.png'),
            ),
            title: Text('Emir Öztürk'),
          ),

          // Notlar Bölümü
          Divider(),
          ListTile(
            leading: Icon(Icons.folder),
            title: Text('Tüm Notlar'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.folder),
            title: Text('Kişisel Notlarım'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.folder),
            title: Text('Yapılacaklar Listesi'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.folder),
            title: Text('Günlük'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.folder),
            title: Text('Projeler'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.folder),
            title: Text('Okuma Listesi'),
            onTap: () {},
          ),

          // Yeni Klasör Ekleme
          Divider(),
          ListTile(
            leading: Icon(Icons.add),
            title: Text('Yeni Klasör Ekle'),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}