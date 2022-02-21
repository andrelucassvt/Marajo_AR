import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:marajoar/app/modules/home/presenter/blocs/search/search_cubit.dart';
import 'package:marajoar/app/modules/home/presenter/blocs/search/search_state.dart';
import 'package:marajoar/app/shared/domain/entities/ar_model.dart';
import 'package:marajoar/app/shared/widgets/card_widget.dart';

class SearchPage extends StatefulWidget {

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {

  final searchCubit = GetIt.I.get<SearchCubit>();
  bool enableHero = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Container(
          decoration: BoxDecoration(
            color: Colors.grey[350],
            borderRadius: BorderRadius.circular(12)
          ),
          child: Container(
            alignment: Alignment.centerLeft,
            color: Colors.white,
            child: TextField(
              autofocus: true,
              style: TextStyle(
                color: Colors.black
              ),
              onChanged: (value) => searchCubit.search(value,context),
              decoration: const InputDecoration(
                labelText: 'Pesquisar',
                suffixIcon: Icon(Icons.search),
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                contentPadding: EdgeInsets.all(20)
              ),
            ),
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: (){
            setState(() {
              enableHero = false;
            });
            Navigator.of(context).pop();
          },
          icon: Icon(Icons.arrow_back),
          color: Colors.black,
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(10),
        child: BlocBuilder<SearchCubit, SearchState>(
          bloc: searchCubit,
          builder: (context,state){

            if (state is SearchErrorState) {
              return Center(
                child: Text(state.error.message),
              );
            }

            if (state is SearchLoading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }

            if (state is SearchNotResult) {
              return Center(
                child: Text('Sem resultados',
                  style: TextStyle(
                    fontSize: 20
                  ),
                ),
              );
            }

            if (state is SearchSucess) {

              List<ArModel> dados = state.list;

              return ListView.builder(
                itemCount: dados.length,
                itemBuilder: (context,index){
                  return HeroMode(
                    enabled: enableHero,
                    child: CardWidget(dados[index])
                  );
                },
              );
            }
            return Container();
          },
        ),
      ),
    );
  }
}