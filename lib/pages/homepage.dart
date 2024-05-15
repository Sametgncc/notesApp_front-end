import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notlarım'),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              // Implement search functionality
            },
          ),
          IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: () {
              // Implement more actions
            },
          ),
        ],
      ),

      body: ListView(
        padding: EdgeInsets.symmetric(vertical: 16.0),
        children: [
          Column(
            children: [
              GridView.count(
                crossAxisCount: 2, // İki sütun
                mainAxisSpacing: 20.0, // Kareler arası dikey boşluk
                crossAxisSpacing: 16.0, // Kareler arası yatay boşluk
                childAspectRatio: 0.9, // Karelerin boyutları eşit
                padding: EdgeInsets.all(16.0),
                shrinkWrap: true,
                children: [
                  // Folder 1: Tüm Notlar
                  _buildFolderItem(context, 'Tüm Notlar', 'Tüm Notlar Ekranı', AllNotesScreen()),

                  // Folder 2: Kişisel Notlarım
                  _buildFolderItem(context, 'Kişisel Notlarım', 'Kişisel Notlar Ekranı', PersonalNotesScreen()),

                  // Folder 3: Yapılacaklar Listesi
                  _buildFolderItem(context, 'Görev Listesi', 'Yapılacaklar Listesi Ekranı', MissionScreen()),

                  // Folder 4: Günlük
                  _buildFolderItem(context, 'Rüya Günlüğü', 'Rüya Günlük Ekranı', JournalScreen()),

                  // Folder 5: Projeler
                  _buildFolderItem(context, 'Projeler', 'Projeler Ekranı', ProjectsScreen()),

                  // Folder 6: Okuma Listesi
                  _buildFolderItem(context, 'Okuma Listesi', 'Okuma Listesi Ekranı', ReadingListScreen()),
                ],
              ),
              SizedBox(height: 16), // Boşluk ekleyelim
              // Ekle Butonu
              SizedBox(height: 7), // Buton ile alt arasında boşluk bırakalım
              Container(
                padding: EdgeInsets.symmetric(horizontal: 35.0), // Yatay dolguyu artır
                child: ElevatedButton(
                  onPressed: () {
                    // Ekleme işlevselliğini uygula
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.add),
                      SizedBox(width: 22), // İkon ve metin arasındaki boşluğu biraz daha artır
                      Text('Yeni Not Ekle', style: TextStyle(fontSize: 18)), // Metin boyutunu artır
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildFolderItem(BuildContext context, String title, String screenName, Widget screen) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => screen),
        );
      },
      child: Container(
        padding: EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Colors.grey[500],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}

class AllNotesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tüm Notlar'),
      ),
      body: Center(
        child: Text('Tüm Notlar Ekranı'),
      ),
    );
  }
}

class PersonalNotesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kişisel Notlarım'),
      ),
      body: Center(
        child: Text('Kişisel Notlar Ekranı'),
      ),
    );
  }
}

class MissionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Görev Listesi'),
      ),
      body: Center(
        child: Text('Görev Listesi Ekranı'),
      ),
    );
  }
}

class JournalScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Rüya Günlüğü'),
      ),
      body: Center(
        child: Text('Rüya Günlük Ekranı'),
      ),
    );
  }
}

class ProjectsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Projeler'),
      ),
      body: Center(
        child: Text('Projeler Ekranı'),
      ),
    );
  }
}

class ReadingListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Okuma Listesi'),
      ),
      body: Center(
        child: Text('Okuma Listesi Ekranı'),
      ),
    );
  }
}
