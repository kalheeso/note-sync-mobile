

import 'package:mobx/mobx.dart';
import 'package:note_sync/projects/models/projeto.dart';
import 'package:note_sync/projects/models/projeto_solo.dart';
import 'package:note_sync/projects/services/project_services.dart';
import 'package:note_sync/shared/colors.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:diacritic/diacritic.dart';


part 'projeto_controller.g.dart';

class ProjetoController = ProjetoControllerBase with _$ProjetoController;

abstract class ProjetoControllerBase with Store {

  final ProjetoServices _services = ProjetoServices();

  ObservableList<Projeto> projetos = ObservableList<Projeto>.of([]);

  ObservableList<Projeto> projetosFiltrados = ObservableList<Projeto>.of([]);

  @observable
  ProjetoSolo? currentProjeto;

  @observable
  Projeto projetoEdit = Projeto(nome: '', descricao: '');

  @observable
  Projeto projetoCreate = Projeto(nome: '', descricao: '');

  @observable
  ProjetosState projetosState = ProjetosState.initial;

  @observable
  CurrentProjetoState currentProjetoState = CurrentProjetoState.initial;


  Future<void> getProjetoById(int idProjeto) async {
    currentProjetoState = CurrentProjetoState.loading;
      try {
        currentProjeto = await _services.getProjetoById(idProjeto: idProjeto);
        currentProjetoState = currentProjeto!.etapas.isEmpty ? CurrentProjetoState.empty : CurrentProjetoState.loaded;
      } catch (e) {
        currentProjetoState = CurrentProjetoState.error;
      }
  }

  Future<void> getProjetosCriados() async {
    projetosState = ProjetosState.loading;
    SharedPreferences.getInstance().then((sp) async {
      try {
        int idUsuario = sp.getInt('id_usuario')!;
        projetos.clear();
        projetos.addAll(await _services.listarProjetos(idUsuario: idUsuario));
        projetos.sort((a, b) => a.id!.compareTo(b.id!));
        for (int i = 0; i < projetos.length; i++) {
          projetos[i].gradient = colorsList[i];
        }
        projetosState = projetos.isEmpty ? ProjetosState.empty : ProjetosState.loaded;
      } catch (e) {
        projetosState = ProjetosState.error;
      }
    });
  }

  Future<void> deleteProjeto(int idProjeto) async {
    try {
      await _services.deleteProjeto(idProjeto: idProjeto);
      getProjetosCriados();
    } catch (e) {
      rethrow;
    }
  }

  bool enableEditProjeto() => (projetoEdit.nome!.isNotEmpty) || (projetoEdit.descricao!.isNotEmpty);

  bool enableCreateProjeto() => (projetoCreate.nome!.isNotEmpty) && (projetoCreate.descricao!.isNotEmpty);

  Future<void> editProjeto({required int idProjeto, String? nome, String? descricao}) async {
    try {
      await _services.editProjeto(idProjeto: idProjeto, descricao: descricao, nome: nome);
      getProjetosCriados();
    } catch (e) {
      rethrow;
    }
  }

  Future<void> createProjeto({required String nome, required String descricao}) async {
    try {
      projetosState = ProjetosState.loading;
      SharedPreferences.getInstance().then((sp) async {
        int idUsuario = sp.getInt('id_usuario')!;
        await _services.createProjeto(idUsuario: idUsuario, descricao: descricao, nome: nome);
        getProjetosCriados();
      });
    } catch (e) {
      rethrow;
    }
  }

  void filterListProjetos(String nome) {
    if (nome.isEmpty) {
      projetosState = ProjetosState.loaded;
      return;
    }
    projetosState = ProjetosState.filtering;
    removeDiacritics(nome);
    projetosFiltrados.clear();
    projetosFiltrados.addAll(projetos.where((projeto) => removeDiacriticsAndUpperCase(projeto.nome!).contains(removeDiacriticsAndUpperCase(nome))
      || removeDiacriticsAndUpperCase(projeto.descricao!).contains(removeDiacriticsAndUpperCase(nome))));

  }

  String removeDiacriticsAndUpperCase(String text) {
    return removeDiacritics(text.toUpperCase());
  }
}

enum ProjetosState {
  initial,
  filtering,
  loaded,
  error,
  loading,
  empty,
} 

enum CurrentProjetoState {
  initial,
  loaded,
  error,
  loading,
  empty
} 