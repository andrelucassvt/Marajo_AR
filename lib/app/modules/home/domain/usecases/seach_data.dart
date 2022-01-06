import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:marajoar/app/modules/home/domain/error/search_error.dart';
import 'package:marajoar/app/modules/home/domain/repository/home_repository.dart';
import 'package:marajoar/app/shared/domain/entities/ar_model.dart';

abstract class SearchData {
  Future<Either<SearchError,List<ArModel>>> call(String busca,BuildContext context);
}


class SearchDataImpl implements SearchData{

  final HomeRepository repository;
  SearchDataImpl(this.repository);

  @override
  Future<Either<SearchError, List<ArModel>>> call(String busca,BuildContext context) async {
    if (busca == null) {
      left(SearchError('Digite alguma coisa'));
    }
    return await repository.search(busca,context);
  }
  
}