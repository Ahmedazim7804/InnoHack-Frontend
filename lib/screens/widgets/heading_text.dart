import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HeadingText extends StatelessWidget {
  const HeadingText(
      {super.key,
      required this.text,
      this.size = 15,
      this.color = Colors.black});

  final String text;
  final double size;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: 125,
      // margin: const EdgeInsets.only(top: 5, left: 10, right: 10, bottom: 5),
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: const BoxDecoration(
          color: Colors.teal,
          borderRadius: BorderRadius.all(Radius.circular(4))),
      child: Text(
        text,
        style: GoogleFonts.urbanist(
            fontSize: size, fontWeight: FontWeight.bold, color: color),
      ),
    );
  }
}
