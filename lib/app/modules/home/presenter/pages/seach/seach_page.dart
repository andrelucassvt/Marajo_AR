import 'package:flutter/material.dart';
import 'package:marajoar/app/modules/home/presenter/pages/seach/seach_controller.dart';
import 'package:marajoar/app/shared/domain/entities/ar_model.dart';
import 'package:marajoar/app/shared/widgets/card_widget.dart';

class SeachPage extends StatefulWidget {

  @override
  _SeachPageState createState() => _SeachPageState();
}

class _SeachPageState extends State<SeachPage> {
  SeachController _controller = SeachController();

  List<ArModel> _allArModel = [];
  List<ArModel> _filtroArModel = [];

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero,(){
      getDados();
    });
  }

  getDados() async {
    _allArModel = await _controller.getDados(context);
  }
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
              onChanged: (value) => onSearchTextChanged(value),
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
            Navigator.of(context).pop();
          },
          icon: Icon(Icons.arrow_back),
          color: Colors.black,
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: _filtroArModel.isNotEmpty
                ? ListView.builder(
                    itemCount: _filtroArModel.length,
                    itemBuilder: (context, index) {
                      return CardWidget(_filtroArModel[index]);
                    }
                  )
                : const Center(
                  child: Text(
                      'Sem resultados',
                      style: TextStyle(fontSize: 24),
                    ),
                ),
            ),
          ],
        ),
      ),
    );
  }
  onSearchTextChanged(String text) async {
    List<ArModel> results = [];
    if (text.isEmpty) {
      results = _allArModel;
    } else {
      results = _allArModel.where((data) =>
        data.nome.toLowerCase().contains(text.toLowerCase())).toList();
    }
    setState(() {
      _filtroArModel = results;
    });
  }
}