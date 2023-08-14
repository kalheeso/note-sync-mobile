import 'package:json_annotation/json_annotation.dart';

part 'login_response.g.dart';

@JsonSerializable(explicitToJson: true)
class LoginResponse {
  @JsonKey(name: 'access_token')
  final String? authToken;
  @JsonKey(name: 'id_login')
  final int? idLogin;
  @JsonKey(name: 'id_usuario')
  final int? idUsuario;
  @JsonKey(name: 'exp')
  final String? dataExpiracao;

  DateTime get dataExpiracaoInDateTime => DateTime.parse(dataExpiracao!);
  

  const LoginResponse({this.authToken, this.idLogin, this.idUsuario, this.dataExpiracao});

  factory LoginResponse.fromJson(Map<String, dynamic> json) => _$LoginResponseFromJson(json);

  Map<String, dynamic> toJson() => _$LoginResponseToJson(this);
}
