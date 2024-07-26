import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:krl_goon/pages/home/rute/rute.dart';
import 'package:krl_goon/widgets/widget.dart';

import '../../../colors.dart';

class TiketKosongPage extends StatefulWidget {
  const TiketKosongPage({Key? key}) : super(key: key);

  @override
  State<TiketKosongPage> createState() => _TiketKosongPageState();
}

class _TiketKosongPageState extends State<TiketKosongPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: Column(
          children: [
            wAppBar('Tiket', () => Get.back()),
            Center(
              child: Column(
                children: [
                  wSizedBoxHeight(100),
                  wText(
                    'Tidak ada tiket !',
                    blackColor,
                    22,
                    FontWeight.bold,
                  ),
                  wSizedBoxHeight(10),
                  wText(
                    'Pesan tiket Kamu terlebih dahulu.',
                    blackColor,
                    16,
                    FontWeight.normal,
                  ),
                  wSizedBoxHeight(20),
                  _pesanSekarangButton()
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  _pesanSekarangButton() {
    return InkWell(
      onTap: () => Get.to(const RutePage()),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 90),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
            color: yellowColor, borderRadius: BorderRadius.circular(8)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            wText(
              'Pesan Sekarang',
              whiteColor,
              14,
              FontWeight.normal,
            ),
            wSizedBoxWidth(5),
            SvgPicture.asset('assets/svgs/order.svg')
          ],
        ),
      ),
    );
  }
}
