import 'package:flutter_modular/flutter_modular.dart';
import 'package:marajoar/app/modules/home/domain/usecases/get_recomendados.dart';
import 'package:marajoar/app/modules/home/domain/usecases/seach_data.dart';
import 'package:marajoar/app/modules/home/external/datasource/home_recomendados_datasource_impl.dart';
import 'package:marajoar/app/modules/home/infra/repository/home_repository_impl.dart';
import 'package:marajoar/app/modules/home/presenter/blocs/home_recomendados/home_recomendados_cubit.dart';
import 'package:marajoar/app/modules/home/presenter/blocs/home_tutorial/home_tutorial_cubit.dart';
import 'package:marajoar/app/modules/home/presenter/blocs/search/search_cubit.dart';
import 'package:marajoar/app/modules/home/presenter/pages/home/home_page.dart';
import 'package:marajoar/app/modules/home/presenter/pages/seach/seach_page.dart';
import 'package:marajoar/app/modules/home/presenter/pages/sobre/sobre_page.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [
    Bind((i) => HomeRecomendadosDatasourceImpl()),
    Bind((i) => HomeRepositoryImpl(i<HomeRecomendadosDatasourceImpl>())),
    Bind((i) => GetRecomendadosImpl(i<HomeRepositoryImpl>())),
    Bind((i) => SearchDataImpl(i<HomeRepositoryImpl>())),
    Bind.factory((i) => SearchCubit(i<SearchDataImpl>())),
    Bind.factory((i) => HomeRecomendadosCubit(i<GetRecomendadosImpl>())),
    Bind.singleton((i) => HomeTutorialCubit())
  ];

  @override
  List<ModularRoute> get routes => [
    ChildRoute('/', child: (context, args) => HomePage()),
    ChildRoute('/sobre', child: (context, args) => SobrePage()),
    ChildRoute('/search', child: (context, args) => SearchPage())
  ];
}