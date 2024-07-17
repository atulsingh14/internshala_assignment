import 'package:http/http.dart' as http;
import 'dart:convert';

/*
  Defines a service class (ApiService) to fetch internship data asynchronously
  Uses HTTP GET request to retrieve data and decodes the JSON response.
  Throws an exception if fetching fails.
*/

class ApiService {
  static const String baseUrl = 'https://internshala.com/flutter_hiring/search';

  static Future<Map<String, dynamic>> getInternships() async {
    final response = await http.get(Uri.parse(baseUrl));
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load internships');
    }
  }
}
