import 'package:arcore_flutter_plugin/arcore_flutter_plugin.dart';
import 'package:flutter/material.dart';
import 'package:marajoar/app/modules/arview/controller/ar_controller.dart';
import 'package:marajoar/app/shared/models/ar_model.dart';
import 'package:marajoar/app/shared/widgets/show_dialog_widget.dart';
import 'package:marajoar/generated/l10n.dart';

class ArcorePage extends StatefulWidget {
  final ArModel model;
  const ArcorePage(this.model);

  @override
  ArcorePageState createState() => ArcorePageState();
}
class ArcorePageState extends State<ArcorePage> {
  ArCoreController arCoreController;
  ArController arControllerMarajo = ArController();

  @override
  void initState() {
    super.initState();
    Future.delayed((Duration.zero),(){
      _showMessage(context);
    });
  }
  @override
  void dispose() {
    arCoreController.dispose();
    super.dispose();
  }

  _showMessage(BuildContext context){
    LocaleProvider localeProvider = LocaleProvider.of(context);
    showDialog(
      context: context, 
      builder: (_) => ShowDialogWidget(
        title: localeProvider.DialogTitle,
        content: localeProvider.ArCoreWidgetsDialogTextContent,
      )
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Marajó AR'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () => _showMessage,
            icon: Icon(Icons.info)
          )
        ],
      ),
      body: ArCoreView(
        onArCoreViewCreated: _onArCoreViewCreated,
        enableTapRecognizer: true,
        debug: false,        
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.camera_alt_outlined),
        onPressed: (){
          arControllerMarajo.arScreenshot(context);
        },
      ),
    );
  }

  void _onArCoreViewCreated(ArCoreController controller) {
    arCoreController = controller;
    arCoreController.onPlaneTap = _handleOnPlaneTap;
  }

  void _addToucano(ArCoreHitTestResult plane) {
      final toucanoNode = ArCoreReferenceNode(
          name: widget.model.objeto,
          object3DFileName: widget.model.objeto,
          position: plane.pose.translation,
          rotation: plane.pose.rotation);

      arCoreController.addArCoreNodeWithAnchor(toucanoNode);
  }

  void _handleOnPlaneTap(List<ArCoreHitTestResult> hits) {
    final hit = hits.first;
    _addToucano(hit);
  }
}