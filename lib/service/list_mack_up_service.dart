import 'package:api/api_handler/api_handler.dart';
import 'package:api/api_routs/api_routs.dart';
import 'package:api/model/res/list_mack_up_model.dart';

class MackUpService {
  static Future<List<MackUpModel>?> getProducts() async {
    var response =
        await API.apiHandler(url: ApiRouts.mackUpUrl, apiType: ApiType.aGet);

    return mackUpModelFromJson(response);
  }
}
