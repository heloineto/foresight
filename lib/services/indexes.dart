import 'dart:convert';
import 'package:http/http.dart' as http;

class IndexesService {
  final String apiUrl = 'https://indexes-api.vercel.app/api';

  Future<Map<String, dynamic>> fetchIndexes() async {
    final response = await http.get(Uri.parse('$apiUrl/history'));

    if (response.statusCode != 200) {
      throw Exception('Failed to fetch indexes');
    }

    print(json.decode(response.body));

    return json.decode(response.body);
  }
}
