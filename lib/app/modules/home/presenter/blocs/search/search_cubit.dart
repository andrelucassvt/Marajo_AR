import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marajoar/app/modules/home/domain/usecases/seach_data.dart';
import 'package:marajoar/app/modules/home/presenter/blocs/search/search_state.dart';

class SearchCubit extends Cubit<SearchState> {

  final SearchData searchData;
  SearchCubit(this.searchData) : super(SearchInitial());

  Future<void> search(String busca,BuildContext context) async {
    emit(SearchLoading());
    var result = await searchData(busca,context);
    if(busca.isEmpty){
      emit(SearchNotResult());
      return;
    }
    emit(result.fold(
      (failure) => SearchErrorState(failure), 
      (sucess) {
        if (sucess.isEmpty) {
          return SearchNotResult();
        }
        return SearchSucess(sucess);
      }
    ));
  }
}