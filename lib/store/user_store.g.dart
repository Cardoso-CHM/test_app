// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$UserStore on _USerStore, Store {
  Computed<bool>? _$connectedComputed;

  @override
  bool get connected => (_$connectedComputed ??=
          Computed<bool>(() => super.connected, name: '_USerStore.connected'))
      .value;

  final _$currentUserAtom = Atom(name: '_USerStore.currentUser');

  @override
  User get currentUser {
    _$currentUserAtom.reportRead();
    return super.currentUser;
  }

  @override
  set currentUser(User value) {
    _$currentUserAtom.reportWrite(value, super.currentUser, () {
      super.currentUser = value;
    });
  }

  final _$getCurrentUserAsyncAction = AsyncAction('_USerStore.getCurrentUser');

  @override
  Future<User> getCurrentUser() {
    return _$getCurrentUserAsyncAction.run(() => super.getCurrentUser());
  }

  @override
  String toString() {
    return '''
currentUser: ${currentUser},
connected: ${connected}
    ''';
  }
}
