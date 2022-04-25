import 'package:api/api_handler/api_handler.dart';
import 'package:api/api_routs/api_routs.dart';
import 'package:api/model/res/map_user_model.dart';

class UserService {
  static Future<UserModel?> grtUser() async {
    var response = await API.apiHandler(
      url: ApiRouts.allUserUrl,
      apiType: ApiType.aGet,
    );
    return userModelFromJson(response);
  }

  // static Future<UserModel?> grtUser() async {
  //   http.Response response = await http.get(
  //     Uri.parse(ApiRouts.userUrl),
  //   );
  //   if (response.statusCode == 200) {
  //     print('===>>> ${jsonDecode(response.body)}');
  //     var jsonString = response.body;
  //     return userModelFromJson(jsonString);
  //   }
  // }
}
