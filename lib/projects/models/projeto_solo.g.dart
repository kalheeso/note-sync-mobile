// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'projeto_solo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProjetoSolo _$ProjetoSoloFromJson(Map<String, dynamic> json) => ProjetoSolo(
      id: json['id'] as int?,
      nome: json['nome'] as String? ?? '',
      descricao: json['descricao'] as String? ?? '',
      etapas: (json['etapas'] as List<dynamic>?)
              ?.map((e) => Etapa.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$ProjetoSoloToJson(ProjetoSolo instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nome': instance.nome,
      'descricao': instance.descricao,
      'etapas': instance.etapas.map((e) => e.toJson()).toList(),
    };

Etapa _$EtapaFromJson(Map<String, dynamic> json) => Etapa(
      id: json['id'] as int?,
      titulo: json['titulo'] as String?,
      tarefas: (json['tarefas'] as List<dynamic>?)
              ?.map((e) => Tarefa.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$EtapaToJson(Etapa instance) => <String, dynamic>{
      'id': instance.id,
      'titulo': instance.titulo,
      'tarefas': instance.tarefas.map((e) => e.toJson()).toList(),
    };

Tarefa _$TarefaFromJson(Map<String, dynamic> json) => Tarefa(
      id: json['id'] as int?,
      descricao: json['descricao'] as String?,
      comentarios: (json['comentarios'] as List<dynamic>?)
              ?.map((e) => Comentario.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$TarefaToJson(Tarefa instance) => <String, dynamic>{
      'id': instance.id,
      'descricao': instance.descricao,
      'comentarios': instance.comentarios.map((e) => e.toJson()).toList(),
    };

Comentario _$ComentarioFromJson(Map<String, dynamic> json) => Comentario(
      id: json['id'] as int?,
      descricao: json['descricao'] as String?,
    );

Map<String, dynamic> _$ComentarioToJson(Comentario instance) =>
    <String, dynamic>{
      'id': instance.id,
      'descricao': instance.descricao,
    };
