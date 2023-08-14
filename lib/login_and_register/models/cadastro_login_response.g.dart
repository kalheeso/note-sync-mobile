// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cadastro_login_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CadastroLoginResponse _$CadastroLoginResponseFromJson(
        Map<String, dynamic> json) =>
    CadastroLoginResponse(
      mensagem: json['msg'] as String?,
      idLogin: json['id_login'] as int?,
    );

Map<String, dynamic> _$CadastroLoginResponseToJson(
        CadastroLoginResponse instance) =>
    <String, dynamic>{
      'msg': instance.mensagem,
      'id_login': instance.idLogin,
    };
