import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:marajoar/app/modules/home/domain/usecases/get_categorias.dart';
import 'package:marajoar/app/modules/home/external/datasource/categoria_datasource_impl.dart';
import 'package:marajoar/app/modules/home/infra/repository/categoria_repository_impl.dart';
import 'package:marajoar/app/modules/home/presenter/pages/categoria/categoria_controller.dart';
import 'package:marajoar/app/modules/home/presenter/pages/categoria/categoria_page.dart';
import 'package:marajoar/app/shared/domain/enums/categoria_enum.dart';

class CategoriaModule extends WidgetModule {
  final CategoriasEnum categoriasEnum;
  CategoriaModule(this.categoriasEnum);

  @override
  List<Bind<Object>> get binds => [
    Bind.factory((i) => CategoriaDatasourceImpl()),
    Bind.factory((i) => CategoriaRepositoryImpl(i<CategoriaDatasourceImpl>())),
    Bind.factory((i) => GetCategoriasImpl(i<CategoriaRepositoryImpl>())),
    Bind.factory((i) => CategoriaController(i()))
  ];

  @override
  Widget get view => CategoriaPage(categoriasEnum);
  
}