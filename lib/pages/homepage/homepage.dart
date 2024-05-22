import 'package:flutter/material.dart';
import 'package:notlar/pages/homepage/addnote/addnotehomepage.dart';
import 'package:notlar/pages/homepage/allnotespage.dart';
import 'package:notlar/pages/homepage/treelines/archivepage.dart';
import 'package:notlar/pages/homepage/folders/choosefolderpage.dart';
import 'package:notlar/pages/homepage/treelines/settingspage.dart';
import 'package:notlar/pages/homepage/treelines/trashpage.dart';

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
                showSearchDialog(context);
              },
            ),
            IconButton(
              icon: Icon(Icons.menu),
              onPressed: () {
                // Özel menüyü göster
                showCustomMenu(context);
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

  void showCustomMenu(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: MediaQuery.of(context).size.height * 0.5,
          child: ListView(
            children: [
              ListTile(
                leading: Icon(Icons.archive),
                title: Text("Arşiv"),
                onTap: () {
                  Navigator.pop(context); // Menüyü kapat
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ArchivePage()),
                  );
                },
              ),
              ListTile(
                leading: Icon(Icons.delete),
                title: Text("Çöp Kutusu"),
                onTap: () {
                  Navigator.pop(context); // Menüyü kapat
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => TrashPage()),
                  );
                },
              ),
              ListTile(
                leading: Icon(Icons.settings),
                title: Text("Ayarlar"),
                onTap: () {
                  Navigator.pop(context); // Menüyü kapat
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SettingsPage()),
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }

  void showSearchDialog(BuildContext context) {
    TextEditingController searchController = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Not Ara"),
          content: TextField(
            controller: searchController,
            decoration: InputDecoration(
              hintText: "Aranacak not adını girin",
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Diyalog kutusunu kapat
              },
              child: Text("İptal"),
            ),
            TextButton(
              onPressed: () {
                String searchText = searchController.text.trim();
                if (searchText.isNotEmpty) {

                }
                Navigator.pop(context); // Diyalog kutusunu kapat
              },
              child: Text("Ara"),
            ),
          ],
        );
      },
    );
  }
}