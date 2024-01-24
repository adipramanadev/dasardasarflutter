import 'dart:convert';
import 'package:http/http.dart' as http;

class DbHelper {
  //getData
  Future getData() async {
    String url = " http://192.168.23.147:8000/api/get-crud"; //url api

    var response = await http.get(
      Uri.parse(url),
    );
    return json.decode(response.body)['data'];
  }
}
