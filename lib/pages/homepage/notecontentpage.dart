import 'package:flutter/material.dart';

class NoteContentPage extends StatelessWidget {
  final String noteContent;

  const NoteContentPage({Key? key, required this.noteContent}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController(text: noteContent);
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
              TextFormField(
                autofocus: true,
                controller: controller,
                decoration: InputDecoration(
                  labelText: 'Notunuzu buraya düzenleyin...',
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop(controller.text);
                },
                child: Text('Kaydet'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
