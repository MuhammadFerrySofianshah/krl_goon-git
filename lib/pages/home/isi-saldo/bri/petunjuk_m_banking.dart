import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:krl_goon/colors.dart';
import 'package:krl_goon/widgets/widget.dart';

class PetunjukMBankingPage extends StatelessWidget {
  const PetunjukMBankingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: bgColor,
    
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(

          children: [
                      appBarWidget('Petunjuk Transfer M-Banking', () => Get.back()),
            Container(
              height: 500,
              color: grayColor,
              margin: const EdgeInsets.only(top:20),
              padding: const EdgeInsets.fromLTRB(20,30,20,40),
              child: Column(
                children: [
                  _text1(),
                  sizedBoxHeightWidget(10),
                  _text2(),
                  sizedBoxHeightWidget(10),
                  _text3(),
                  sizedBoxHeightWidget(10),
                  _text4(),
                  sizedBoxHeightWidget(10),
                  _text5(),
                  sizedBoxHeightWidget(10),
                  _text6(),
                ],
              ),
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
          '1.  ',
          blackColor,
          16,
          FontWeight.normal,
        ),
        Expanded(
          child: RichText(
            text: TextSpan(
              text: 'Pilih ',
              style: GoogleFonts.poppins(
                color: blackColor,
                fontSize: 16,
                fontWeight: FontWeight.normal,
              ),
              children: [
                TextSpan(
                  text: 'M-Transfer > Virtual Account. ',
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
          child: RichText(
            text: TextSpan(
              text: 'Masukkan nomor ',
              style: GoogleFonts.poppins(
                color: blackColor,
                fontSize: 16,
                fontWeight: FontWeight.normal,
              ),
              children: [
                TextSpan(
                  text: 'Virtual Account ',
                  style: GoogleFonts.poppins(
                    color: blackColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                TextSpan(
                  text: '1234 567 8910 1112 ',
                  style: GoogleFonts.poppins(
                    color: Colors.red,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                TextSpan(
                  text: 'dan pilih ',
                  style: GoogleFonts.poppins(
                    color: blackColor,
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                TextSpan(
                  text: 'Send.',
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
              text: 'Masukkan ',
              style: GoogleFonts.poppins(
                color: blackColor,
                fontSize: 16,
                fontWeight: FontWeight.normal,
              ),
              children: [
                TextSpan(
                  text: 'amount ',
                  style: GoogleFonts.poppins(
                    color: blackColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                TextSpan(
                  text: 'top up isi saldo yang diinginkan.',
                  style: GoogleFonts.poppins(
                    color: blackColor,
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                TextSpan(
                  text: '\nMin top up: Rp10.000.',
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
              text: 'Periksa informasi yang tertera dilayar. Pastikan Merchant adalah ',
              style: GoogleFonts.poppins(
                color: blackColor,
                fontSize: 16,
                fontWeight: FontWeight.normal,
              ),
              children: [
                TextSpan(
                  text: 'KRL Go On ',
                  style: GoogleFonts.poppins(
                    color: blackColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                TextSpan(
                  text: 'dan Username Anda. Jika benar pilih ',
                  style: GoogleFonts.poppins(
                    color: blackColor,
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                TextSpan(
                  text: 'Ya.',
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

  _text5() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        textWidget(
          '5. ',
          blackColor,
          16,
          FontWeight.normal,
        ),
        Expanded(
          child: RichText(
            text: TextSpan(
              text: 'Masukkan pin ',
              style: GoogleFonts.poppins(
                color: blackColor,
                fontSize: 16,
                fontWeight: FontWeight.normal,
              ),
              children: [
                TextSpan(
                  text: 'M-Banking ',
                  style: GoogleFonts.poppins(
                    color: blackColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                TextSpan(
                  text: 'Anda dan pilih ',
                  style: GoogleFonts.poppins(
                    color: blackColor,
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                TextSpan(
                  text: 'OK.',
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

  _text6() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        textWidget(
          '6. ',
          blackColor,
          16,
          FontWeight.normal,
        ),
        Expanded(
          child: RichText(
            text: TextSpan(
              text: 'Jika muncul notifikasi ',
              style: GoogleFonts.poppins(
                color: blackColor,
                fontSize: 16,
                fontWeight: FontWeight.normal,
              ),
              children: [
                TextSpan(
                  text: '“Transaksi   gagal. Nominal melebihi limit harian”.',
                  style: GoogleFonts.poppins(
                    color: blackColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                TextSpan(
                  text: '\nMohon ulang transaksi menggunakan ATM.',
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

