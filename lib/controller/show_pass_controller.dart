import 'package:get/get.dart';

class ShowPasswordController extends GetxController {
  var isShow = false.obs;

  isShowing() {
    isShow.value = !isShow.value;
  }
}
