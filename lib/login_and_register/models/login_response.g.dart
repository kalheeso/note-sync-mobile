// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginResponse _$LoginResponseFromJson(Map<String, dynamic> json) =>
    LoginResponse(
      authToken: json['access_token'] as String?,
      idLogin: json['id_login'] as int?,
      idUsuario: json['id_usuario'] as int?,
      dataExpiracao: json['exp'] as String?,
    );

Map<String, dynamic> _$LoginResponseToJson(LoginResponse instance) =>
    <String, dynamic>{
      'access_token': instance.authToken,
      'id_login': instance.idLogin,
      'id_usuario': instance.idUsuario,
      'exp': instance.dataExpiracao,
    };
