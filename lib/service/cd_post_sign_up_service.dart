import 'dart:convert';
import 'package:api/api_routs/api_routs.dart';
import 'package:http/http.dart' as http;

class SignUpServices {
  static Future<bool?> signUp({required Map<String, dynamic> reqBody}) async {
    http.Response response =
        await http.post(Uri.parse(ApiRouts.signUpUserUrl), body: reqBody);
    if (response.statusCode == 200) {
      print('==>>${response.body}');
      return jsonDecode(response.body)['status'];
    }
  }
}
