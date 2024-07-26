import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:krl_goon/pages/home/tiket/tiket_ada.dart';

import '../../../colors.dart';
import '../../../widgets/widget.dart';

class RutePage extends StatefulWidget {
  const RutePage({Key? key}) : super(key: key);

  @override
  State<RutePage> createState() => _RutePageState();
}

class _RutePageState extends State<RutePage> {
  // final
  final dateController = TextEditingController();

  //! Fungsi untuk + dan - pesanan tiket
  int counter = 1;
  // set State Counter
  void _counterMinus() {
    setState(() {
      if (counter > 1) {
        counter--;
      }
    });
  }
  void _counterPlus() {
    setState(() {
      if (counter < 50) {
        counter++;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: bgColor,
        body: SafeArea(
          child: Column(
            children: [
              wAppBar('', () {
                Get.back();
              }),
              SingleChildScrollView(
                child: Container(
                  margin: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      wText('Hii,', blackColor, 22, FontWeight.w600),
                      wText('Isi Rute Kamu untuk\nmenerima tiket!', blackColor,
                          22, FontWeight.w600),
                      wSizedBoxHeight(20),
                      _fieldBoxRute('Pilih keberangkatan...'),
                      wSizedBoxHeight(20),
                      _fieldBoxRute('Pilih tujuan...'),
                      wSizedBoxHeight(20),
                      wSizedBoxHeight(3),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [_jumlahTiket(), _tanggalBerangkat()],
                      ),
                    ],
                  ),
                ),
              ),
              const Spacer(),
              _bottomBarTotal(context),
            ],
          ),
        ));
  }

  Column _tanggalBerangkat() {
    return Column(
      children: [
        wText('Tanggal berangkat:', blackColor, 14, FontWeight.w500),
        wSizedBoxHeight(4),
        Container(
          width: 150,
          height: 40,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: yellowColor,
          ),
          child: TextFormField(
            controller: dateController,
            style: TextStyle(
                color: whiteColor, fontSize: 16, fontWeight: FontWeight.w500),
            textAlign: TextAlign.center,
            decoration: const InputDecoration(
              hintText: 'YY/MM/DD',
              hintStyle: TextStyle(fontSize: 16, color: Colors.white),
              contentPadding: EdgeInsets.only(bottom: 10),
              enabledBorder: OutlineInputBorder(borderSide: BorderSide.none),
              focusedBorder: OutlineInputBorder(borderSide: BorderSide.none),
            ),
            readOnly: true,
            onTap: () {
              tambahTanggal();
            },
          ),
        ),
      ],
    );
  }

  Column _jumlahTiket() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        wText('Jumlah tiket:', blackColor, 14, FontWeight.w500),
        wSizedBoxHeight(4),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: 150,
              height: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: yellowColor,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                      onTap: _counterMinus,
                      child: Icon(
                        Icons.remove_circle_outline,
                        size: 30,
                        color: whiteColor,
                      )),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: wText('$counter', whiteColor, 16, FontWeight.bold),
                  ),
                  InkWell(
                      onTap: _counterPlus,
                      child: Icon(
                        Icons.add_circle_outline,
                        size: 30,
                        color: whiteColor,
                      )),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  Row _bottomBarTotal(BuildContext context) {
    return Row(
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
              border: Border.all(color: Colors.black.withOpacity(0.13))),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Row(
                children: [
                  wText('Total', Colors.black54, 12, FontWeight.w500),
                  wSizedBoxWidth(5),
                  wText('Rp10.000', yellowColor, 24, FontWeight.w600),
                ],
              ),
            ),
          ),
        ),
        Expanded(
          child: InkWell(
            onTap: () => Get.to(const TiketAdaPage()),
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
                  border: Border.all(color: Colors.black.withOpacity(0.13))),
              child: Center(
                child: wText('CHECKOUT', whiteColor, 16, FontWeight.bold),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Column _fieldBoxRute(String textField) {
    return Column(children: [
      TextFormField(
        decoration: InputDecoration(
          border: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Color(0xffB9B9B9),
              ),
              borderRadius: BorderRadius.circular(15)),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Color(0xffB9B9B9),
            ),
            borderRadius: BorderRadius.circular(15),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Color(0xffB9B9B9),
            ),
            borderRadius: BorderRadius.circular(15),
          ),
          errorBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
          hoverColor: const Color(0xffB9B9B9),
          filled: true,
          fillColor: const Color(0xffB9B9B9),
          prefixIcon: const Icon(
            Icons.search_outlined,
            color: Color(0xff4C4C4C),
            size: 25.0,
          ),
          hintText: textField,
          hintStyle: GoogleFonts.poppins(
            color: const Color(0xff4C4C4C),
            fontSize: 16,
            fontWeight: FontWeight.normal,
          ),
        ),
      ),
    ],);
  }

  Future<void> tambahTanggal() async {
    DateTime? pilih = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2100));
    if (pilih != null) {
      setState(() {
        dateController.text = pilih.toString().split(' ')[0];
      });
    } else {}
  }
}

class Faq {
  String? question, answer;
  bool isExpanded;
  Faq({
    this.question,
    this.answer,
    this.isExpanded = false,
  });
}
