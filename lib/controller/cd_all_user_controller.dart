import 'package:api/model/res/cd_all_user_model.dart';
import 'package:api/service/cd_all_user_service.dart';
import 'package:get/get.dart';

class AllUserController extends GetxController {
  var isLoading = true.obs;
  AllUserModel? userList;

  @override
  void onInit() {
    fetchAllUser();
    super.onInit();
  }

  void fetchAllUser() async {
    isLoading(true);
    try {
      final allData = await AllUserServices.getAllUser();

      userList = allData;
    } finally {
      isLoading(false);
    }
  }
}
