// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeController on _HomeStoreBase, Store {
  final _$homeControllerAtom = Atom(name: '_HomeStoreBase.homeController');

  @override
  StreamController<List<ArModel>> get homeController {
    _$homeControllerAtom.reportRead();
    return super.homeController;
  }

  @override
  set homeController(StreamController<List<ArModel>> value) {
    _$homeControllerAtom.reportWrite(value, super.homeController, () {
      super.homeController = value;
    });
  }

  final _$validAtom = Atom(name: '_HomeStoreBase.valid');

  @override
  bool get valid {
    _$validAtom.reportRead();
    return super.valid;
  }

  @override
  set valid(bool value) {
    _$validAtom.reportWrite(value, super.valid, () {
      super.valid = value;
    });
  }

  final _$keyAboutMarajoARAtom = Atom(name: '_HomeStoreBase.keyAboutMarajoAR');

  @override
  GlobalKey<State<StatefulWidget>> get keyAboutMarajoAR {
    _$keyAboutMarajoARAtom.reportRead();
    return super.keyAboutMarajoAR;
  }

  @override
  set keyAboutMarajoAR(GlobalKey<State<StatefulWidget>> value) {
    _$keyAboutMarajoARAtom.reportWrite(value, super.keyAboutMarajoAR, () {
      super.keyAboutMarajoAR = value;
    });
  }

  final _$getRecomendadosAsyncAction =
      AsyncAction('_HomeStoreBase.getRecomendados');

  @override
  Future getRecomendados(BuildContext context) {
    return _$getRecomendadosAsyncAction
        .run(() => super.getRecomendados(context));
  }

  final _$chamarTutorialAsyncAction =
      AsyncAction('_HomeStoreBase.chamarTutorial');

  @override
  Future chamarTutorial(BuildContext context) {
    return _$chamarTutorialAsyncAction.run(() => super.chamarTutorial(context));
  }

  final _$validarAsyncAction = AsyncAction('_HomeStoreBase.validar');

  @override
  Future validar() {
    return _$validarAsyncAction.run(() => super.validar());
  }

  @override
  String toString() {
    return '''
homeController: ${homeController},
valid: ${valid},
keyAboutMarajoAR: ${keyAboutMarajoAR}
    ''';
  }
}
