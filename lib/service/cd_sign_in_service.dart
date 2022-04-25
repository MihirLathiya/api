import 'dart:convert';
import 'package:api/api_routs/api_routs.dart';
import 'package:http/http.dart' as http;

class SignInService {
  Future<bool?> signInUser({Map<String, dynamic>? reqBody}) async {
    http.Response response =
        await http.post(Uri.parse(ApiRouts.signInUrl), body: reqBody);
    if (response.statusCode == 200) {
      print('===>>>${jsonDecode(response.body)}');
      var result = jsonDecode(response.body);
      return result['status'];
    }
  }
}
