import 'package:dio/dio.dart';
import 'package:note_sync/dio/app_interceptor.dart';
import 'package:note_sync/projects/models/projeto_solo.dart';
import 'package:note_sync/shared/requests_routes.dart';
import 'package:note_sync/projects/models/projeto.dart';


class ProjetoServices {

  Future<List<Projeto>> listarProjetos({required int idUsuario}) async {
    try {
      Response response = await Requester().dio.get(RequestRoutes.listarProjetos(idUsuario),);
      List<Projeto> projetos = [];
      response.data.forEach((projetoJson) {
        projetos.add(Projeto.fromJson(projetoJson));
      });
      return projetos;
    } catch (e) {
      rethrow;
    }
  }

  Future<ProjetoSolo> getProjetoById({required int idProjeto}) async {
    try {
      Response response = await Requester().dio.get(RequestRoutes.projeto(idProjeto),);
      return ProjetoSolo.fromJson(response.data.first);
    } catch (e) {
      rethrow;
    }
  }

  Future<void> deleteProjeto({required int idProjeto}) async {
    try {
      await Requester().dio.delete(RequestRoutes.projeto(idProjeto),);
    } catch (e) {
      rethrow;
    }
  }

  Future<void> editProjeto({required int idProjeto, String? nome, String? descricao}) async {
    try {
      await Requester().dio.put(RequestRoutes.projetoEditar(idProjeto), data: {
        "nome": nome,
        "descricao": descricao
      }, queryParameters: {
        "projeto_id": idProjeto
      });
    } catch (e) {
      rethrow;
    }
  }

  Future<void> createProjeto({required int idUsuario, required String nome, required String descricao}) async {
    try {
      await Requester().dio.post(RequestRoutes.projetoCriar(idUsuario), data: {
        "nome": nome,
        "descricao": descricao
      });
    } catch (e) {
      rethrow;
    }
  }
}