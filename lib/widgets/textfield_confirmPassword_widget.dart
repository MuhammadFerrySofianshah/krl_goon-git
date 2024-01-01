import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:krl_goon/colors.dart';
import 'package:krl_goon/providers/auth_provider.dart';
import 'package:provider/provider.dart';

class TextfieldConfirmPasswordWidget extends StatefulWidget {
  const TextfieldConfirmPasswordWidget({super.key, required this.controller});
  final TextEditingController controller;

  @override
  State<TextfieldConfirmPasswordWidget> createState() =>
      _TextfieldConfirmPasswordWidgetState();
}

class _TextfieldConfirmPasswordWidgetState extends State<TextfieldConfirmPasswordWidget> {
  bool obscureText = true;
  @override
  Widget build(BuildContext context) {
    var loadAuth = Provider.of<AuthProvider>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Ulangi Password",
          style: GoogleFonts.poppins(
            color: blackColor,
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 3),
        TextFormField(
          obscureText: obscureText,
          controller: widget.controller,
          decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: yellowColor),
                borderRadius: BorderRadius.circular(10),
              ),
              hintText: "Ulangi Password Anda",
              //warna bg
              filled: true,
              suffixIcon: IconButton(onPressed: (){
                setState(() {
                  obscureText = !obscureText;
                });
              }, icon: const Icon(Icons.remove_red_eye_rounded)),
              fillColor: const Color(0xff121931).withOpacity(.08)),
          validator: (value) {
            if (value!.trim().isEmpty || value == "") {
              return 'Ulangi Password Anda.';
            } else if (value.trim().length < 8) {
            return "Password tidak cocok.";
            }
            return null;
          },
          onSaved: (value) {
            loadAuth.enteredPassword = value! ;
          },
          
        ),
      ],
    );
  }
}
