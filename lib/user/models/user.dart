import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable(explicitToJson: true)
class User {
  @JsonKey(name: 'username')
  final String? username;
  @JsonKey(name: 'apelido')
  final String? apelido;
  @JsonKey(name: 'nome_completo')
  final String? nome;
  @JsonKey(name: 'email')
  final String? email;
  

  const User({this.username, this.apelido, this.nome, this.email});

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
