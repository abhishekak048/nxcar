import 'package:get/get_connect/http/src/response/response.dart';
import 'package:nxcar/api/base/base_api_service.dart';
import 'package:nxcar/api/base/network_api_call.dart';

class LoginRepo extends BaseService {
  Future<dynamic> fetchData() async {
    Response apiResponse = await Api.instance.getRequest("url");
    return apiResponse;
  }
}
