import 'package:flutter/material.dart';

class TrashPage extends StatefulWidget {
  @override
  _TrashPageState createState() => _TrashPageState();
}

class _TrashPageState extends State<TrashPage> {
  List<String> deletedNotes = [
    "Silinmiş Not 1",
    "Silinmiş Not 2",
    "Silinmiş Not 3",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Çöp Kutusu'),
      ),
      body: ListView.builder(
        itemCount: deletedNotes.length,
        itemBuilder: (context, index) {
          return TrashItem(
            note: deletedNotes[index],
            onRestore: () {
              setState(() {
                // Geri Yükleme İşlemi
                String restoredNote = deletedNotes.removeAt(index);
                // Geri yüklenen notu burada işleyebilirsiniz.
                print("Restored Note: $restoredNote");
              });
            },
            onDelete: () {
              setState(() {
                // Silme İşlemi
                deletedNotes.removeAt(index);
              });
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showClearConfirmationDialog(context);
        },
        tooltip: 'Çöp Kutusunu Temizle',
        child: Icon(Icons.delete_forever),
      ),
    );
  }

  void showClearConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Emin misiniz?'),
          content: Text('Tüm notları silmek istediğinizden emin misiniz?'),
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
                  // Tüm notları silme işlemi
                  deletedNotes.clear();
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

class TrashItem extends StatelessWidget {
  final String note;
  final VoidCallback onRestore;
  final VoidCallback onDelete;

  TrashItem({required this.note, required this.onRestore, required this.onDelete});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: () {
        showOptionsDialog(context);
      },
      child: ListTile(
        title: Text(note),
      ),
    );
  }

  void showOptionsDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Seçenekler'),
          content: Text('Bu notu geri yüklemek veya temelli silmek istiyor musunuz?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                onDelete();
              },
              child: Text('Sil'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                onRestore();
              },
              child: Text('Geri Yükle'),
            ),
          ],
        );
      },
    );
  }
}
