import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String? text;
  final double? size;
  final Color? color;
  final FontWeight? weight;

  CustomText({this.text, this.size, this.color, this.weight});

  @override
  Widget build(BuildContext context) {
    return Text(
      text!,
      textAlign: TextAlign.center,
      overflow: TextOverflow.clip,
      maxLines: 2,
      style: TextStyle(
          fontSize: size ?? 16,
          color: color ?? Colors.black,
          fontWeight: weight ?? FontWeight.normal),
    );
  }
}
