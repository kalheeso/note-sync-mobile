import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:note_sync/login_and_register/controllers/login_controller.dart';
import 'package:note_sync/user/controllers/user_controller.dart';

class Requester {
  var dio = Dio();

  Requester() {
    dio.options = BaseOptions(contentType: 'application/json');

    final userController = GetIt.instance<UserController>();
    final loginController = GetIt.instance<LoginController>();

    dio.interceptors.add(InterceptorsWrapper(
        onRequest: (requestOptions, handler) async {
          if (userController.loggedInUser!.expiracaoTokenInMilliseconds < DateTime.now().millisecondsSinceEpoch) {
            await loginController.logarUsuario(username: userController.loggedInUser!.username, password: userController.loggedInUser!.password);
          }
          requestOptions.headers.putIfAbsent(
              'Authorization', () => 'Bearer ${userController.loggedInUser!.authToken}');
          handler.next(requestOptions);
        },
        onError: (err, handler) async {
          // if (err.response?.statusCode == 401) {
            handler.reject(err);
        }));
  
  }
}