import 'package:json_annotation/json_annotation.dart';

part 'cadastro_usuario_response.g.dart';

@JsonSerializable(explicitToJson: true)
class CadastroUsuarioResponse {
  @JsonKey(name: 'msg')
  final String? mensagem;
  @JsonKey(name: 'id_usuario')
  final int? idUsuario;
  

  const CadastroUsuarioResponse({this.mensagem, this.idUsuario});

  factory CadastroUsuarioResponse.fromJson(Map<String, dynamic> json) => _$CadastroUsuarioResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CadastroUsuarioResponseToJson(this);
}
