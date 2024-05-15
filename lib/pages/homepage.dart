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

      body: Column(
        children: [
          Expanded(
            child: GridView.count(
              crossAxisCount: 2, // İki sütun
              mainAxisSpacing: 16.0, // Kareler arası dikey boşluk
              crossAxisSpacing: 16.0, // Kareler arası yatay boşluk
              childAspectRatio: 1.0, // Karelerin boyutları eşit
              padding: EdgeInsets.all(16.0),
              children: [
                // Folder 1: Tüm Notlar
                GestureDetector(
                  onTap: () {
                    // Tüm notları görüntülemek için ekranı aç
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AllNotesScreen()),
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[500],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text(
                        'Tüm Notlar',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18, // Metin boyutunu artır
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),

                // Folder 2: Kişisel Notlarım
                GestureDetector(
                  onTap: () {
                    // Kişisel notlar için ekranı aç
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => PersonalNotesScreen()),
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[500],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text(
                        'Kişisel Notlarım',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18, // Metin boyutunu artır
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),

                // Folder 3: Yapılacaklar Listesi
                GestureDetector(
                  onTap: () {
                    // Yapılacaklar listesi için ekranı aç
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ToDoListScreen()),
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[500],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text(
                        'Yapılacaklar Listesi',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18, // Metin boyutunu artır
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),

                // Folder 4: Günlük
                GestureDetector(
                  onTap: () {
                    // Günlük için ekranı aç
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => JournalScreen()),
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[500],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text(
                        'Rüya Günlüğü',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18, // Metin boyutunu artır
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),

                // Folder 5: Projeler
                GestureDetector(
                  onTap: () {
                    // Projeler için ekranı aç
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ProjectsScreen()),
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[500],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text(
                        'Projeler',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18, // Metin boyutunu artır
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),

                // Folder 6: Okuma Listesi
                GestureDetector(
                  onTap: () {
                    // Okuma listesi için ekranı aç
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ReadingListScreen()),
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[500],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text(
                        'Okuma Listesi',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18, // Metin boyutunu artır
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Ekle Butonu
          Container(
            padding: EdgeInsets.symmetric(horizontal: 35.0), // Yatay dolguyu artır
            child: Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      // Ekleme işlevselliğini uygula
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.add),
                        SizedBox(width: 12), // İkon ve metin arasındaki boşluğu biraz daha artır
                        Text('Yeni Not Ekle', style: TextStyle(fontSize: 18)), // Metin boyutunu artır
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 16), // Butonla alt arasındaki boşluğu artır
        ],
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

class ToDoListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Yapılacaklar Listesi'),
      ),
      body: Center(
        child: Text('Yapılacaklar Listesi Ekranı'),
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