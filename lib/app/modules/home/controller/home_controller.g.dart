// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeController on _HomeStoreBase, Store {
  final _$dadosAtom = Atom(name: '_HomeStoreBase.dados');

  @override
  StreamController<List<ArModel>> get dados {
    _$dadosAtom.reportRead();
    return super.dados;
  }

  @override
  set dados(StreamController<List<ArModel>> value) {
    _$dadosAtom.reportWrite(value, super.dados, () {
      super.dados = value;
    });
  }

  final _$getRecomendadosAsyncAction =
      AsyncAction('_HomeStoreBase.getRecomendados');

  @override
  Future getRecomendados() {
    return _$getRecomendadosAsyncAction.run(() => super.getRecomendados());
  }

  @override
  String toString() {
    return '''
dados: ${dados}
    ''';
  }
}
