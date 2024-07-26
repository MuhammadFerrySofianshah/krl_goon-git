import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:krl_goon/colors.dart';
import 'package:krl_goon/pages/home/isi-saldo/bca/petunjuk_ATM.dart';
import 'package:krl_goon/pages/home/isi-saldo/bca/petunjuk_m_banking.dart';
import 'package:krl_goon/widgets/widget.dart';

class BCAPage extends StatefulWidget {
  const BCAPage({super.key});

  @override
  State<BCAPage> createState() => _BCAPageState();
}

class _BCAPageState extends State<BCAPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            wAppBar('BCA', () => Get.back()),
            Center(
              child: Column(
                children: [
                  _imageBCA(),
                  wText(
                    'BCA Virtual Account Number',
                    blackColor,
                    14,
                    FontWeight.normal,
                  ),
                  wSizedBoxHeight(4),
                  wText(
                    '1234 5678 91011 1213',
                    Colors.red,
                    22,
                    FontWeight.w500,
                  ),
                  wSizedBoxHeight(10),
                  _salinCodeBox(),
                  wSizedBoxHeight(20),
                  Container(
                    color: grayColor,
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        _text1(),
                        wSizedBoxHeight(5),
                        _text2(),
                        wSizedBoxHeight(5),
                        _text3(),
                        wSizedBoxHeight(5),
                        _text4(),
                      ],
                    ),
                  ),
                  wSizedBoxHeight(20),
                  _petunjukMBanking(),
                  wSizedBoxHeight(20),
                  _petunjukATM(),
                  wSizedBoxHeight(20),
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
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                wText(
                    'Petunjuk Transfer ATM', blackColor, 16, FontWeight.normal),
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
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                wText('Petunjuk Transfer M-Banking', blackColor, 16,
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
        wText(
          '1. ',
          blackColor,
          16,
          FontWeight.normal,
        ),
        Expanded(
          child: RichText(
            text: TextSpan(
              text: 'BCA ',
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
        wText(
          '2. ',
          blackColor,
          16,
          FontWeight.normal,
        ),
        Expanded(
            child: wText(
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
        wText(
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
                  text: 'Bank BCA.',
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
        wText(
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
        child: wText(
          'Salin Code',
          yellowColor,
          16,
          FontWeight.normal,
        ),
      ),
    );
  }

  _imageBCA() {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      child: Image.asset(
        'assets/images/bca.png',
        width: 90,
      ),
    );
  }
}
