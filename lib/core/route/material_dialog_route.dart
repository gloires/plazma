import 'package:flutter/material.dart';

class MaterialDialog extends Page<void> {
  final Widget child;

  const MaterialDialog({
    required this.child,
  });

  @override
  Route<void> createRoute(BuildContext context) {
    return DialogRoute(
      context: context,
      builder: (c) => child,
      settings: this,
    );
  }
}