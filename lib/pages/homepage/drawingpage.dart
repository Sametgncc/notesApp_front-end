import 'package:flutter/material.dart';
import 'package:signature/signature.dart';

class DrawingPage extends StatefulWidget {
  final SignatureController controller;

  const DrawingPage({Key? key, required this.controller}) : super(key: key);

  @override
  DrawingPageState createState() => DrawingPageState();
}

class DrawingPageState extends State<DrawingPage> {
  bool isEraserEnabled = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Çizim Sayfası'),
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: GestureDetector(
              onPanUpdate: (details) {
                if (!isEraserEnabled && isPointInBounds(details.localPosition)) {
                  widget.controller.addPoint(details.localPosition as Point);
                } else if (isEraserEnabled) {
                  widget.controller.clear();
                }
              },
              child: Signature(
                controller: widget.controller,
                backgroundColor: Colors.white,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      isEraserEnabled = !isEraserEnabled;
                    });
                  },
                  child: Text(isEraserEnabled ? 'Kalem' : 'Silgi'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Çizim bölgesi içindeki bir noktayı kontrol etmek için yardımcı işlev
  bool isPointInBounds(Offset point) {
    return point.dx >= 0 && point.dy >= 0;
  }
}
