import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:marajoar/app/modules/home/presenter/pages/detalhes/detalhes_page.dart';
import 'package:marajoar/app/shared/domain/entities/ar_model.dart';
import 'package:marajoar/app/shared/widgets/border_text.dart';

class CardWidget extends StatelessWidget {
  final ArModel model;
  CardWidget(this.model);
  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: model.nome,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: (){
            Navigator.of(context).push(
              MaterialPageRoute(builder: (_) => DetalhesPage(model))
            );
          },
          child: Padding(
            padding: const EdgeInsets.only(
              bottom: 10,
              top: 10
            ),
            child: Container(
              padding: EdgeInsets.all(12),
              constraints: BoxConstraints(
                minHeight: 240
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(model.foto)
                )
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  

                  //Texto duplicado para criar uma borda no texto

                  BorderTextMarajo(
                    child: Text(
                      model.nome,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: BorderTextMarajo(
                          child: Text(
                            model.descricao,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: Colors.white
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 100
                        ),
                        child: Container(
                          padding: EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20)
                          ),
                          child: Icon(
                            Icons.arrow_forward,
                            color: Colors.black,
                          ),
                        ),
                      )
                    ],
                  )
                ],
              )
            ),
          ),
        ),
      ),
    );
  }
}