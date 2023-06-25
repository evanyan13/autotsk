import 'dart:ui';
import 'package:flutter/material.dart';

class HeroDialogRoute<T> extends PageRoute<T> {
  /// {@macro hero_dialog_route}
  HeroDialogRoute({
    required WidgetBuilder builder,
    RouteSettings? settings,
    bool fullscreenDialog = false,
  })  : _builder = builder,
        super(settings: settings, fullscreenDialog: fullscreenDialog);

  final WidgetBuilder _builder;

  // creates the translucent overlay
  @override
  bool get opaque => false;

  // tap anywhere outside of the frame to exit the page
  @override
  bool get barrierDismissible => true;

  // self explanatory
  @override
  Duration get transitionDuration => const Duration(milliseconds: 200);

  @override
  bool get maintainState => true;

  @override
  Color get barrierColor => Colors.black54;

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    return child;
  }

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    return _builder(context);
  }

  @override
  String get barrierLabel => 'Popup Sign in open';
}
