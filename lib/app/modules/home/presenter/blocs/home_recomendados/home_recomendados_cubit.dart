import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marajoar/app/modules/home/domain/usecases/get_recomendados.dart';
import 'package:marajoar/app/modules/home/presenter/blocs/home_recomendados/home_recomendados_state.dart';

class HomeRecomendadosCubit extends Cubit<HomeRecomendadosState>{

  final GetRecomendados homeService;
  HomeRecomendadosCubit(this.homeService) : super(HomeRecomendadosInitial());
  
  void getRecomendados(BuildContext context) async {
    emit(HomeRecomendadosLoading());
    var response = await homeService(context);
    emit(response.fold(
      (failure) => HomeRecomendadosFailure(failure), 
      (sucess) => HomeRecomendadosSucess(sucess)
    ));
  }
}