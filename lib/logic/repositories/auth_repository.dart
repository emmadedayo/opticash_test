import 'package:http/http.dart';
import 'package:opticash/logic/http_service/AppUrl.dart';
import 'package:opticash/logic/http_service/http.dart';
import 'package:opticash/utils/enum.dart';

class AuthRepository {
  Future<Map> signUp(Map<String, dynamic> map) async {
    Response? response =
        await RestApi.getDataFromServer(ApiUrl.signUp, map, method: HttpMethod.POST);
    return RestApi.getMapFromResponse(response);
  }

  Future<Map> login(Map<String, dynamic> map) async {
    Response? response =
        await RestApi.getDataFromServer(ApiUrl.login, map, method: HttpMethod.POST);

    return RestApi.getMapFromResponse(response);
  }
}
