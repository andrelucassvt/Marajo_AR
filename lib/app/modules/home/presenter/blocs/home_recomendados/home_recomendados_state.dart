import 'package:marajoar/app/modules/home/domain/error/home_recomendados_error.dart';
import 'package:marajoar/app/shared/domain/entities/ar_model.dart';

abstract class HomeRecomendadosState {}

class HomeRecomendadosInitial extends HomeRecomendadosState {}

class HomeRecomendadosLoading extends HomeRecomendadosState {}

class HomeRecomendadosFailure extends HomeRecomendadosState {
  final HomeRecomendadosError error;
  HomeRecomendadosFailure(this.error);
}

class HomeRecomendadosSucess extends HomeRecomendadosState {
  final List<ArModel> list;
  HomeRecomendadosSucess(this.list);
}