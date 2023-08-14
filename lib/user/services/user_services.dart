
import 'package:dio/dio.dart';
import 'package:note_sync/dio/app_interceptor.dart';
import 'package:note_sync/shared/requests_routes.dart';
import 'package:note_sync/user/models/user.dart';

class UserServices {

  Future<User> getUserById(int id) async {
    try {
      Response response = await Requester().dio.get(RequestRoutes.dadosUsuario(id));
      return User.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }
}