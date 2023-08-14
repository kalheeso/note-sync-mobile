
import 'package:dio/dio.dart';
import 'package:note_sync/login_and_register/models/login_response.dart';
import 'package:note_sync/shared/requests_routes.dart';

class LoginServices {

  Future<LoginResponse> login({required String username, required String password}) async {
    try {
      Dio dio = Dio();
      Response response = await dio.post(RequestRoutes.loginUsuario, data: {
        "username": username,
        "senha": password
      });
      return LoginResponse.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }
}