import 'package:mvcmvvmstructure/data/network/network_api_services.dart';
import 'package:mvcmvvmstructure/model/home/user_list_model.dart';
import 'package:mvcmvvmstructure/resources/app_url/app_url.dart';

class HomeRepository {
  final _apiServices = NetworkApiServices();

  Future<dynamic> userListApi() async {
    dynamic response = await _apiServices.getApi(AppUrl.userListApi);
    return UserListModel.fromJson(response);
  }
}
