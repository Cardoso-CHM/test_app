import 'dart:convert';

import 'package:http/http.dart';
import 'package:test_app/common/api_routes.dart';
import 'package:test_app/service/base_service.dart';

class UserService extends BaseService {
  Future<Response> login(String email, String password) {
    final uri = Uri.parse(BASE_URL + AUTH);
    final body = json.encode({
      "email": email,
      "senha": password,
    });

    return client.post(uri,
      body: body,
      headers: {"Content-Type": "application/json"});
  }
}
