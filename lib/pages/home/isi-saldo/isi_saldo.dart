import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:krl_goon/pages/home/isi-saldo/bca/bca_page.dart';
import 'package:krl_goon/pages/home/isi-saldo/bri/bri_page.dart';
import 'package:krl_goon/pages/home/isi-saldo/mandiri/mandiri_page.dart';
import 'package:krl_goon/widgets/widget.dart';

import '../../../colors.dart';

class IsiSaldoPage extends StatefulWidget {
  const IsiSaldoPage({Key? key}) : super(key: key);

  @override
  State<IsiSaldoPage> createState() => _IsiSaldoPageState();
}

class _IsiSaldoPageState extends State<IsiSaldoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: bgColor,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                appBarWidget('Isi Saldo', () => Get.back()),
                Container(
                  margin: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      textWidget('Mau isi saldo kamu dengan cara apa ?', blackColor,
                          16, FontWeight.normal),
                      sizedBoxHeightWidget(8),
                      textWidget('Transfer Bank', Colors.black38, 14,
                          FontWeight.normal),
                      sizedBoxHeightWidget(8),
                      _BoxBCA(),
                      sizedBoxHeightWidget(10),
                      _BoxBRI(),
                      sizedBoxHeightWidget(10),
                      _BoxMandiri(),
                    ],
                  ),
                ),
                // appBar: AppBar(
                //   backgroundColor: bgColor,
                //   title: textWidget(
                //     'Isi saldo',
                //     blackColor,
                //     18,
                //     FontWeight.w500,
                //   ),
                // ),
//       body: SingleChildScrollView(
//         child: Container(
//           margin: EdgeInsets.all(20),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               textWidget('Mau isi saldo kamu dengan cara apa ?', blackColor, 16,
//                   FontWeight.normal),
//               sizedBoxHeightWidget(8),
//               textWidget('Transfer Bank', Colors.black38, 14, FontWeight.normal),
//               sizedBoxHeightWidget(8),
//               _BoxBCA(),
//               sizedBoxHeightWidget(10),
//               _BoxBRI(),
//               sizedBoxHeightWidget(10),
//               _BoxMandiri(),
              ],
            ),
          ),
        ));
  }

  _BoxBCA() {
    return GestureDetector(
      onTap: () => Get.to(const BCAPage()),
      child: Container(
        height: 60,
        decoration: BoxDecoration(
          color: whiteColor,
          borderRadius: const BorderRadius.all(Radius.circular(8)),
        ),
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset('assets/images/bca.png'),
              const Icon(
                Icons.arrow_forward_ios,
                color: Colors.black38,
                size: 16,
              )
            ],
          ),
        ),
      ),
    );
  }

  _BoxBRI() {
    return GestureDetector(
      onTap: () => Get.to(const BRIPage()),
      child: Container(
        height: 60,
        decoration: BoxDecoration(
          color: whiteColor,
          borderRadius: const BorderRadius.all(Radius.circular(8)),
        ),
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset('assets/images/bri.png'),
              const Icon(
                Icons.arrow_forward_ios,
                color: Colors.black38,
                size: 16,
              ),
            ],
          ),
        ),
      ),
    );
  }

  _BoxMandiri() {
    return GestureDetector(
      onTap: () => Get.to(const MandiriPage()),
      child: Container(
        height: 60,
        decoration: BoxDecoration(
          color: whiteColor,
          borderRadius: const BorderRadius.all(Radius.circular(8)),
        ),
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset('assets/images/mandiri.png'),
              const Icon(
                Icons.arrow_forward_ios,
                color: Colors.black38,
                size: 16,
              )
            ],
          ),
        ),
      ),
    );
    // return Container(
    //   height: 60,
    //   decoration: BoxDecoration(
    //     color: whiteColor,
    //     borderRadius: BorderRadius.all(Radius.circular(8)),
    //   ),
    //   child: Container(
    //     margin: EdgeInsets.symmetric(horizontal: 15),
    //     child: Row(
    //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //       children: [
    //         Image.asset('assets/images/bca.png'),
    //         IconButton(
    //           onPressed: () {},
    //           icon: Icon(
    //             Icons.arrow_forward_ios,
    //             color: Colors.black38,
    //             size: 16,
    //           ),
    //         )
    //       ],
    //     ),
    //   ),
    // );
  }
  // _BoxBRI() {
  //   return Container(
  //             height: 60,
  //             decoration: BoxDecoration(
  //               color: whiteColor,
  //               borderRadius: BorderRadius.all(Radius.circular(8)),
  //             ),
  //             child: Container(
  //               margin: EdgeInsets.symmetric(horizontal: 15),
  //               child: Row(
  //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                 children: [
  //                   Image.asset('assets/images/bri.png'),
  //                   IconButton(
  //                     onPressed: () {},
  //                     icon: Icon(Icons.arrow_forward_ios,color: Colors.black38,size: 16,),
  //                   )
  //                 ],
  //               ),
  //             ),
  //           );
  // }
  // _BoxMandiri() {
  //   return Container(
  //             height: 60,
  //             decoration: BoxDecoration(
  //               color: whiteColor,
  //               borderRadius: BorderRadius.all(Radius.circular(8)),
  //             ),
  //             child: Container(
  //               margin: EdgeInsets.symmetric(horizontal: 15),
  //               child: Row(
  //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                 children: [
  //                   Image.asset('assets/images/mandiri.png'),
  //                   IconButton(
  //                     onPressed: () {},
  //                     icon: Icon(Icons.arrow_forward_ios,color: Colors.black38,size: 16,),
  //                   )
  //                 ],
  //               ),
  //             ),
  //           );
  // }
}
