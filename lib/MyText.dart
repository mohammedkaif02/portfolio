import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mr_portfolio/themeColor.dart';

class MyText extends StatelessWidget {
  final String text;
  final Color? textColor;
  final double? fontSize;
  final FontWeight? fontWeight;
  final TextAlign? textAlign;
  final int? maxLines;
  final TextOverflow? overFlow;
  const MyText(
      {super.key,
      required this.text,
      this.textColor,
      this.fontSize,
      this.fontWeight,
      this.textAlign,
      this.maxLines,
      this.overFlow});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overFlow,
      style: GoogleFonts.poppins(
        textStyle: TextStyle(
          color: textColor ?? primaryColor,
          fontSize: fontSize ?? 18,
          fontWeight:
              fontWeight ?? FontWeight.normal, // Specify a valid font weight
        ),
      ),
    );
  }
}
