import 'package:flutter/material.dart';
import 'package:notesapp/pages/homepage/addnotehomepage.dart';
import 'package:notesapp/pages/homepage/allnotespage.dart';
import 'package:notesapp/pages/homepage/choosefolderpage.dart';

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
            ChooseFolderPage(),
            AllNotesPage(),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AddNoteHomePage()),
            );
          },
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
