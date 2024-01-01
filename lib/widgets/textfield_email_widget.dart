import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:krl_goon/colors.dart';
import 'package:krl_goon/providers/auth_provider.dart';
import 'package:provider/provider.dart';

class TextfieldEmailWidget extends StatefulWidget {
  const TextfieldEmailWidget({super.key, required this.controller});
  final TextEditingController controller;
  @override
  State<TextfieldEmailWidget> createState() => _TextfieldEmailWidgetState();
}

class _TextfieldEmailWidgetState extends State<TextfieldEmailWidget> {
  @override
  Widget build(BuildContext context) {
    var loadAuth = Provider.of<AuthProvider>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Email",
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
              hintText: "Masukan Email Anda",
              //warna bg
              filled: true,
              fillColor: const Color(0xff121931).withOpacity(.08)),
          validator: (value) {
            if (value!.isEmpty || value == "") {
              return 'Masukan Email Anda.';
            } else if (!value.trim().contains("@")) {
            return "Email tidak sesuai.";
            }
            return null;
          },
          onSaved: (value) {
          loadAuth.enteredEmail = value! ;
          }
        ),
      ],
    );
  }
}
