import 'package:flutter_modular/flutter_modular.dart';
import 'package:marajoar/app/modules/home/domain/usecases/get_recomendados.dart';
import 'package:marajoar/app/modules/home/external/datasource/home_recomendados_datasource_impl.dart';
import 'package:marajoar/app/modules/home/infra/repository/home_repository_impl.dart';
import 'package:marajoar/app/modules/home/presenter/pages/home/home_controller.dart';
import 'package:marajoar/app/modules/home/presenter/pages/home/home_page.dart';
import 'package:marajoar/app/modules/home/presenter/pages/seach/seach_page.dart';
import 'package:marajoar/app/modules/home/presenter/pages/sobre/sobre_page.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [
    Bind.factory((i) => HomeRecomendadosDatasourceImpl()),
    Bind.factory((i) => HomeRepositoryImpl(i<HomeRecomendadosDatasourceImpl>())),
    Bind.factory((i) => GetRecomendadosImpl(i<HomeRepositoryImpl>())),
    Bind.singleton((i) => HomeController(i()))
  ];

  @override
  List<ModularRoute> get routes => [
    ChildRoute('/', child: (context, args) => HomePage()),
    ChildRoute('/sobre', child: (context, args) => SobrePage()),
    ChildRoute('/seach', child: (context, args) => SeachPage())
  ];
}