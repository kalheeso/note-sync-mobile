import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'projeto_solo.g.dart';

@JsonSerializable(explicitToJson: true)
class ProjetoSolo {
  @JsonKey(name: 'id')
  final int? id;
  @JsonKey(name: 'nome', defaultValue: '')
  final String? nome;
  @JsonKey(name: 'descricao', defaultValue: '')
  final String? descricao;
  @JsonKey(name: 'etapas', defaultValue: [])
  List<Etapa> etapas;

  @JsonKey(includeFromJson: false, includeToJson: false)
  List<Color>? gradient;
  
  ProjetoSolo copyWith({String? nome, String? descricao}) => ProjetoSolo(descricao: descricao ?? this.descricao, etapas: etapas, id: id, nome: nome ?? this.nome);

  ProjetoSolo({this.id, this.nome, this.descricao, this.gradient, required this.etapas});

  factory ProjetoSolo.fromJson(Map<String, dynamic> json) => _$ProjetoSoloFromJson(json);

  Map<String, dynamic> toJson() => _$ProjetoSoloToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Etapa {
  @JsonKey(name: 'id')
  final int? id;
  @JsonKey(name: 'titulo')
  final String? titulo;
  @JsonKey(name: 'tarefas', defaultValue: [])
  final List<Tarefa> tarefas;

  Etapa({this.id, this.titulo, required this.tarefas});

  factory Etapa.fromJson(Map<String, dynamic> json) => _$EtapaFromJson(json);

  Map<String, dynamic> toJson() => _$EtapaToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Tarefa {
  @JsonKey(name: 'id')
  final int? id;
  @JsonKey(name: 'descricao')
  final String? descricao;
  @JsonKey(name: 'comentarios', defaultValue: [])
  List<Comentario> comentarios;

  Tarefa({this.id, this.descricao, required this.comentarios});

  factory Tarefa.fromJson(Map<String, dynamic> json) => _$TarefaFromJson(json);

  Map<String, dynamic> toJson() => _$TarefaToJson(this);

}

@JsonSerializable(explicitToJson: true)
class Comentario {
  @JsonKey(name: 'id')
  final int? id;
  @JsonKey(name: 'descricao')
  final String? descricao;

  Comentario({this.id, this.descricao});

  factory Comentario.fromJson(Map<String, dynamic> json) => _$ComentarioFromJson(json);

  Map<String, dynamic> toJson() => _$ComentarioToJson(this);

}

