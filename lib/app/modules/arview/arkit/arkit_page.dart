import 'package:arkit_plugin/arkit_node.dart';
import 'package:arkit_plugin/arkit_plugin.dart';
import 'package:arkit_plugin/geometries/arkit_sphere.dart';
import 'package:arkit_plugin/widget/arkit_scene_view.dart';
import 'package:flutter/material.dart';
import 'package:marajoar/app/shared/models/ar_model.dart';
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

  @override
  void dispose() {
    arkitController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        title: Text('Arkit'),
        centerTitle: true,
       ),
       body:Container(
         child: ARKitSceneView(
           onARKitViewCreated: onARKitViewCreated,
           showFeaturePoints: true,
           planeDetection: ARPlaneDetection.horizontal,
         ),
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