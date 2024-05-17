import 'package:flutter/material.dart';
import 'package:notesapp/pages/homepage/selectfolderpage.dart';

class AddNoteHomePage extends StatelessWidget {
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

                // Notun ismini al
                String? noteName = await getNoteName(context);
                if (noteName == null || noteName.isEmpty) {
                  // Eğer not adı girilmediyse, kaydetme işlemini iptal et
                  return;
                }

                // Klasör seçimi için dialog göster
                String? selectedFolder = await showDialog<String>(
                  context: context,
                  builder: (BuildContext context) {
                    return SelectFolderPage();
                  },
                );

                if (selectedFolder != null) {
                  // Notu seçilen klasöre kaydet
                  print('Not kaydedildi: $noteName, Klasör: $selectedFolder');
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

  // Notun ismini almak için bir metot
  Future<String?> getNoteName(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    return showDialog<String>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Notun İsmini Girin'),
          content: TextField(
            controller: nameController,
            decoration: InputDecoration(
              hintText: 'Notun adını girin',
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('İptal'),
            ),
            ElevatedButton(
              onPressed: () {
                String? noteName = nameController.text.trim();
                if (noteName.isNotEmpty) {
                  Navigator.pop(context, noteName);
                }
              },
              child: Text('Tamam'),
            ),
          ],
        );
      },
    );
  }
}
