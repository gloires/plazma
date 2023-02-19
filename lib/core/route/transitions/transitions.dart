import 'package:flutter/material.dart';
import 'package:plazma/core/route/transitions/transitions_builder.dart';
import 'package:routemaster/routemaster.dart';

class BottomToTopTransition extends PageTransition {
  const BottomToTopTransition();

  @override
  final Duration duration = const Duration(milliseconds: 300);

  @override
  final PageTransitionsBuilder transitionsBuilder =
      const BottomToTopTransitionBuilder();
}


