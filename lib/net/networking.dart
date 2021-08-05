import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper {

  final Uri url;

  NetworkHelper(this.url);

  Future getData() async {
    http.Response response = await http.get(url);

    if (response.statusCode == 200) {
      String data = response.body;
      // decodedData is of type var because it is dynamic. Don't know what the type will be before data is processed.

      return jsonDecode(data);
    } else {
      print(response.statusCode);
    }
  }
}