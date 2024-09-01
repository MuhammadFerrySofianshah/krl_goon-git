import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:krl_goon/widgets/widget.dart';

import '../../../colors.dart';

class RiwayatPage extends StatefulWidget {
  const RiwayatPage({Key? key}) : super(key: key);

  @override
  State<RiwayatPage> createState() => _RiwayatPageState();
}

class _RiwayatPageState extends State<RiwayatPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            appBarWidget('Riwayat', () => Get.back()),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      textWidget(
                        'Perjalanan Terakhir',
                        blackColor,
                        16,
                        FontWeight.normal,
                      ),
                      const Icon(
                        Icons.sort,
                      )
                    ],
                  ),
                  _listHistory(),
                  _listHistory(),
                  _listHistory(),
                  _listHistory(),
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }

  _listHistory() {
    return Column(
      children: [
        Divider(color: grayColor),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SvgPicture.asset('assets/svgs/riwayat-list-icon.svg'),
            sizedBoxWidthWidget(9),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  textWidget(
                    'Stasiun Bekasi',
                    blackColor,
                    12,
                    FontWeight.w500,
                  ),
                  textWidget(
                    'Stasiun Manggarai',
                    blackColor,
                    12,
                    FontWeight.w500,
                  ),
                  textWidget(
                    '11 Nov 2023',
                    blackColor,
                    10,
                    FontWeight.normal,
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      textWidget(
                        '-Rp10.000',
                        blackColor,
                        14,
                        FontWeight.w500,
                      ),
                      sizedBoxWidthWidget(9),
                      const Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.black38,
                        size: 16,
                      )
                    ],
                  ),
                  textWidget(
                    'Berhasil',
                    yellowColor,
                    12,
                    FontWeight.w500,
                  ),
                ],
              ),
            ),
          ],
        ),
        sizedBoxWidthWidget(10),
      ],
      // appBar: AppBar(
      //   title: Text(
      //     'Riwayat',
      //     style: GoogleFonts.poppins(
      //       color: grayColor,
      //       fontSize: 16,
      //       fontWeight: FontWeight.normal,
      //     ),
      //   ),
      // ),
    );
  }
}
