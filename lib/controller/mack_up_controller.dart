import 'package:api/model/res/list_mack_up_model.dart';
import 'package:api/service/list_mack_up_service.dart';
import 'package:get/get.dart';

class MackUpController extends GetxController {
  var isLoading = true.obs;
  var product = <MackUpModel>[].obs;

  @override
  void onInit() {
    fetchProduct();
    super.onInit();
  }

  void fetchProduct() async {
    isLoading(true);
    try {
      final item = await MackUpService.getProducts();
      product.value = item!;
    } finally {
      isLoading(false);
    }
  }
}
