import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marajoar/app/features/home/domain/usecase/get_all_objects_usecase.dart';
import 'package:marajoar/app/shared/domain/entities/ar_model.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit({
    required this.getAllObjectsUsecase,
  }) : super(HomeInitial());
  final GetAllObjectsUsecase getAllObjectsUsecase;

  Future<void> getAllModels() async {
    emit(HomeLoading());
    final result = await getAllObjectsUsecase();
    result.fold(
      (failure) => emit(HomeFailure()),
      (sucess) => emit(HomeSucess(sucess)),
    );
  }
}
