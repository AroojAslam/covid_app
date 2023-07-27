import 'dart:convert';
import 'package:http/http.dart' as http;
import 'appURL.dart';
import 'models/worldState.dart';


class StatesServices {
  Future<WorldStates> fetchWorldStates() async {
    final response = await http.get(Uri.parse(Appurl.worldStates));

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      return WorldStates.fromJson(data);
    } else {
      throw Exception('Error');
    }
  }
}