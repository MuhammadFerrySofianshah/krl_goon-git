import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../colors.dart';
import '../../../widgets/widget.dart';

class RutePage extends StatefulWidget {
  const RutePage({Key? key}) : super(key: key);

  @override
  State<RutePage> createState() => _RutePageState();
}

class _RutePageState extends State<RutePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: _appBar(),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.fromLTRB(20, 30, 20, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                   wSizedBoxHeight( 6),
                  // Isi Rute Awal
                  _fieldBoxRute('Isi Rute Awal', 'Cth.Stasiun Bekasi'),
                   wSizedBoxHeight( 20),
                  // Isi Rute Tujuan
                  _fieldBoxRute('Isi Rute Tujuan', 'Cth.Stasiun Manggarai'),
                ],
              ),
            ),
            Spacer(),
            Row(
              children: [
                Container(
                  width: 228,
                  height: 55,
                  decoration: BoxDecoration(
                      color: whiteColor,
                      boxShadow: const [
                        BoxShadow(
                            color: Color(0xffc8c8c8),
                            blurRadius: 10,
                            offset: Offset(4, 6)),
                      ],
                      border:
                          Border.all(color: Colors.black.withOpacity(0.13))),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.only(left:20),
                      child: Row(
                        children: [
                          wText('Total', Colors.black54, 12, FontWeight.w500),
                           wSizedBoxWidth( 5),
                          wText('Rp10.000', yellowColor, 24, FontWeight.w600),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: InkWell(
                    onTap: () {},
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 55,
                      decoration: BoxDecoration(
                          color: const Color(0xffFFC500),
                          boxShadow: const [
                            BoxShadow(
                                color: Color(0xffc8c8c8),
                                blurRadius: 10,
                                offset: Offset(4, 6)),
                          ],
                          border:
                              Border.all(color: Colors.black.withOpacity(0.13))),
                      child: Center(
                        child: Text(
                          'CHECKOUT',
                          style: GoogleFonts.poppins(
                            color: whiteColor,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  AppBar _appBar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      title: Text(
        'Pilih Rute',
        style: GoogleFonts.poppins(
          color: blackColor,
          fontSize: 18,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  Column _fieldBoxRute(String textTitle, String textField) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          textTitle,
          style: GoogleFonts.poppins(
            color: blackColor,
            fontSize: 14,
            fontWeight: FontWeight.normal,
          ),
        ),
         wSizedBoxHeight( 6),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: TextFormField(
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(vertical: 0),
                  border: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Color(0xffD9D9D9),
                      ),
                      borderRadius: BorderRadius.circular(10)),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Color(0xffD9D9D9),
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Color(0xffD9D9D9),
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  hoverColor: const Color(0xffD9D9D9),
                  filled: true,
                  fillColor: const Color(0xffD9D9D9),
                  prefixIcon: const Icon(
                    Icons.search_outlined,
                    color: Color(0xff979797),
                    size: 25.0,
                  ),
                  hintText: textField,
                  hintStyle: GoogleFonts.poppins(
                    color: const Color(0xff979797),
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
            ),
            wSizedBoxWidth(10),
            TextButton(
              onPressed: () {},
              child: Text(
                'Batal',
                style: GoogleFonts.poppins(
                  color: blackColor,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            )
          ],
        ),
      ],
    );
  }
}
