import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class NoteService {
  final String baseUrl = 'http://localhost:8080/v1/notes';

  Future<String?> getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('token');
  }

  Future<void> createNote(String title, String content) async {
    String? token = await getToken();

    if (token == null) {
      print('Kullanıcı giriş yapmamış.');
      return;
    }

    var url = Uri.parse(baseUrl);
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

// Diğer HTTP isteklerini buraya ekleyebilirsiniz...
}
