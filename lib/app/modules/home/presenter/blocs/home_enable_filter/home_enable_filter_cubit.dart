import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'home_enable_filter_state.dart';

class HomeEnableFilterCubit extends Cubit<HomeEnableFilterState> {
  HomeEnableFilterCubit() : super(HomeEnableFilterFalse());

  Future<void> enableFilter() async {
    if (state is HomeEnableFilterTrue) {
      emit(HomeEnableFilterFalse());
    } else if (state is HomeEnableFilterFalse) {
      emit(HomeEnableFilterTrue());
    }
  }
}
