// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$LoginController on LoginControllerBase, Store {
  late final _$userLoginModelAtom =
      Atom(name: 'LoginControllerBase.userLoginModel', context: context);

  @override
  UserLoginModel get userLoginModel {
    _$userLoginModelAtom.reportRead();
    return super.userLoginModel;
  }

  @override
  set userLoginModel(UserLoginModel value) {
    _$userLoginModelAtom.reportWrite(value, super.userLoginModel, () {
      super.userLoginModel = value;
    });
  }

  late final _$loginStateAtom =
      Atom(name: 'LoginControllerBase.loginState', context: context);

  @override
  State get loginState {
    _$loginStateAtom.reportRead();
    return super.loginState;
  }

  @override
  set loginState(State value) {
    _$loginStateAtom.reportWrite(value, super.loginState, () {
      super.loginState = value;
    });
  }

  @override
  String toString() {
    return '''
userLoginModel: ${userLoginModel},
loginState: ${loginState}
    ''';
  }
}
