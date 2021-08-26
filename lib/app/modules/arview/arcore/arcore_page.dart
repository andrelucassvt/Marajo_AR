import 'package:arcore_flutter_plugin/arcore_flutter_plugin.dart';
import 'package:flutter/material.dart';
import 'package:marajoar/app/modules/arview/widgets/dialog_widget.dart';
import 'package:marajoar/app/shared/models/ar_model.dart';

class ArcorePage extends StatefulWidget {
  final ArModel model;
  const ArcorePage(this.model);

  @override
  ArcorePageState createState() => ArcorePageState();
}
class ArcorePageState extends State<ArcorePage> {
  late ArCoreController arCoreController;

  @override
  void initState() {
    super.initState();
    Future.delayed((Duration.zero),(){
      _showMessage();
    });
  }
  @override
  void dispose() {
    arCoreController.dispose();
    super.dispose();
  }

  _showMessage(){
    showDialog(
      context: context, 
      builder: (_) => ShowMessageArview()
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Arcore'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: _showMessage,
            icon: Icon(Icons.info)
          )
        ],
      ),
      body: ArCoreView(
        onArCoreViewCreated: _onArCoreViewCreated,
        enableTapRecognizer: true,
        debug: false,        
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