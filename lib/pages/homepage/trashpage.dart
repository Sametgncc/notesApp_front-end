import 'package:flutter/material.dart';

class TrashPage extends StatefulWidget {
  @override
  TrashPageState createState() => TrashPageState();
}

class TrashPageState extends State<TrashPage> {
  List<String> deletednotes = [
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
        itemCount: deletednotes.length,
        itemBuilder: (context, index) {
          return TrashItem(
            note: deletednotes[index],
            onrestore: () {
              setState(() {
                // Geri Yükleme İşlemi
                String restoredNote = deletednotes.removeAt(index);
                // Geri yüklenen notu burada işleyebilirsiniz.
                print("Restored Note: $restoredNote");
              });
            },
            ondelete: () {
              setState(() {
                // Silme İşlemi
                deletednotes.removeAt(index);
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
                  deletednotes.clear();
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
  final VoidCallback onrestore;
  final VoidCallback ondelete;

  TrashItem({required this.note, required this.onrestore, required this.ondelete});

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
                ondelete();
              },
              child: Text('Sil'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                onrestore();
              },
              child: Text('Geri Yükle'),
            ),
          ],
        );
      },
    );
  }
}
