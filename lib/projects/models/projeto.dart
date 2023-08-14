import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'projeto.g.dart';

@JsonSerializable(explicitToJson: true)
class Projeto {
  @JsonKey(name: 'id_projeto')
  final int? id;
  @JsonKey(name: 'nome', defaultValue: '')
  final String? nome;
  @JsonKey(name: 'descricao', defaultValue: '')
  final String? descricao;

  @JsonKey(includeFromJson: false, includeToJson: false)
  List<Color>? gradient;
  
  Projeto copyWith({String? nome, String? descricao}) => Projeto(descricao: descricao ?? this.descricao, id: id, nome: nome ?? this.nome);

  Projeto({this.id, this.nome, this.descricao, this.gradient});

  factory Projeto.fromJson(Map<String, dynamic> json) => _$ProjetoFromJson(json);

  Map<String, dynamic> toJson() => _$ProjetoToJson(this);
}
