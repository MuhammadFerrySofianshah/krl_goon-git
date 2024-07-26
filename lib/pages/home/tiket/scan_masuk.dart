import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:krl_goon/colors.dart';
import 'package:krl_goon/pages/home/tiket/success_page.dart';
import 'package:krl_goon/widgets/widget.dart';

class ScanMasuk extends StatefulWidget {
  const ScanMasuk({super.key});

  @override
  State<ScanMasuk> createState() => _ScanMasukState();
}

class _ScanMasukState extends State<ScanMasuk> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
          child: Center(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              wText('SCAN MASUK', redColor, 22, FontWeight.bold),
              wSizedBoxHeight(15),
              wText('Stasiun Bekasi', blackColor, 16, FontWeight.normal),
              wSizedBoxHeight(30),
              GestureDetector(
                onTap: () => Get.off(const SuccessPage()),
                child: Image.asset('assets/images/qr_code.png')),
              wSizedBoxHeight(50),
              _richText(),
              wSizedBoxHeight(40),
              _buttonKembali()
            ],
          ),
        ),
      )),
    );
  }

  InkWell _buttonKembali() {
    return InkWell(
              onTap: () => Get.back(),
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 60),
                decoration: BoxDecoration(
                    border: Border.all(color: blackColor),
                    borderRadius: BorderRadius.circular(8)),
                child: wText('Kembali', blackColor, 16, FontWeight.normal),
              ),
            );
  }

  RichText _richText() {
    return RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                  text: 'Perlihatkan ',
                  style: GoogleFonts.poppins(
                    color: redColor,
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                  ),
                  children: [
                    TextSpan(
                      text: 'QR CODE ',
                      style: GoogleFonts.poppins(
                        color: redColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    TextSpan(
                      text: 'pada\nmesin scan',
                      style: GoogleFonts.poppins(
                        color: redColor,
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ]),
            );
  }
}
