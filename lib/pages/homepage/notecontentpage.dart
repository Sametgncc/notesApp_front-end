import 'package:flutter/material.dart';

class NoteContentPage extends StatelessWidget {
  final String notecontent;

  const NoteContentPage({Key? key, required this.notecontent})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController(text: notecontent);

    void showClearConfirmationDialog() {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Onayla'),
            content: Text('Notu temizlemek istediğinizden emin misiniz?'),
            actions: <Widget>[
              TextButton(
                child: Text('İptal'),
                onPressed: () {
                  Navigator.of(context).pop(); // Dialog'u kapat
                },
              ),
              TextButton(
                child: Text('Temizle'),
                onPressed: () {
                  controller.clear(); // Notu temizle
                  Navigator.of(context).pop(); // Dialog'u kapat
                },
              ),
            ],
          );
        },
      );
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[300],
        title: Text('Not İçeriği'),
      ),
      body: Container(
        color: Colors.grey[300], // Notlar arka plan rengi
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Not:',
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
              Expanded(
                child: TextField(
                  controller: controller,
                  textAlign: TextAlign.start,
                  // Metni sol hizalar
                  maxLines: null,
                  // Satır sınırını kaldırarak alanın tüm ekranı kaplamasını sağlar
                  expands: true,
                  // TextField'ı genişletir
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    contentPadding: EdgeInsets.all(8.0),
                    // Metin kutusunun kenar boşlukları
                    alignLabelWithHint: true, // Etiketin TextField ile hizalanmasını sağlar
                  ),
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop(controller.text);
                    },
                    child: Text('Kaydet'),
                  ),
                  ElevatedButton(
                    onPressed: showClearConfirmationDialog,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                    ),
                    child: Text('Temizle'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}