import 'package:get_it/get_it.dart';
import 'package:marajoar/app/modules/home/domain/repository/categoria_repository.dart';
import 'package:marajoar/app/modules/home/domain/repository/home_repository.dart';
import 'package:marajoar/app/modules/home/domain/usecases/get_categorias.dart';
import 'package:marajoar/app/modules/home/domain/usecases/get_recomendados.dart';
import 'package:marajoar/app/modules/home/domain/usecases/seach_data.dart';
import 'package:marajoar/app/modules/home/external/datasource/categoria_datasource_impl.dart';
import 'package:marajoar/app/modules/home/external/datasource/home_recomendados_datasource_impl.dart';
import 'package:marajoar/app/modules/home/infra/datasource/categoria_datasource.dart';
import 'package:marajoar/app/modules/home/infra/datasource/home_recomendados_datasource.dart';
import 'package:marajoar/app/modules/home/infra/repository/categoria_repository_impl.dart';
import 'package:marajoar/app/modules/home/infra/repository/home_repository_impl.dart';
import 'package:marajoar/app/modules/home/presenter/blocs/categoria_filter/categoria_filter_cubit.dart';
import 'package:marajoar/app/modules/home/presenter/blocs/home_enable_filter/home_enable_filter_cubit.dart';
import 'package:marajoar/app/modules/home/presenter/blocs/home_recomendados/home_recomendados_cubit.dart';
import 'package:marajoar/app/modules/home/presenter/blocs/search/search_cubit.dart';

class InjectDependencies {
  
  static void init(){
    final getIt = GetIt.instance;
    
    //Datasource 
    getIt.registerFactory<HomeRecomendadosDatasource>(
      () => HomeRecomendadosDatasourceImpl());
    getIt.registerFactory<CategoriaDatasource>(
      () => CategoriaDatasourceImpl());
    
    //Repository
    getIt.registerFactory<HomeRepository>(
      () => HomeRepositoryImpl(getIt()));
    getIt.registerFactory<CategoriaRepository>(
      () => CategoriaRepositoryImpl(getIt()));

    //Usecases
    getIt.registerFactory<GetRecomendados>(
      () => GetRecomendadosImpl(getIt()));
    getIt.registerFactory<SearchData>(
      () => SearchDataImpl(getIt()));
    getIt.registerFactory<GetCategorias>(
      () => GetCategoriasImpl(getIt()));

    //Controllers
    getIt.registerFactory<HomeEnableFilterCubit>(
      () => HomeEnableFilterCubit());
    getIt.registerFactory<SearchCubit>(
      () => SearchCubit(getIt()));
    getIt.registerFactory<CategoriaFilterCubit>(
      () => CategoriaFilterCubit(getIt()));
    getIt.registerSingleton<HomeRecomendadosCubit>(
      HomeRecomendadosCubit(getIt())
    );

  }

}