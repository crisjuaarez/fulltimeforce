import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CenterText extends StatelessWidget {
  const CenterText(this.data, {super.key, this.style});
  final String data;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return Center(child: Text(data, style: style ?? GoogleFonts.cabin()));
  }
}
