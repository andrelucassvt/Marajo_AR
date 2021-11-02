import 'package:arkit_plugin/arkit_plugin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:marajoar/app/modules/arview/infra/drives/ar_screenshot.dart';
import 'package:marajoar/app/shared/domain/entities/ar_model.dart';
import 'package:mobx/mobx.dart';
import 'package:vector_math/vector_math_64.dart' as vector;

class ArkitPage extends StatefulWidget {
  final ArModel model;

  ArkitPage(this.model);

  @override
  _ArkitPageState createState() => _ArkitPageState();
}

class _ArkitPageState extends State<ArkitPage> {
  ARKitController arkitController;
  ARKitReferenceNode node;
  ArScreenshot arControllerMarajo = ArScreenshot();

  @override
  void dispose() {
    arkitController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        title: Text('Marajó AR'),
        centerTitle: true,
       ),
       body:Container(
         child: ARKitSceneView(
           onARKitViewCreated: onARKitViewCreated,
           showFeaturePoints: true,
           planeDetection: ARPlaneDetection.horizontal,
         ),
       ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.camera_alt_outlined),
        onPressed: () => arControllerMarajo.arScreenshot(context) 
      ),
    );
  }

  void onARKitViewCreated(ARKitController arkitController) {
    this.arkitController = arkitController;
    this.arkitController.onAddNodeForAnchor = _handleAddAnchor;
  }

  void _handleAddAnchor(ARKitAnchor anchor) {
    if (anchor is ARKitPlaneAnchor) {
      _addPlane(arkitController, anchor);
    }
  }

  void _addPlane(ARKitController controller, ARKitPlaneAnchor anchor) {
    if (node != null) {
      controller.remove(node.name);
    }
    node = ARKitReferenceNode(
      url: widget.model.objeto,
      position: vector.Vector3(0, 0, 0),
      scale: vector.Vector3.all(0.3),
    );
    controller.add(node, parentNodeName: anchor.nodeName);
  }
}