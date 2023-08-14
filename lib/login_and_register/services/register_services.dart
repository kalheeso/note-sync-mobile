
import 'package:dio/dio.dart';
import 'package:note_sync/login_and_register/models/cadastro_login_response.dart';
import 'package:note_sync/login_and_register/models/cadastro_usuario_response.dart';
import 'package:note_sync/shared/requests_routes.dart';

class RegisterServices {

  Future<CadastroLoginResponse> registerLogin({required String username, required String senha, required String email }) async {
    try {
      var dio = Dio();
      Response response = await dio.post(RequestRoutes.cadastroLogin, data: {
        "username": username,
        "email": email,
        "senha": senha
      });
      return CadastroLoginResponse.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }

  Future<CadastroUsuarioResponse> registerUsuario({required String nome, required int idLogin, required String apelido}) async {
    try {
      var dio = Dio();
      Response response = await dio.post(RequestRoutes.cadastroDadosUsuario(idLogin), data: {
        "apelido": apelido,
        "nome_completo": nome,
        "data_nasc": "2023-08-09",
        "avatar": "ID1"
      });
      return CadastroUsuarioResponse.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }
}