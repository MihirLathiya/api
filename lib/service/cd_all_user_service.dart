import 'package:api/api_routs/api_routs.dart';
import 'package:api/model/res/cd_all_user_model.dart';
import 'package:http/http.dart' as http;

class AllUserServices {
  static Future getAllUser() async {
    http.Response response = await http.get(
      Uri.parse(ApiRouts.allUserUrl),
    );
    if (response.statusCode == 200) {
      var jsonString = response.body;
      print('====>>> ${response.body}');
      return allUserModelFromJson(jsonString);
    }
  }
}
