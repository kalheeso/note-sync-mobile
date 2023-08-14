// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cadastro_usuario_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CadastroUsuarioResponse _$CadastroUsuarioResponseFromJson(
        Map<String, dynamic> json) =>
    CadastroUsuarioResponse(
      mensagem: json['msg'] as String?,
      idUsuario: json['id_usuario'] as int?,
    );

Map<String, dynamic> _$CadastroUsuarioResponseToJson(
        CadastroUsuarioResponse instance) =>
    <String, dynamic>{
      'msg': instance.mensagem,
      'id_usuario': instance.idUsuario,
    };
