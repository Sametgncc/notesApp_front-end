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
                // Klasör seçimi için dialog göster
                String? selectedFolder = await showDialog<String>(
                  context: context,
                  builder: (BuildContext context) {
                    return SelectFolderPage();
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
