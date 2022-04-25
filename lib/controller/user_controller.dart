import 'package:api/model/res/map_user_model.dart';
import 'package:api/service/map_user_service.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  var isLoading = true.obs;
  UserModel? userList;

  @override
  void onInit() {
    fetchUser();
    super.onInit();
  }

  void fetchUser() async {
    isLoading(true);
    try {
      final data = await UserService.grtUser();
      userList = data;
    } finally {
      isLoading(false);
    }
  }
}
