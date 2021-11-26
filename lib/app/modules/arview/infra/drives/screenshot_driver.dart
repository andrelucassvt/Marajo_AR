import 'package:flutter/material.dart';

abstract class ScreenshotDriver {
  Future<void> screenshot(BuildContext context) async {}
}