import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marajoar/app/modules/home/domain/dto/categoria_dto.dart';
import 'package:marajoar/app/modules/home/domain/usecases/get_categorias.dart';
import 'package:marajoar/app/modules/home/presenter/blocs/categoria_filter/categoria_filter_state.dart';

class CategoriaFilterCubit extends Cubit<CategortiaFilterState> {
  final GetCategorias categoriaService;
  CategoriaFilterCubit(this.categoriaService) : super(CategortiaFilterInitial());

  getCategoriaList(CategoriaDto categoriaDto) async {
    emit(CategortiaFilterLoading());
    var response = await categoriaService(categoriaDto);
    emit(response.fold(
      (failure) => CategortiaFilterFailure(failure), 
      (sucess) => CategortiaFilterSucess(sucess),
    ));
  }
}