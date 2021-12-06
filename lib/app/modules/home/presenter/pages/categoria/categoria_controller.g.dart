// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'categoria_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CategoriaController on _CategoriaStoreBase, Store {
  final _$categoriaControllerAtom =
      Atom(name: '_CategoriaStoreBase.categoriaController');

  @override
  StreamController<List<ArModel>> get categoriaController {
    _$categoriaControllerAtom.reportRead();
    return super.categoriaController;
  }

  @override
  set categoriaController(StreamController<List<ArModel>> value) {
    _$categoriaControllerAtom.reportWrite(value, super.categoriaController, () {
      super.categoriaController = value;
    });
  }

  final _$selectCategoriaListAsyncAction =
      AsyncAction('_CategoriaStoreBase.selectCategoriaList');

  @override
  Future selectCategoriaList(CategoriaDto categoriaDto) {
    return _$selectCategoriaListAsyncAction
        .run(() => super.selectCategoriaList(categoriaDto));
  }

  @override
  String toString() {
    return '''
categoriaController: ${categoriaController}
    ''';
  }
}
