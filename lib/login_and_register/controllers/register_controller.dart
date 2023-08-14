

import 'package:mobx/mobx.dart';
import 'package:note_sync/login_and_register/models/cadastro_login_response.dart';
import 'package:note_sync/login_and_register/models/cadastro_usuario_response.dart';
import 'package:note_sync/login_and_register/services/register_services.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'register_controller.g.dart';

class RegisterController = RegisterControllerBase with _$RegisterController;

abstract class RegisterControllerBase with Store {

  final RegisterServices _services = RegisterServices();

  @observable
  UserRegisterModel userRegister = UserRegisterModel(username: '', email: '', senha: '', senhaRepeticao: '');


  bool isLoginRegisterValid() {
    return userRegister.username.length >= 3 && isEmailValid() 
      && userRegister.senha.length >= 3 && userRegister.senha == userRegister.senhaRepeticao;
  }

  bool isEmailValid() {
    return userRegister.email.length > 7 && userRegister.email.contains('@') && (userRegister.email.endsWith('gmail.com') ||
     userRegister.email.endsWith('outlook.com') || userRegister.email.endsWith('yahoo.com'));
  }

  bool isUserRegisterValid() {
    return userRegister.nome != null && userRegister.nome!.length >= 5 && userRegister.apelido != null && userRegister.apelido!.length >= 3;
  }

  Future<void> registerLogin({required String username, required String senha, required String email}) async {
    try {
      CadastroLoginResponse cadastroLoginResponse =  await _services.registerLogin(username: username, senha: senha, email: email);
      SharedPreferences.getInstance().then((sp) {
        if (cadastroLoginResponse.idLogin != null) {
          sp.setInt('id_login', cadastroLoginResponse.idLogin!);
        }
      });
    } catch (e) {
      rethrow;
    }
  }

  Future<void> registerUsuario({required String nome, required String apelido}) async {
    try {
      var sp = await SharedPreferences.getInstance();
      int idLogin = sp.getInt('id_login')!;
      CadastroUsuarioResponse cadastroLoginResponse =  await _services.registerUsuario(nome: nome, apelido: apelido, idLogin: idLogin);
      if (cadastroLoginResponse.idUsuario != null) sp.setInt('id_usuario', cadastroLoginResponse.idUsuario!);
    } catch (e) {
      rethrow;
    }
  }

}

class UserRegisterModel {
  String username;
  String email;
  String senha;
  String senhaRepeticao;
  String? apelido;
  String? nome;
  String? dataNascimento;
  String? avatar;

  UserRegisterModel copyWith({String? username, String? email, String? senha, 
      String? senhaRepeticao, String? apelido, String? nome, 
      String? dataNascimento, String? avatar}) =>
    UserRegisterModel(email: email ?? this.email, senha: senha ?? this.senha,
      username: username ?? this.username, apelido: apelido ?? this.apelido, 
      avatar: avatar ?? this.avatar, dataNascimento: dataNascimento ?? this.dataNascimento, 
      nome: nome ?? this.nome, senhaRepeticao: senhaRepeticao ?? this.senhaRepeticao);

  UserRegisterModel({required this.username, required this.email, required this.senha, required this.senhaRepeticao, this.apelido, this.nome, this.dataNascimento, this.avatar});
}