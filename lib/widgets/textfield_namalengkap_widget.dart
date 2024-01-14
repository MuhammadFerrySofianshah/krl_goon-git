import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:krl_goon/colors.dart';
import 'package:krl_goon/providers/auth_provider.dart';
import 'package:provider/provider.dart';

class TexttFieldNamaLengkapWidget extends StatefulWidget {
  const TexttFieldNamaLengkapWidget({super.key, required this.controller});
  final TextEditingController controller;

  @override
  State<TexttFieldNamaLengkapWidget> createState() =>
      _TexttFieldNamaLengkapWidgetState();
}

class _TexttFieldNamaLengkapWidgetState
    extends State<TexttFieldNamaLengkapWidget> {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Nama Lengkap",
          style: GoogleFonts.poppins(
            color: blackColor,
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 3),
        TextFormField(
            controller: widget.controller,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: yellowColor),
                  borderRadius: BorderRadius.circular(10),
                ),
                hintText: "Masukan Nama Lengkap Anda",
                filled: true,
                fillColor: const Color(0xff121931).withOpacity(.08)),
            validator: (value) {
              if (value!.isEmpty || value == "") {
                return 'Masukan Nama Anda.';
              } 
              return null;
            },
            ),
      ],
    ));
  }
}
