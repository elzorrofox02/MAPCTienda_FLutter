import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class svgLoadi extends StatelessWidget {
  const svgLoadi({
    Key? key,
    required this.src,
    this.color,
  }) : super(key: key);

  final String src;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(src, height: 24, color: color);
  }
}
