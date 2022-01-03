import 'package:marajoar/app/modules/home/domain/error/categoria_error.dart';
import 'package:marajoar/app/shared/domain/entities/ar_model.dart';

abstract class CategortiaFilterState {}

class CategortiaFilterInitial extends CategortiaFilterState {}

class CategortiaFilterLoading extends CategortiaFilterState {}

class CategortiaFilterFailure extends CategortiaFilterState  {
  final CategoriaError error;
  CategortiaFilterFailure(this.error);
}

class CategortiaFilterSucess extends CategortiaFilterState  {
  final List<ArModel> list;
  CategortiaFilterSucess(this.list);
}