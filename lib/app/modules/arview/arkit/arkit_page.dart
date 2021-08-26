import 'package:arkit_plugin/arkit_node.dart';
import 'package:arkit_plugin/geometries/arkit_sphere.dart';
import 'package:arkit_plugin/widget/arkit_scene_view.dart';
import 'package:flutter/material.dart';
import 'package:vector_math/vector_math_64.dart';

class ArkitPage extends StatefulWidget {

  @override
  _ArkitPageState createState() => _ArkitPageState();
}

class _ArkitPageState extends State<ArkitPage> {
  late ARKitController _arKitController;

  @override
  void dispose() {
    _arKitController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        title: Text('Arkit'),
        centerTitle: true,
       ),
       body: ARKitSceneView(onARKitViewCreated: onARKitViewCreated),
    );
  }

  void onARKitViewCreated(ARKitController arkitController) {
    this._arKitController = arkitController;
    final node = ARKitNode(
      geometry: ARKitSphere(radius: 0.1), 
      position: Vector3(0, 0, -0.5)
    );
    this._arKitController.add(node);
  }
}