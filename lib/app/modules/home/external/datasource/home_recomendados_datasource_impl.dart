import 'package:flutter/src/widgets/framework.dart';
import 'package:marajoar/app/modules/home/infra/datasource/home_recomendados_datasource.dart';
import 'package:marajoar/app/shared/data/data.dart';
import 'package:marajoar/app/shared/domain/entities/ar_model.dart';

class HomeRecomendadosDatasourceImpl implements HomeRecomendadosDatasource{
  
  @override
  Future<List<ArModel>> getRecomendados(BuildContext context) async {
    return DataArModel.getDataListArModel(context).where((element) => element.isfavorito).toList();
  }
  
}