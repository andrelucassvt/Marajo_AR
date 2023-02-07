import 'package:get_it/get_it.dart';
import 'package:marajoar/app/features/home/data/datasource/home_datasource.dart';
import 'package:marajoar/app/features/home/data/repository/home_repository.dart';
import 'package:marajoar/app/features/home/domain/repository/ihome_repository.dart';
import 'package:marajoar/app/features/home/domain/usecase/get_all_objects_usecase.dart';
import 'package:marajoar/app/features/home/presenter/cubit/home_cubit.dart';

class InjectDependencies {
  static void init() {
    final getIt = GetIt.instance;

    //Datasource
    getIt.registerFactory<HomeDatasource>(() => HomeDatasource());

    //Repository
    getIt.registerFactory<IHomeRepository>(
        () => HomeRepository(datasource: getIt()));

    //Usecases
    getIt.registerFactory<GetAllObjectsUsecase>(
        () => GetAllObjectsUsecase(repository: getIt()));

    //Controllers
    getIt
        .registerSingleton<HomeCubit>(HomeCubit(getAllObjectsUsecase: getIt()));
  }
}
