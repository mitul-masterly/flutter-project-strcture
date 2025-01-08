import 'package:flutter/material.dart';
import 'package:flutter_project_structure/Utils/app_assets.dart';

class LabelWidget extends StatelessWidget {
  final String title;
  final double size;
  final FontWeight weight;
  final Color color;
  final TextAlign? align;
  final int? maxLine;
  final TextOverflow? overflow;

  const LabelWidget({
    super.key,
    required this.title,
    this.size = 16,
    this.weight = FontWeight.w400,
    this.color = Colors.black,
    this.align,
    this.overflow,
    this.maxLine,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      textAlign: align,
      overflow: overflow,
      maxLines: maxLine,
      style: TextStyle(
          fontSize: size,
          color: color,
          fontFamily: AppFonts.rubikRegular,
          fontWeight: weight,
          fontFamilyFallback: [AppFonts.rubikRegular],
          overflow: TextOverflow.clip),
    );
  }
}
