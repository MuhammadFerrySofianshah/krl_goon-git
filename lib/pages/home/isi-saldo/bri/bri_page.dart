import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:krl_goon/colors.dart';
import 'package:krl_goon/pages/home/isi-saldo/bri/petunjuk_ATM.dart';
import 'package:krl_goon/pages/home/isi-saldo/bri/petunjuk_m_banking.dart';
import 'package:krl_goon/widgets/widget.dart';

class BRIPage extends StatefulWidget {
  const BRIPage({super.key});

  @override
  State<BRIPage> createState() => _BRIPageState();
}

class _BRIPageState extends State<BRIPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
                                    appBarWidget('BRI',()=>Get.back()),

            Center(
              child: Column(
                children: [
                  _imageBRI(),
                  textWidget(
                    'BRI Virtual Account Number',
                    blackColor,
                    14,
                    FontWeight.normal,
                  ),
                  sizedBoxHeightWidget(4),
                  textWidget(
                    '1234 5678 91011 1213',
                    Colors.red,
                    22,
                    FontWeight.w500,
                  ),
                  sizedBoxHeightWidget(10),
                  _salinCodeBox(),
                  sizedBoxHeightWidget(20),
                  Container(
                    color: grayColor,
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        _text1(),
                        sizedBoxHeightWidget(5),
                        _text2(),
                        sizedBoxHeightWidget(5),
                        _text3(),
                        sizedBoxHeightWidget(5),
                        _text4(),
                      ],
                    ),
                  ),
                        sizedBoxHeightWidget(20),
                  _petunjukMBanking(),
                        sizedBoxHeightWidget(20),
                  _petunjukATM(),
                        sizedBoxHeightWidget(20),
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }

  _petunjukATM() {
    return GestureDetector(
              onTap: () => Get.to(const PetunjukATMPage()),
              child: Container(
                  height: 40,
                  color: grayColor,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        textWidget('Petunjuk Transfer ATM', blackColor, 16,
                            FontWeight.normal),
                        const Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.black38,
                          size: 16,
                        ),
                      ],
                    ),
                  )),
            );
  }
  _petunjukMBanking() {
    return GestureDetector(
              onTap: () => Get.to(const PetunjukMBankingPage()),
              child: Container(
                  height: 40,
                  color: grayColor,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        textWidget('Petunjuk Transfer M-Banking', blackColor, 16,
                            FontWeight.normal),
                        const Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.black38,
                          size: 16,
                        ),
                      ],
                    ),
                  )),
            );
  }

  _text1() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        textWidget(
          '1. ',
          blackColor,
          16,
          FontWeight.normal,
        ),
        Expanded(
          child: RichText(
            text: TextSpan(
              text: 'BRI ',
              style: GoogleFonts.poppins(
                color: blackColor,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
              children: [
                TextSpan(
                  text: 'akan memotong biaya admin sebesar ',
                  style: GoogleFonts.poppins(
                    color: blackColor,
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                TextSpan(
                  text: 'Rp1000 ',
                  style: GoogleFonts.poppins(
                    color: blackColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                TextSpan(
                  text: 'langsung dari saldo bank kamu.',
                  style: GoogleFonts.poppins(
                    color: blackColor,
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  _text2() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        textWidget(
          '2. ',
          blackColor,
          16,
          FontWeight.normal,
        ),
        Expanded(
            child: textWidget(
                'Isi saldo dengan Akun Virtual di atas sebelum melakukan perjalanan apabila saldo tidak mencukupi dengan nomor yang sama.',
                blackColor,
                16,
                FontWeight.normal)),
      ],
    );
  }

  _text3() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        textWidget(
          '3. ',
          blackColor,
          16,
          FontWeight.normal,
        ),
        Expanded(
          child: RichText(
            text: TextSpan(
              text: 'Hanya menerima  dari ',
              style: GoogleFonts.poppins(
                color: blackColor,
                fontSize: 16,
                fontWeight: FontWeight.normal,
              ),
              children: [
                TextSpan(
                  text: 'Bank BRI.',
                  style: GoogleFonts.poppins(
                    color: blackColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  _text4() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        textWidget(
          '4. ',
          blackColor,
          16,
          FontWeight.normal,
        ),
        Expanded(
          child: RichText(
            text: TextSpan(
              text: 'Proses Verifikasi kurang dari ',
              style: GoogleFonts.poppins(
                color: blackColor,
                fontSize: 16,
                fontWeight: FontWeight.normal,
              ),
              children: [
                TextSpan(
                  text: '10 menit ',
                  style: GoogleFonts.poppins(
                    color: blackColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                TextSpan(
                  text: 'setelah pembayaran berhasil.',
                  style: GoogleFonts.poppins(
                    color: blackColor,
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  _salinCodeBox() {
    return Container(
      height: 40,
      width: 150,
      margin: const EdgeInsets.all(12),
      decoration: BoxDecoration(
          color: Colors.transparent,
          border: Border.all(color: yellowColor),
          borderRadius: BorderRadius.circular(8)),
      child: Align(
        alignment: Alignment.center,
        child: textWidget(
          'Salin Code',
          yellowColor,
          16,
          FontWeight.normal,
        ),
      ),
    );
  }

  _imageBRI() {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      child: Image.asset(
        'assets/images/bri.png',
        width: 90,
      ),
    );
  }
}
