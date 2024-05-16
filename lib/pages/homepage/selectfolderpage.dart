import 'package:flutter/material.dart';

class SelectFolderPage extends StatelessWidget {
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
