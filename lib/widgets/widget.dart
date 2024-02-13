import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../colors.dart';

/// Widget Text
Widget wText(String text ,Color color ,double fontSize,FontWeight fontWeight) {
  return Text(
          text,
          style: GoogleFonts.poppins(
            color: color,
            fontSize: fontSize,
            fontWeight: fontWeight,
          ),
        );
}

/// SizedBox untuk Height
Widget wSizedBoxHeight(double height) {
  return SizedBox(height: height);
}

/// SizedBox untuk Width
Widget wSizedBoxWidth(double width) {
  return SizedBox(width: width);
}


/// Button Bawah
Widget wButtonBottom(context, String textButton, VoidCallback onTap) {
  return InkWell(
    onTap: onTap,
    child: Container(
      width: MediaQuery.of(context).size.width,
      height: 55,
      decoration: BoxDecoration(
          color: const Color(0xffFFC500),
          boxShadow: const [
            BoxShadow(
                color: Color(0xffc8c8c8), blurRadius: 10, offset: Offset(4, 6)),
          ],
          border: Border.all(color: Colors.black.withOpacity(0.13))),
      child: Center(
        child: Text(
          textButton,
          style: GoogleFonts.poppins(
            color: whiteColor,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    ),
  );
}

