import 'package:flutter/material.dart';
import 'package:signature/signature.dart';

class DrawingPage extends StatefulWidget {
  final SignatureController controller;

  const DrawingPage({Key? key, required this.controller}) : super(key: key);

  @override
  DrawingPageState createState() => DrawingPageState();
}

class DrawingPageState extends State<DrawingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Çizim Sayfası'),
        actions: [
          IconButton(
            icon: Icon(Icons.check),
            onPressed: () {
              // Çizimi tamamladıktan sonra, çizim verilerini ana sayfaya gönder
              Navigator.pop(context, widget.controller.toPngBytes());
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Signature(
              controller: widget.controller,
              backgroundColor: Colors.white,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () {
                    widget.controller.clear();
                  },
                  child: Text('Temizle'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
