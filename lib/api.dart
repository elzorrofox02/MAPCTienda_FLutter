import 'package:http/http.dart' as http;
import 'package:hellowork/models/adress_list.dart';

class ApiConstants {
  static String baseUrl = 'https://jsonplaceholder.typicode.com';
  static String usersEndpoint = '/users';
}

class ApiService {
  Future<List<AdressListCard>?> getUsers() async {
    try {
      var url = Uri.parse(ApiConstants.baseUrl + ApiConstants.usersEndpoint);
      var response = await http.get(url);
      if (response.statusCode == 200) {
        List<AdressListCard> _model = userModelFromJson(response.body);
        return _model;
      }
    } catch (e) {
      print(e);
    }
  }
}
