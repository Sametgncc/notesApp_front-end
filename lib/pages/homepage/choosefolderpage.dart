import 'package:flutter/material.dart';
import 'package:notlar/pages/homepage/foldernotespage.dart';


class ChooseFolderPage extends StatelessWidget {
  final List<String> folders = [
    'Kişisel Notlarım',
    'Görev Listesi',
    'Rüya Günlüğü',
    'Projeler',
    'Okuma Listesi',
    'Çizimler'
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
              MaterialPageRoute(builder: (context) => FolderNotesPage(folderName: folder)),
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
