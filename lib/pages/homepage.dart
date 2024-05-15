import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Notlarım'),
          bottom: TabBar(
            tabs: [
              Tab(text: 'Klasörler'),
              Tab(text: 'Tüm Notlar'),
            ],
          ),
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
        body: TabBarView(
          children: [
            ChooseFolderScreen(),
            AllNotesScreen(),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ChooseFolderScreen()),
            );
          },
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}

class AllNotesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Tüm Notlar Ekranı'),
    );
  }
}

class ChooseFolderScreen extends StatelessWidget {
  final List<String> folders = [
    'Kişisel Notlarım',
    'Görev Listesi',
    'Rüya Günlüğü',
    'Projeler',
    'Okuma Listesi',
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      children: folders
          .map(
            (folder) => GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AddNoteScreen(folderName: folder)),
            );
          },
          child: Container(
            margin: EdgeInsets.all(8),
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.grey[500],
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: Text(
                folder,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      )
          .toList(),
    );
  }
}

class AddNoteScreen extends StatelessWidget {
  final String folderName;

  const AddNoteScreen({Key? key, required this.folderName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController noteController = TextEditingController(); // Not girişi için controller

    return Scaffold(
      appBar: AppBar(
        title: Text('Yeni Not Ekle - $folderName'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: noteController, // Controller atanması
              decoration: InputDecoration(
                hintText: 'Notunuzu buraya yazın',
              ),
              keyboardType: TextInputType.multiline,
              maxLines: null,
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Notu kaydetme işlevselliği
                String note = noteController.text;
                // Notu kaydetmek için gereken işlemler burada gerçekleştirilecek
                // Örneğin, Firestore veya SQLite gibi bir veritabanına notu kaydetme işlemi yapılabilir
                // Bu örnekte sadece konsola notu yazdıralım
                print('Not kaydedildi: $note, Klasör: $folderName');
                Navigator.pop(context); // Not ekleme ekranından çık
              },
              child: Text('Notu Kaydet'),
            ),
          ],
        ),
      ),
    );
  }
}