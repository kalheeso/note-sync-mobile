// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'projeto_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ProjetoController on ProjetoControllerBase, Store {
  late final _$currentProjetoAtom =
      Atom(name: 'ProjetoControllerBase.currentProjeto', context: context);

  @override
  ProjetoSolo? get currentProjeto {
    _$currentProjetoAtom.reportRead();
    return super.currentProjeto;
  }

  @override
  set currentProjeto(ProjetoSolo? value) {
    _$currentProjetoAtom.reportWrite(value, super.currentProjeto, () {
      super.currentProjeto = value;
    });
  }

  late final _$projetoEditAtom =
      Atom(name: 'ProjetoControllerBase.projetoEdit', context: context);

  @override
  Projeto get projetoEdit {
    _$projetoEditAtom.reportRead();
    return super.projetoEdit;
  }

  @override
  set projetoEdit(Projeto value) {
    _$projetoEditAtom.reportWrite(value, super.projetoEdit, () {
      super.projetoEdit = value;
    });
  }

  late final _$projetoCreateAtom =
      Atom(name: 'ProjetoControllerBase.projetoCreate', context: context);

  @override
  Projeto get projetoCreate {
    _$projetoCreateAtom.reportRead();
    return super.projetoCreate;
  }

  @override
  set projetoCreate(Projeto value) {
    _$projetoCreateAtom.reportWrite(value, super.projetoCreate, () {
      super.projetoCreate = value;
    });
  }

  late final _$projetosStateAtom =
      Atom(name: 'ProjetoControllerBase.projetosState', context: context);

  @override
  ProjetosState get projetosState {
    _$projetosStateAtom.reportRead();
    return super.projetosState;
  }

  @override
  set projetosState(ProjetosState value) {
    _$projetosStateAtom.reportWrite(value, super.projetosState, () {
      super.projetosState = value;
    });
  }

  late final _$currentProjetoStateAtom =
      Atom(name: 'ProjetoControllerBase.currentProjetoState', context: context);

  @override
  CurrentProjetoState get currentProjetoState {
    _$currentProjetoStateAtom.reportRead();
    return super.currentProjetoState;
  }

  @override
  set currentProjetoState(CurrentProjetoState value) {
    _$currentProjetoStateAtom.reportWrite(value, super.currentProjetoState, () {
      super.currentProjetoState = value;
    });
  }

  @override
  String toString() {
    return '''
currentProjeto: ${currentProjeto},
projetoEdit: ${projetoEdit},
projetoCreate: ${projetoCreate},
projetosState: ${projetosState},
currentProjetoState: ${currentProjetoState}
    ''';
  }
}
