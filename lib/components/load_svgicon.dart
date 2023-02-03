import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SvgLoad extends StatelessWidget {
  const SvgLoad({
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
