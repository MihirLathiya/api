import 'package:flutter/material.dart';

class Ts extends StatelessWidget {
  final String text;
  final double? size;
  final Color? color;
  final FontWeight? weight;
  final double? height;
  final String? family;
  final double? latterSpace;
  final double? wordSpace;
  Ts({
    Key? key,
    required this.text,
    this.size,
    this.color,
    this.weight,
    this.height,
    this.family,
    this.latterSpace,
    this.wordSpace,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        letterSpacing: latterSpace,
        wordSpacing: wordSpace,
        fontSize: size,
        fontWeight: weight,
        color: color,
        height: height,
        fontFamily: family,
      ),
    );
  }
}
