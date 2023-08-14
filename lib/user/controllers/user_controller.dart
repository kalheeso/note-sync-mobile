import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:note_sync/root_page/root_controller.dart';
import 'package:note_sync/user/models/user.dart';
import 'package:note_sync/user/services/user_services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserController  {

  final UserServices _services = UserServices();
  
  LoggedInUser? loggedInUser;

  @observable
  User? sessionUser;

  Future<void> tryAndFetchLoggedUser({Function? onSuccess, Function? onError}) async {
    try {
      var sp = await SharedPreferences.getInstance();
      // sp.clear();
      loggedInUser = LoggedInUser(username: sp.getString('username')!, 
        password: sp.getString('password')!, id: sp.getInt('id_usuario')!, 
        authToken: sp.getString('authToken')!, expiracaoTokenInMilliseconds: sp.getInt('exp_token')!);
      onSuccess?.call();
    } catch (e) {
      onError?.call();
    }
  }

  Future<void> getUserData({Function? onSuccess, Function? onError}) async {
    SharedPreferences.getInstance().then((sp) async {
      try {
        int idUsuario = sp.getInt('id_usuario')!;
        sessionUser = await _services.getUserById(idUsuario);
        sessionUser;
      } catch (e) {
        rethrow;
      }
    });
      
  }

  Future<void> encerrarSessao() async {
      sessionUser = User();
      GetIt.instance<RootController>().currentIndex = 0;
      var sp = await SharedPreferences.getInstance();
      sp.clear();
  }

}

class LoggedInUser {

  String username;
  String password;
  int id;
  String authToken;
  int expiracaoTokenInMilliseconds;

  LoggedInUser({required this.username, required this.password, required this.id, required this.authToken, required this.expiracaoTokenInMilliseconds});
}