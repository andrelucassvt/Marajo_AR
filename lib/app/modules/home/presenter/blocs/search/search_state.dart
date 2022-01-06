import 'package:marajoar/app/modules/home/domain/error/search_error.dart';
import 'package:marajoar/app/shared/domain/entities/ar_model.dart';

abstract class SearchState {}

class SearchInitial implements SearchState {}

class SearchLoading implements SearchState {}

class SearchSucess implements SearchState {
  final List<ArModel> list;
  SearchSucess(this.list);
}

class SearchErrorState implements SearchState {
  final SearchError error;
  SearchErrorState(this.error);
}

class SearchNotResult implements SearchState {}