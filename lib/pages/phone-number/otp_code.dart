import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:krl_goon/pages/daftar_page.dart';
import 'package:pinput/pinput.dart';

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Align(
              child: GestureDetector(
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const DaftarPage())),
                child: const Icon(Icons.arrow_back),
              ),
            ),
            Text('Verifikasi OTP',
                style: GoogleFonts.poppins(
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                )),
            Pinput(),
          ],
        ),
      ),
    );
  }
}
