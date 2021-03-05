import 'package:flutter/material.dart';

class CircularMaterialSpinner extends StatelessWidget {
  final bool loading;
  final double height;
  final double width;
  final Widget child;
  final double strokeWidth;
  final Color color;

  CircularMaterialSpinner(
      {this.color,
      this.loading = true,
      this.height = 40.0,
      this.width = 40.0,
      this.child,
      this.strokeWidth = 4.0});
  @override
  Widget build(BuildContext context) {
    if (loading) {
      return Center(
        child: SizedBox(
          height: height,
          width: width,
          child: CircularProgressIndicator(
              strokeWidth: strokeWidth,
              valueColor: (color != null)
                  ? AlwaysStoppedAnimation<Color>(color)
                  : AlwaysStoppedAnimation<Color>(
                      Theme.of(context).primaryColor)),
        ),
      );
    } else {
      return Container(
        child: child,
      );
    }
  }
}
