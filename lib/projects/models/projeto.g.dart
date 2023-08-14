// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'projeto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Projeto _$ProjetoFromJson(Map<String, dynamic> json) => Projeto(
      id: json['id_projeto'] as int?,
      nome: json['nome'] as String? ?? '',
      descricao: json['descricao'] as String? ?? '',
    );

Map<String, dynamic> _$ProjetoToJson(Projeto instance) => <String, dynamic>{
      'id_projeto': instance.id,
      'nome': instance.nome,
      'descricao': instance.descricao,
    };
