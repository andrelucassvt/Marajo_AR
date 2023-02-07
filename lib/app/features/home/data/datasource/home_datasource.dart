import 'package:marajoar/app/shared/data/data.dart';
import 'package:marajoar/app/shared/domain/entities/ar_model.dart';

class HomeDatasource {
  Future<List<ArModel>> getAll() async {
    return DataArModel().getDataListArModel();
  }
}
