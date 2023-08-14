// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$RegisterController on RegisterControllerBase, Store {
  late final _$userRegisterAtom =
      Atom(name: 'RegisterControllerBase.userRegister', context: context);

  @override
  UserRegisterModel get userRegister {
    _$userRegisterAtom.reportRead();
    return super.userRegister;
  }

  @override
  set userRegister(UserRegisterModel value) {
    _$userRegisterAtom.reportWrite(value, super.userRegister, () {
      super.userRegister = value;
    });
  }

  @override
  String toString() {
    return '''
userRegister: ${userRegister}
    ''';
  }
}
