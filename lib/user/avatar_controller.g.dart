// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'controllers/avatar_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AvatarController on AvatarControllerBase, Store {
  late final _$avatarPathAtom =
      Atom(name: 'AvatarControllerBase.avatarPath', context: context);

  @override
  String? get avatarPath {
    _$avatarPathAtom.reportRead();
    return super.avatarPath;
  }

  @override
  set avatarPath(String? value) {
    _$avatarPathAtom.reportWrite(value, super.avatarPath, () {
      super.avatarPath = value;
    });
  }

  @override
  String toString() {
    return '''
avatarPath: ${avatarPath}
    ''';
  }
}
