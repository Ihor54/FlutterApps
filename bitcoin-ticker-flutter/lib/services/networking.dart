import 'dart:convert';
import 'package:http/http.dart' as http;

class NetworkHelper {
  Future<dynamic> getData(String url) async {
    var uriResponse = await http.get(url);
    if (uriResponse.statusCode == 200) {
      String data = uriResponse.body;
      return jsonDecode(data);
    } else {
      print("request failed with: ${uriResponse.statusCode} status code");
    }
  }
}
