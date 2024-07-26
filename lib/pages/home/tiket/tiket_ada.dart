import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:krl_goon/pages/home/tiket/scan_masuk.dart';
import 'package:krl_goon/widgets/widget.dart';

import '../../../colors.dart';

class TiketAdaPage extends StatefulWidget {
  const TiketAdaPage({Key? key}) : super(key: key);

  @override
  State<TiketAdaPage> createState() => _TiketAdaPageState();
}

class _TiketAdaPageState extends State<TiketAdaPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
    
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
                          wAppBar('Tiket', () => Get.back()),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      Stack(
                        children: [Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                              color: yellowColor,
                              borderRadius: BorderRadius.circular(500)),
              
                        ),
                        const Positioned(
                          top: 25,
                          left: 25,
                          child: Icon(Icons.qr_code_scanner,size: 50,))
                        ]
                      ),
                      wSizedBoxHeight(15),
                      wText(
                        'Tiket Anda',
                        blackColor,
                        22,
                        FontWeight.bold,
                      ),
                      wSizedBoxHeight(30),
                      wText(
                        'Stasiun Bekasi',
                        blackColor,
                        16,
                        FontWeight.normal,
                      ),
                      wSizedBoxHeight(15),
                      const Icon(
                        Icons.arrow_circle_down,
                        size: 60,
                      ),
                      wSizedBoxHeight(15),
                      wText(
                        'Stasiun Manggarai',
                        blackColor,
                        16,
                        FontWeight.normal,
                      ),
                      wSizedBoxHeight(200),
                      _scanQRButton()
                    ],
                  ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _scanQRButton() {
    return InkWell(
      onTap: () => Get.to(const ScanMasuk()),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 90),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
            color: yellowColor, borderRadius: BorderRadius.circular(8)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // SvgPicture.asset('assets/svgs/order.svg'),
            Icon(
              Icons.qr_code,
              color: whiteColor,
            ),
            wSizedBoxWidth(5),
            wText(
              'Scan QR Code',
              whiteColor,
              16,
              FontWeight.normal,
            ),
          ],
        ),
      ),
    );
  }
}