import 'package:flutter/material.dart';


import 'package:google_fonts/google_fonts.dart';

import '../colors.dart';

/// Nav Bar
Widget appBarWidget(String text, VoidCallback onPressed) {
  return Container(
    margin: const EdgeInsets.only(left: 8,top: 5),
    child: Row(
      children: [
        IconButton(
            onPressed: onPressed, icon: const Icon(Icons.arrow_back_ios)),
        textWidget(
          text,
          blackColor,
          18,
          FontWeight.w500,
        ),
      ],
    ),
  );
}

/// Widget Text
Widget textWidget(String text ,Color color ,double fontSize,FontWeight fontWeight) {
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
Widget sizedBoxHeightWidget(double height) {
  return SizedBox(height: height);
}

/// SizedBox untuk Width
Widget sizedBoxWidthWidget(double width) {
  return SizedBox(width: width);
}

/// Navigator Push
 pushWidget(context, WidgetBuilder page) {
  return Navigator.push(context, MaterialPageRoute(builder: page));
}

/// Navigator Off
 offWidget(BuildContext context, WidgetBuilder page) {
  return Navigator.pushReplacement(context, MaterialPageRoute(builder: page));
}
/// Button Bawah
Widget buttonBottomWidget(context, String textButton, VoidCallback onTap) {
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
    ) ));
  
}
