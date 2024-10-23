import 'dart:convert';
import 'package:http/http.dart' as http;
import 'surah.dart';

class ApiService {
  final String apiUrl = "https://quran-api-id.vercel.app/surahs";

  Future<List<Surah>> fetchSurahs() async {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      final List<dynamic> jsonData = json.decode(response.body);
      return jsonData.map((json) => Surah.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load surahs');
    }
  }
}
