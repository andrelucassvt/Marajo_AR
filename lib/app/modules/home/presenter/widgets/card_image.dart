import 'package:flutter/material.dart';
import 'package:marajoar/app/modules/home/presenter/widgets/image_page.dart';
class CardImage extends StatelessWidget {
  final String foto;
  CardImage(this.foto);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.of(context).push(
          MaterialPageRoute(builder: (_)=>ImagePage(foto))
        );
      },
      child: Container(
        margin: EdgeInsets.only(right: 15),
        child: Image.asset(foto),
      ),
    );
  }
}