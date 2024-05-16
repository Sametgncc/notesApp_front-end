import 'package:flutter/material.dart';

class FolderNotesPage extends StatelessWidget {
  final String folderName;

  const FolderNotesPage({Key? key, required this.folderName}) : super(key: key);

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
