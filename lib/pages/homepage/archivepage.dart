import 'package:flutter/material.dart';

class ArchivePage extends StatefulWidget {
  @override
  ArchivePageState createState() => ArchivePageState();
}

class ArchivePageState extends State<ArchivePage> {
  List<String> archivedNotes = [
    "Arşivlenmiş Not 1",
    "Arşivlenmiş Not 2",
    "Arşivlenmiş Not 3",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Arşiv'),
      ),
      body: ListView.builder(
        itemCount: archivedNotes.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onLongPress: () {
              showDeleteConfirmationDialog(context, index);
            },
            child: ListTile(
              title: Text(archivedNotes[index]),
            ),
          );
        },
      ),
    );
  }

  void showDeleteConfirmationDialog(BuildContext context, int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Emin misiniz?'),
          content: Text('Bu notu arşivden kaldırmak istediğinizden emin misiniz?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Hayır'),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  // Arşivden notu kaldırma işlemi
                  String removedNote = archivedNotes.removeAt(index);
                  // Kaldırılan notu burada işleyebilirsiniz.
                  print("Removed Note: $removedNote");
                });
                Navigator.of(context).pop();
              },
              child: Text('Evet'),
            ),
          ],
        );
      },
    );
  }
}
