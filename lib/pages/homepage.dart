import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.grey[300],
        appBar: AppBar(
          backgroundColor: Colors.grey[300],
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
                // Arama işlevselliğini uygula
              },
            ),
            IconButton(
              icon: Icon(Icons.more_vert),
              onPressed: () {
                // Daha fazla işlemi uygula
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
              MaterialPageRoute(builder: (context) => AddNoteHomeScreen()),
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
              MaterialPageRoute(builder: (context) => FolderNotesScreen(folderName: folder)),
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

class FolderNotesScreen extends StatelessWidget {
  final String folderName;

  const FolderNotesScreen({Key? key, required this.folderName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Örnek not listesi
    final List<String> notes = [
      'Not 1',
      'Not 2',
      'Not 3',
    ];

    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.grey[300],
        title: Text('$folderName Notları'),
      ),
      body: ListView.builder(
        itemCount: notes.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(notes[index]),
            onTap: () {
              // Örnek nota basıldığında yapılacak işlemler buraya yazılabilir
              print('Seçilen not: ${notes[index]}, Klasör: $folderName');
            },
          );
        },
      ),
    );
  }
}

class AddNoteHomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextEditingController noteController = TextEditingController(); // Not girişi için controller

    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.grey[300],
        title: Text('Yeni Not Ekle'),
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
              onPressed: () async {
                // Notu kaydetme işlevselliği
                String note = noteController.text;
                // Klasör seçimi için dialog göster
                String? selectedFolder = await showDialog<String>(
                  context: context,
                  builder: (BuildContext context) {
                    return SelectFolderDialog();
                  },
                );

                if (selectedFolder != null) {
                  // Notu seçilen klasöre kaydet
                  print('Not kaydedildi: $note, Klasör: $selectedFolder');
                }

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

class SelectFolderDialog extends StatelessWidget {
  final List<String> folders = [
    'Kişisel Notlarım',
    'Görev Listesi',
    'Rüya Günlüğü',
    'Projeler',
    'Okuma Listesi',
  ];

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Klasör Seçin'),
      content: SingleChildScrollView(
        child: ListBody(
          children: folders.map((folder) {
            return ListTile(
              title: Text(folder),
              onTap: () {
                Navigator.of(context).pop(folder); // Seçilen klasörü geri döndür
              },
            );
          }).toList(),
        ),
      ),
    );
  }
}
