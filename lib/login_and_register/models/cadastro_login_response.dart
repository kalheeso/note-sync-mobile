import 'package:json_annotation/json_annotation.dart';

part 'cadastro_login_response.g.dart';

@JsonSerializable(explicitToJson: true)
class CadastroLoginResponse {
  @JsonKey(name: 'msg')
  final String? mensagem;
  @JsonKey(name: 'id_login')
  final int? idLogin;
  

  const CadastroLoginResponse({this.mensagem, this.idLogin});

  factory CadastroLoginResponse.fromJson(Map<String, dynamic> json) => _$CadastroLoginResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CadastroLoginResponseToJson(this);
}
