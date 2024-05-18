import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notlar/pages/homepage/notecontentpage.dart';

class FolderNotesPage extends StatefulWidget {
  final String folderName;

  const FolderNotesPage({Key? key, required this.folderName}) : super(key: key);

  @override
  FolderNotesPageState createState() => FolderNotesPageState();
}

class FolderNotesPageState extends State<FolderNotesPage> {
  List<String> notes = [
    'Note 1',
    'Note 2',
    'Note 3',
  ];
  List<String> deletednotes = [];
  List<String> archivednotes = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.grey[300],
        title: Text('${widget.folderName} '),
      ),
      body: ListView.builder(
        itemCount: notes.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(notes[index]),
            onTap: () {
              // Nota basıldığında yapılacak işlemler buraya yazılabilir
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      NoteContentPage(noteContent: notes[index]),
                ),
              );
            },
            onLongPress: () {
              // Aşağıdan açılır menüyü göster
              showModalBottomSheet(
                context: context,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(20.0),
                  ),
                ),
                backgroundColor: Colors.transparent,
                builder: (context) {
                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(20.0),
                      ),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        ListTile(
                          leading: Icon(Icons.edit),
                          title: Text('Düzenle'),
                          onTap: () {
                            // Düzenleme işlemi
                            Navigator.pop(context);
                            editNote(context, index);
                          },
                        ),
                        ListTile(
                          leading: Icon(Icons.delete),
                          title: Text('Sil'),
                          onTap: () {
                            // Silme işlemi
                            Navigator.pop(context);
                            deleteNoteConfirmation(context, index);
                          },
                        ),
                        ListTile(
                          leading: Icon(Icons.archive),
                          title: Text('Arşivle'),
                          onTap: () {
                            // Arşivleme işlemi
                            Navigator.pop(context);
                            archiveNoteConfirmation(context, index);
                          },
                        ),
                        ListTile(
                          leading: Icon(Icons.edit),
                          title: Text('Yeniden adlandır'),
                          onTap: () {
                            // Yeniden adlandırma işlemi
                            Navigator.pop(context);
                            renameNote(context, index);
                          },
                        ),
                      ],
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }

  void editNote(BuildContext context, int index) {
    // Düzenleme işlemi öncesi not içeriği sayfasına yönlendir
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => NoteContentPage(noteContent: notes[index]),
      ),
    ).then((editedNote) {
      if (editedNote != null) {
        // Eğer not içeriği düzenlendiyse, düzenlenen notu güncelle
        setState(() {
          notes[index] = editedNote;
        });
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Not Düzenlendi: $editedNote'),
            duration: Duration(seconds: 2),
          ),
        );
      }
    });
  }

  void deleteNoteConfirmation(BuildContext context, int index) {
    // Silme işlemi için onay isteme
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Notu Sil"),
          content: Text("Bu notu silmek istiyor musun?"),
          actions: <Widget>[
            TextButton(
              child: Text("Evet"),
              onPressed: () {
                deleteNote(context, index);
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text("Hayır"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void deleteNote(BuildContext context, int index) {
    // Silme işlemi
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('${notes[index]} Silindi'),
        duration: Duration(seconds: 2),
        action: SnackBarAction(
          label: 'Geri Al',
          onPressed: () {
            // Silinen notu geri ekle
            setState(() {
              notes.insert(index, deletednotes.last);
              deletednotes.removeLast();
            });
          },
        ),
      ),
    );
    // Notu listeden kaldır
    setState(() {
      deletednotes.add(notes[index]);
      notes.removeAt(index);
    });
  }

  void archiveNoteConfirmation(BuildContext context, int index) {
    // Arşivleme işlemi için onay isteme
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Notu Arşivle"),
          content: Text("Bu notu arşivlemek istiyor musun?"),
          actions: <Widget>[
            TextButton(
              child: Text("Evet"),
              onPressed: () {
                archiveNote(context, index);
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text("Hayır"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void archiveNote(BuildContext context, int index) {
    // Arşivleme işlemi
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('${notes[index]} Arşivlendi'),
        duration: Duration(seconds: 2),
        action: SnackBarAction(
          label: 'Geri Al',
          onPressed: () {
            // Arşivlenen notu geri ekle
            setState(() {
              notes.insert(index, archivednotes.last);
              archivednotes.removeLast();
            });
          },
        ),
      ),
    );
    // Notu listeden kaldır ve arşivlere ekle
    setState(() {
      archivednotes.add(notes[index]);
      notes.removeAt(index);
    });
  }

  void renameNote(BuildContext context, int index) {
    // Yeniden adlandırma işlemi
    showDialog(
      context: context,
      builder: (BuildContext context) {
        TextEditingController controller = TextEditingController(
            text: notes[index]);
        return AlertDialog(
          title: Text("Yeniden Adlandır"),
          content: TextFormField(
            autofocus: true, // Klavye otomatik olarak açılsın
            controller: controller,
            decoration: InputDecoration(hintText: "Yeni Not Adı"),
          ),
          actions: <Widget>[
            TextButton(
              child: Text("İptal"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text("Kaydet"),
              onPressed: () {
                String newName = controller.text;
                // Yeni ismi kullanarak notu yeniden adlandır
                notes[index] = newName;
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Not ismi güncellendi: $newName'),
                    duration: Duration(seconds: 2),
                  ),
                );
                Navigator.of(context).pop();
                setState(() {});
              },
            ),
          ],
        );
      },
    );
  }
}