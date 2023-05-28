import 'package:flutter/material.dart';
import 'package:autotsk_app/utilities/dimension.dart';

class ResponsiveLayout extends StatelessWidget {
  final Widget webScreenLayout;
  final Widget mobileScreenLayout;

  const ResponsiveLayout({
    Key? key,
    required this.mobileScreenLayout,
    required this.webScreenLayout,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth > webScreenSize) {
        // show display a webscreen layout, else mobile screen layout.
        return webScreenLayout;
      }
      return mobileScreenLayout;
    });
  }
}
