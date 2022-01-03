import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:marajoar/app/modules/home/domain/usecases/get_categorias.dart';
import 'package:marajoar/app/modules/home/external/datasource/categoria_datasource_impl.dart';
import 'package:marajoar/app/modules/home/infra/repository/categoria_repository_impl.dart';
import 'package:marajoar/app/modules/home/presenter/blocs/categoria_filter/categoria_filter_cubit.dart';
import 'package:marajoar/app/modules/home/presenter/pages/categoria/categoria_page.dart';
import 'package:marajoar/app/shared/domain/enums/categoria_enum.dart';

class CategoriaModule extends WidgetModule {
  final CategoriasEnum categoriasEnum;
  CategoriaModule(this.categoriasEnum);

  @override
  List<Bind<Object>> get binds => [
    Bind((i) => CategoriaDatasourceImpl()),
    Bind((i) => CategoriaRepositoryImpl(i<CategoriaDatasourceImpl>())),
    Bind((i) => GetCategoriasImpl(i<CategoriaRepositoryImpl>())),
    Bind.factory((i) => CategoriaFilterCubit(i<GetCategoriasImpl>())),
  ];

  @override
  Widget get view => CategoriaPage(categoriasEnum);
  
}