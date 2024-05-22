import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:notlar/pages/homepage/addnote/selectfolderpage.dart';
import 'package:signature/signature.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'drawingpage.dart';

class AddNoteHomePage extends StatefulWidget {
  @override
  AddNoteHomePageState createState() => AddNoteHomePageState();
}

class AddNoteHomePageState extends State<AddNoteHomePage> {
  final TextEditingController noteController = TextEditingController();
  final SignatureController signatureController = SignatureController(
    penStrokeWidth: 5,
    penColor: Colors.black,
    exportBackgroundColor: Colors.white,
  );
  final ImagePicker picker = ImagePicker();
  List<XFile> images = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.grey[300],
        title: Text('Yeni Not Ekle'),
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () async {
              String noteContent = noteController.text;

              String? noteName = await getNoteName(context);
              if (noteName == null || noteName.isEmpty) {
                return;
              }

              // Klasör seçimi (Eğer varsa)
              String? selectedFolder = await showDialog<String>(
                context: context,
                builder: (BuildContext context) {
                  return SelectFolderPage();
                },
              );

              if (selectedFolder != null) {
                // Not oluşturma fonksiyonunu çağır
                await createNote(noteName, noteContent);
                print('Not kaydedildi: $noteName, Klasör: $selectedFolder');
              }

              Navigator.pop(context); // Not ekleme ekranından çık
            },
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    TextField(
                      controller: noteController, // Controller atanması
                      decoration: InputDecoration(
                        hintText: 'Notunuzu buraya yazın',
                        border: InputBorder.none,
                      ),
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                    ),
                    SizedBox(height: 16),
                    buildImageGallery(),
                  ],
                ),
              ),
            ),
            buildBottomBar(context),
          ],
        ),
      ),
    );
  }

  Widget buildImageGallery() {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: images.map((image) {
        return Image.file(
          File(image.path),
          width: 100,
          height: 100,
          fit: BoxFit.cover,
        );
      }).toList(),
    );
  }

  Widget buildBottomBar(BuildContext context) {
    return Container(
      color: Colors.grey[300],
      padding: EdgeInsets.all(8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            icon: Icon(Icons.brush),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DrawingPage(controller: signatureController),
                ),
              );
            },
          ),
          IconButton(
            icon: Icon(Icons.photo),
            onPressed: () {
              pickImage();
            },
          ),
        ],
      ),
    );
  }

  Future<void> pickImage() async {
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        images.add(image);
      });
    }
  }

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

  Future<void> createNote(String title, String content) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');

    if (token == null) {
      print('Kullanıcı giriş yapmamış.');
      return;
    }

    var url = Uri.parse('http://localhost:8080/v1/notes');
    var response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode({
        'title': title,
        'content': content,
      }),
    );

    if (response.statusCode == 200) {
      print('Not başarıyla oluşturuldu');
    } else {
      print('Not oluşturulamadı: ${response.reasonPhrase}');
    }
  }
}
