import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class UserService {
  final String baseUrl = 'http://localhost:8080/api/v1/users';

  Future<void> register(String username, String password) async {
    var url = Uri.parse('$baseUrl/register');
    var response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'username': username,
        'password': password,
      }),
    );

    if (response.statusCode == 200) {
      print('Kullanıcı başarıyla kaydedildi');
    } else {
      print('Kullanıcı kaydedilemedi: ${response.reasonPhrase}');
    }
  }

  Future<void> login(String username, String password) async {
    var url = Uri.parse('$baseUrl/login');
    var response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'username': username,
        'password': password,
      }),
    );

    if (response.statusCode == 200) {
      print('Kullanıcı girişi başarılı');
      // Token'i sakla
      var responseData = jsonDecode(response.body);
      String token = responseData['token'];
      await saveToken(token);
    } else {
      print('Kullanıcı girişi başarısız: ${response.reasonPhrase}');
    }
  }

  Future<void> saveToken(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('token', token);
  }

// Diğer HTTP isteklerini buraya ekleyebilirsiniz...
}
