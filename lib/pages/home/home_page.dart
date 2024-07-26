import 'package:carousel_slider/carousel_slider.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:krl_goon/colors.dart';
import 'package:krl_goon/pages/home/inbox/inbox-page.dart';
import 'package:krl_goon/pages/home/profile/profile_page.dart';
import 'package:krl_goon/pages/home/riwayat/riwayat.dart';
import 'package:krl_goon/pages/home/tiket/tiket_kosong.dart';
import 'package:krl_goon/widgets/widget.dart';

import 'bantuan/bantuan.dart';
import 'isi-saldo/isi_saldo.dart';
import 'rute/rute.dart';

final List<String> imgList = [
  "assets/images/tab-bar-1.jpg",
  "assets/images/tab-bar-2.jpg",
  "assets/images/tab-bar-3.jpg",
  "assets/images/tab-bar-4.jpg",
  "assets/images/tab-bar-5.jpg",
];

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isLoading = true;
  int _current = 0;
  int _currentIndexNavBar = 0;

  final CarouselController _carouselController = CarouselController();

  final List<Widget> imageSliders = imgList
      .map(
        (item) => Container(
          margin: const EdgeInsets.all(5.0),
          child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            child: Stack(
              children: <Widget>[
                Image.asset(
                  item,
                  fit: BoxFit.cover,
                  width: 10000,
                  height: 95,
                ),
              ],
            ),
          ),
        ),
      )
      .toList();
  @override
  Widget build(BuildContext context) {
    List<Widget> pages = [
      SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            children: [
              _ClipPath(),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _SaldoProfile(),
                    wSizedBoxHeight(8),
                    _SelamatDatangText(),
                    _PilihRuteText(),
                    wSizedBoxHeight(8),
                    _boxFotoSilde(context),
                    wSizedBoxHeight(20),
                    _boxIcons(context),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      const RiwayatPage(),
      const TiketKosongPage(),
      const BantuanPage(),
      const ProfilePage(),
    ];
    return Scaffold(
      backgroundColor: bgColor,
      bottomNavigationBar: _bottomNavBar(),
      body: pages[_currentIndexNavBar],
    );
  }

  ConvexAppBar _bottomNavBar() {
    return ConvexAppBar(
      backgroundColor: bgColor,
      style: TabStyle.fixed,
      activeColor: yellowColor,
      color: const Color(0xff8596A0),
      items: [
        const TabItem(
            icon: Icons.home_outlined, activeIcon: Icons.home, title: 'Home'),
        const TabItem(
            icon: Icons.history_outlined,
            activeIcon: Icons.history,
            title: 'Riwayat'),
        TabItem(
            icon: Icon(
              Icons.qr_code_scanner,
              color: yellowColor,
              size: 40,
            ),
            title: 'Tiket'),
        const TabItem(
            icon: Icons.help_outline, activeIcon: Icons.help, title: 'Bantuan'),
        const TabItem(
            icon: Icons.person_outline_outlined,
            activeIcon: Icons.person,
            title: 'Akun Saya'),
      ],
      initialActiveIndex: 0,
      onTap: (int i) {
        setState(() {
          _currentIndexNavBar = i;
        });
      },
    );
  }

  _boxIcons(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        gradient: const LinearGradient(
            colors: [Color(0xffececec), Color(0xffDDDDDD)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight),
        boxShadow: const [
          BoxShadow(
            offset: Offset(2, 2),
            blurRadius: 3,
            color: Color(0x5b3d3d3d),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () => Get.to(const RutePage()),
            child: Column(
              children: [
                SvgPicture.asset("assets/svgs/rute-icon.svg"),
                wSizedBoxHeight(6),
                wText("Rute", blackColor, 12, FontWeight.w500)
              ],
            ),
          ),
          InkWell(
            onTap: () => Get.to(const IsiSaldoPage()),
            child: Column(
              children: [
                SvgPicture.asset("assets/svgs/isiSaldo-icon.svg"),
                wSizedBoxHeight(6),
                wText("Isi Saldo", blackColor, 12, FontWeight.w500)
              ],
            ),
          ),
          InkWell(
            onTap: () => Get.to(const RiwayatPage()),
            child: Column(
              children: [
                SvgPicture.asset("assets/svgs/jadwal-kereta-icon.svg"),
                wSizedBoxHeight(6),
                wText('Jadwal Kereta', blackColor, 12, FontWeight.w500)
              ],
            ),
          ),
          InkWell(
            onTap: () => Get.to(const BantuanPage()),
            child: Column(
              children: [
                SvgPicture.asset("assets/svgs/posisi-kereta-icon.svg"),
                wSizedBoxHeight(6),
                wText('Posisi Kereta', blackColor, 12, FontWeight.w500)
              ],
            ),
          ),
        ],
      ),
    );
  }

  _boxFotoSilde(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            gradient: const LinearGradient(
                colors: [Color(0xffececec), Color(0xffDDDDDD)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight),
            boxShadow: const [
              BoxShadow(
                offset: Offset(2, 2),
                blurRadius: 3,
                color: Color(0x5b3d3d3d),
              ),
            ],
          ),
          child: Column(children: [
            Stack(children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: CarouselSlider(
                  items: imageSliders,
                  carouselController: _carouselController,
                  options: CarouselOptions(
                      aspectRatio: 3,
                      autoPlay: true,
                      onPageChanged: (index, reason) {
                        setState(() {
                          _current = index;
                        });
                      }),
                ),
              ),
              Positioned(
                left: 280,
                top: 110,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: imgList.asMap().entries.map((entry) {
                    return GestureDetector(
                      onTap: () =>
                          _carouselController.animateToPage(entry.key),
                      child: Container(
                        width: 10.0,
                        height: 10.0,
                        margin: const EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 3.0),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: (Theme.of(context).brightness ==
                                        Brightness.dark
                                    ? Colors.white
                                    : Colors.black)
                                .withOpacity(
                                    _current == entry.key ? 0.9 : 0.4)),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ]),
          ]),
        ),
      ],
    );
  }

  _PilihRuteText() {
    return SizedBox(
        width: 255,
        child: wText('Klik Rute untuk memesan tiket...', whiteColor, 14,
            FontWeight.w400));
  }

  _SelamatDatangText() {
    return SizedBox(
        width: 255,
        child: wText('Selamat Datang', whiteColor, 14, FontWeight.w500));
  }

  _SaldoProfile() {
    return Row(
      children: [
        SvgPicture.asset('assets/svgs/jumlahSaldo-icon.svg'),
        wSizedBoxWidth(5),
        Text(
          'Rp',
          style: GoogleFonts.poppins(
              color: grayColor,
              fontSize: 12,
              fontWeight: FontWeight.w500,
              shadows: <Shadow>[
                const Shadow(
                  offset: Offset(2.0, 2.0),
                  blurRadius: 3.0,
                  color: Color(0x5b3d3d3d),
                ),
              ]),
        ),
        wSizedBoxWidth(5),
        Text(
          '100.000',
          style: GoogleFonts.poppins(
            color: blackColor,
            fontSize: 24,
            fontWeight: FontWeight.w500,
            shadows: <Shadow>[
              const Shadow(
                offset: Offset(2.0, 2.0),
                blurRadius: 3.0,
                color: Color(0x5b3d3d3d),
              ),
            ],
          ),
        ),
        const Spacer(),
        Column(
          children: [
            InkWell(
                onTap: () => Get.to(const InboxPage()),
                child: Icon(Icons.mail_outline_sharp,size: 25,color: whiteColor,)),
            wText('Inbox', whiteColor, 12, FontWeight.normal)
          ],
        ),
      ],
    );
  }

  boxIcons(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: 85,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            gradient: const LinearGradient(
                colors: [Color(0xffececec), Color(0xffDDDDDD)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight),
            boxShadow: const [
              BoxShadow(
                offset: Offset(2, 2),
                blurRadius: 3,
                color: Color(0x5b3d3d3d),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(25, 13, 25, 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () => Get.to(const RutePage()),
                child: Column(
                  children: [
                    SvgPicture.asset("assets/svgs/rute-icon.svg"),
                    wSizedBoxHeight(6),
                    wText("Rute", blackColor, 14, FontWeight.w500)
                  ],
                ),
              ),
              InkWell(
                onTap: () => Get.to(const IsiSaldoPage()),
                child: Column(
                  children: [
                    SvgPicture.asset("assets/svgs/isiSaldo-icon.svg"),
                    wSizedBoxHeight(6),
                    wText("Isi Saldo", blackColor, 14, FontWeight.w500)
                  ],
                ),
              ),
              InkWell(
                onTap: () => Get.to(const RiwayatPage()),
                child: Column(
                  children: [
                    SvgPicture.asset("assets/svgs/riwayat-icon.svg"),
                    wSizedBoxHeight(6),
                    wText('Riwayat', blackColor, 14, FontWeight.w500)
                  ],
                ),
              ),
              InkWell(
                onTap: () => Get.to(const BantuanPage()),
                child: Column(
                  children: [
                    SvgPicture.asset("assets/svgs/bantuan-icon.svg"),
                    wSizedBoxHeight(6),
                    wText('Bantuan', blackColor, 14, 
                    FontWeight.w500)
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  // _boxFotoSilde(BuildContext context) {
  //   return Stack(
  //     children: [
  //       Container(
  //         width: MediaQuery.of(context).size.width,
  //         height: 135,
  //         // height: 375,
  //         decoration: BoxDecoration(
  //           borderRadius: BorderRadius.circular(10),
  //           gradient: const LinearGradient(
  //               colors: [Color(0xffececec), Color(0xffDDDDDD)],
  //               begin: Alignment.topLeft,
  //               end: Alignment.bottomRight),
  //           boxShadow: const [
  //             BoxShadow(
  //               offset: Offset(2, 2),
  //               blurRadius: 3,
  //               color: Color(0x5b3d3d3d),
  //             ),
  //           ],
  //         ),
  //         child: Column(children: [
  //           Stack(children: [
  //             Padding(
  //               padding: EdgeInsets.only(top: 10),
  //               child: CarouselSlider(
  //                 items: imageSliders,
  //                 carouselController: _carouselController,
  //                 options: CarouselOptions(
  //                     aspectRatio: 3,
  //                     autoPlay: true,
  //                     onPageChanged: (index, reason) {
  //                       setState(() {
  //                         _current = index;
  //                       });
  //                     }),
  //               ),
  //             ),
  //             Align(
  //               alignment: Alignment.bottomRight,
  //               child: Padding(
  //                 padding: const EdgeInsets.only(top: 108, right: 15),
  //                 child: Row(
  //                   mainAxisAlignment: MainAxisAlignment.end,
  //                   children: imgList.asMap().entries.map((entry) {
  //                     return GestureDetector(
  //                       onTap: () =>
  //                           _carouselController.animateToPage(entry.key),
  //                       child: Container(
  //                         width: 10.0,
  //                         height: 10.0,
  //                         margin: const EdgeInsets.symmetric(
  //                             vertical: 8.0, horizontal: 3.0),
  //                         decoration: BoxDecoration(
  //                             shape: BoxShape.circle,
  //                             color: (Theme.of(context).brightness ==
  //                                         Brightness.dark
  //                                     ? Colors.white
  //                                     : Colors.black)
  //                                 .withOpacity(
  //                                     _current == entry.key ? 0.9 : 0.4)),
  //                       ),
  //                     );
  //                   }).toList(),
  //                 ),
  //               ),
  //             ),
  //           ]),
  //         ]),
  //       ),
  //     ],
  //   );
  // }

  // _PilihRuteText() {
  //   return SizedBox(
  //       width: 255,
  //       child:
  //           wText(
  //               'Pilihlah rute perjalanan Anda dan pesan tiket dengan mudah...',
  //               whiteColor,
  //               14,
  //               FontWeight.w400));
  // }

  // _SelamatDatangText() {
  //   return SizedBox(
  //       width: 255,
  //       child: wText('Selamat Datang', whiteColor, 14, FontWeight.w500));
  // }

  // _SaldoProfile() {
  //   return Row(
  //     children: [
  //       SvgPicture.asset('assets/svgs/isiSaldo-icon.svg'),
  //       wSizedBoxWidth(5),
  //       Text(
  //         'Rp',
  //         style: GoogleFonts.poppins(
  //             color: grayColor,
  //             fontSize: 12,
  //             fontWeight: FontWeight.w500,
  //             shadows: <Shadow>[
  //               const Shadow(
  //                 offset: Offset(2.0, 2.0),
  //                 blurRadius: 3.0,
  //                 color: Color(0x5b3d3d3d),
  //               ),
  //             ]
  //             ),
  //       ),
  //       wSizedBoxWidth(5),
  //       Text(
  //         '100.000',
  //         style: GoogleFonts.poppins(
  //           color: blackColor,
  //           fontSize: 24,
  //           fontWeight: FontWeight.w500,
  //           shadows: <Shadow>[
  //             const Shadow(
  //               offset: Offset(2.0, 2.0),
  //               blurRadius: 3.0,
  //               color: Color(0x5b3d3d3d),
  //             ),
  //           ],
  //         ),
  //       ),
  //       const Spacer(),
  //       Column(
  //         children: [
  //           InkWell(
  //               onTap: () => Get.to(const ProfilePage()),
  //               child: SvgPicture.asset('assets/svgs/profile-icon.svg')),
  //               wText('Profile', whiteColor, 12, 
  //               FontWeight.normal)
  //         ],
  //       ),
  //     ],
  //   );
  // }

  _ClipPath() {
    return ClipPath(
      // custom clip
      clipper: ClipPathClass(),
      child: Container(
        height: 250,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xffFFC500), Color(0xffE6B200)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            stops: [0.0, 2.0],
          ),
        ),
      ),
    );
  }
}

class ClipPathClass extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height - 60);
    path.quadraticBezierTo(
        size.width / 2, size.height, size.width, size.height - 60);
    path.lineTo(size.width, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
