import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:notlar/pages/homepage/addnote/drawingpage.dart';
import 'package:notlar/pages/homepage/addnote/selectfolderpage.dart';
import 'package:signature/signature.dart';

class AddNoteHomePage extends StatefulWidget {
  @override
  AddNoteHomePageState createState() => AddNoteHomePageState();
}

class AddNoteHomePageState extends State<AddNoteHomePage> {
  final TextEditingController notecontroller = TextEditingController();
  final SignatureController signaturecontroller = SignatureController(
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
              // Notu kaydetme işlevselliği
              String note = notecontroller.text;

              // Notun ismini al
              String? noteName = await getNoteName(context);
              if (noteName == null || noteName.isEmpty) {
                // Eğer not adı girilmediyse, kaydetme işlemini iptal et
                return;
              }

              // Klasör seçimi için dialog göster
              String? selectedFolder = await showDialog<String>(
                context: context,
                builder: (BuildContext context) {
                  return SelectFolderPage();
                },
              );

              if (selectedFolder != null) {
                // Notu seçilen klasöre kaydet
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
                      controller: notecontroller, // Controller atanması
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
                  builder: (context) => DrawingPage(controller: signaturecontroller),
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

  // Notun ismini almak için bir metot
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
}
