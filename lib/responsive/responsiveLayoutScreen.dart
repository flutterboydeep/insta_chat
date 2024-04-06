import 'package:flutter/material.dart';
import 'package:insta/utils/dimensions.dart';

class ResponsiveLayout extends StatelessWidget {
  final Widget webScreenlayout;
  final Widget mobileScreenlayout;

  const ResponsiveLayout(
      {super.key,
      required this.webScreenlayout,
      required this.mobileScreenlayout});
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, dimension) {
      if (dimension.maxWidth > webScreenSize) {
        return webScreenlayout;
      } else {
        return mobileScreenlayout;
      }
    });
  }
}
