

import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:note_sync/exceptions/custom_error.dart';
import 'package:note_sync/login_and_register/models/login_response.dart';
import 'package:note_sync/login_and_register/services/login_services.dart';
import 'package:note_sync/shared/states.dart';
import 'package:note_sync/user/controllers/user_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'login_controller.g.dart';

class LoginController = LoginControllerBase with _$LoginController;

abstract class LoginControllerBase with Store {

  final userController = GetIt.instance<UserController>();
  final LoginServices _services = LoginServices();

  @observable
  UserLoginModel userLoginModel = UserLoginModel(username: '', password: '');

  @observable
  State loginState = State.initial;

  bool isLoginTryValid() => userLoginModel.password.length >= 3 && userLoginModel.username.length >= 3;

  Future<void> logarUsuario({required String username, required String password}) async {
    try {
      loginState = State.loading;
      LoginResponse response = await _services.login(username: username, password: password);
      userController.loggedInUser = LoggedInUser(username: username, password: password,
        id: response.idLogin!, authToken: response.authToken!, expiracaoTokenInMilliseconds: response.dataExpiracaoInDateTime.millisecondsSinceEpoch);
      SharedPreferences.getInstance().then((sp) {
        sp.setString('username', username);
        sp.setString('password', password);
        sp.setString('authToken', response.authToken!);
        sp.setInt('id_usuario', response.idUsuario!);
        sp.setInt('id_login', response.idLogin!);
        sp.setInt('exp_token', response.dataExpiracaoInDateTime.millisecondsSinceEpoch);
      });
      loginState = State.success;
    } catch (e) {
      loginState = State.error;
      rethrow;
    }
  }
  

  void deslogarUsuario() {
    SharedPreferences.getInstance().then((sp) {
      sp.clear();
    });
  }

}

class UserLoginModel {

  String username;
  String password;

  UserLoginModel copyWith({String? username, String? password}) => UserLoginModel(password: password ?? this.password, username: username ?? this.username);

  UserLoginModel({required this.username, required this.password});
}