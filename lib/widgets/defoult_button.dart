import 'package:flutter/material.dart';

class DefaultButton extends StatelessWidget {
  Widget buttonWidget;
  Function() function;
  double width;
  double height;
  Color backgroundColor;
  bool isUpperCase;
  double radius;
  DefaultButton({
    super.key,
    required this.buttonWidget,
    required this.function,
    this.width = double.infinity,
    this.backgroundColor = Colors.blue,
    this.isUpperCase = true,
    this.radius = 0.0,
    this.height = 50.0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      clipBehavior: Clip.antiAlias,
      decoration: ShapeDecoration(
        color: backgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius),
        ),
      ),
      // decoration: BoxDecoration(
      //   borderRadius: BorderRadius.circular(radius),
      //   color: backgroundColor,
      // ),
      child: MaterialButton(
        onPressed: function,
        child: buttonWidget,
      ),
    );
  }
}
