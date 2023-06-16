import 'package:flutter/material.dart';
import 'package:instant_preview_arkit_arcore/instant_preview_arkit_arcore.dart';
import 'package:marajoar/app/features/detalhes/presenter/widgets/card_image.dart';
import 'package:marajoar/app/shared/domain/entities/ar_model.dart';
import 'package:marajoar/app/shared/widgets/border_text.dart';
import 'package:marajoar/generated/l10n.dart';

class DetalhesPage extends StatefulWidget {
  final ArModel model;
  DetalhesPage(this.model);
  @override
  DetalhesPageState createState() => DetalhesPageState();
}

class DetalhesPageState extends State<DetalhesPage> {
  final quickLook = InstantPreviewArkitArcore();
  @override
  Widget build(BuildContext context) {
    LocaleProvider localeProvider = LocaleProvider.of(context);
    final Orientation deviceOrientation = MediaQuery.of(context).orientation;
    final bool isLandscape = deviceOrientation == Orientation.landscape;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    if (isLandscape)
                      Column(
                        children: [
                          Row(
                            children: [
                              IconButton(
                                alignment: Alignment.centerRight,
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                icon: Icon(
                                  Icons.arrow_back_ios,
                                ),
                              ),
                              Spacer(),
                              BorderTextMarajo(
                                child: Text(
                                  widget.model.nome,
                                  style: TextStyle(
                                    fontSize: 26,
                                    color: Colors.white,
                                    inherit: false,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              )
                            ],
                          ),
                          Center(
                            child: Hero(
                              tag: widget.model.nome,
                              child: CircleAvatar(
                                maxRadius: 110,
                                backgroundImage: AssetImage(widget.model.foto),
                              ),
                            ),
                          ),
                        ],
                      ),
                    if (!isLandscape)
                      Hero(
                        tag: widget.model.nome,
                        child: Container(
                          height: MediaQuery.of(context).size.height * .40,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(32),
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage(widget.model.foto),
                            ),
                          ),
                        ),
                      ),
                    if (!isLandscape)
                      Positioned(
                        left: 15,
                        top: 15,
                        child: IconButton(
                          alignment: Alignment.centerRight,
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          color: Colors.white,
                          icon: Icon(
                            Icons.arrow_back_ios,
                          ),
                        ),
                      ),
                    if (!isLandscape)
                      Positioned(
                        right: 30,
                        top: 15,
                        child: BorderTextMarajo(
                          child: Text(
                            localeProvider.HomePagesDatalhesAppBarTitle,
                            style: TextStyle(
                              fontSize: 30,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    if (!isLandscape)
                      Positioned(
                        bottom: 10,
                        left: 20,
                        child: BorderTextMarajo(
                          child: Text(
                            widget.model.nome,
                            style: TextStyle(
                              fontSize: 32,
                              color: Colors.white,
                              inherit: false,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    Text(
                      localeProvider.HomePagesDatalhesBodyDescricao,
                      style: TextStyle(
                        fontSize: 30,
                      ),
                    ),
                    Spacer(),
                    if (isLandscape)
                      Padding(
                        padding: const EdgeInsets.only(
                          right: 10,
                        ),
                        child: ElevatedButton(
                          onPressed: () {
                            quickLook.showPreviewAr(
                              reference: widget.model.objeto,
                            );
                          },
                          style: ButtonStyle(
                            elevation: MaterialStateProperty.all<double>(20),
                            shape: MaterialStateProperty.all<OutlinedBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(32),
                              ),
                            ),
                          ),
                          child: Text(
                            localeProvider.HomePagesDatalhesFloatingButton,
                          ),
                        ),
                      ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  widget.model.descricao,
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  height: 200,
                  child: ListView.builder(
                    shrinkWrap: true,
                    padding: EdgeInsets.only(bottom: 10),
                    scrollDirection: Axis.horizontal,
                    itemCount: widget.model.listaImagens.length,
                    itemBuilder: (ctx, index) {
                      return CardImage(
                        widget.model.listaImagens[index],
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButtonLocation:
          isLandscape ? null : FloatingActionButtonLocation.centerFloat,
      floatingActionButton: isLandscape
          ? null
          : FloatingActionButton.extended(
              label: Text(localeProvider.HomePagesDatalhesFloatingButton),
              onPressed: () async {
                quickLook.showPreviewAr(reference: widget.model.objeto);
              },
            ),
    );
  }
}
