import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:krl_goon/colors.dart';
import 'package:krl_goon/providers/auth_provider.dart';
import 'package:provider/provider.dart';

class TextfieldPasswordWidget extends StatefulWidget {
  const TextfieldPasswordWidget({super.key, required this.controller});
  final TextEditingController controller;

  @override
  State<TextfieldPasswordWidget> createState() =>
      _TextfieldPasswordWidgetState();
}

class _TextfieldPasswordWidgetState extends State<TextfieldPasswordWidget> {
  bool obscureText = true;
  @override
  Widget build(BuildContext context) {
    var loadAuth = Provider.of<AuthProvider>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Password",
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
              hintText: "Masukan Password Anda",
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
              return 'Masukan Password Anda terlebih dahulu';
            } else if (value.trim().length < 8) {
            return "Password minimal 8 karakter.";
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
