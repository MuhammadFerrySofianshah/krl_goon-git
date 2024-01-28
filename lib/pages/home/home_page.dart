import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:krl_goon/colors.dart';
import 'package:krl_goon/pages/home/profile/profile_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            children: [
              ClipPath(
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
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        SvgPicture.asset('assets/svgs/isiSaldo-icon.svg'),
                        const SizedBox(width: 5),
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
                        const SizedBox(width: 5),
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
                        IconButton(
                            onPressed: () => Get.to(const ProfilePage()),
                            icon: SvgPicture.asset(
                                'assets/svgs/profile-icon.svg')),
                      ],
                    ),
                    const SizedBox(height: 8),
                    SizedBox(
                      width: 255,
                      child: Text(
                        'Selamat Datang,',
                        style: GoogleFonts.poppins(
                          color: whiteColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 255,
                      child: Text(
                        'Pilihlah rute perjalanan Anda dan pesan tiket dengan mudah...',
                        style: GoogleFonts.poppins(
                          color: whiteColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Stack(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: 125,
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
                           child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: [
                          Image.asset("assets/images/iklan-home.png"),
                          Image.asset("assets/images/iklan-home.png"),
                          Image.asset("assets/images/iklan-home.png"),

                        ]),
                        ),
                       
                      ],
                    ),
                    const SizedBox(height: 20),
                    Stack(
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
                              Column(
                                children: [
                                  SvgPicture.asset("assets/svgs/rute-icon.svg"),
                                  const SizedBox(height: 6),
                                  Text(
                                    "Rute",
                                    style: GoogleFonts.poppins(
                                      color: blackColor,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  SvgPicture.asset(
                                      "assets/svgs/isiSaldo-icon.svg"),
                                  const SizedBox(height: 6),
                                  Text(
                                    "Isi Saldo",
                                    style: GoogleFonts.poppins(
                                      color: blackColor,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  SvgPicture.asset(
                                      "assets/svgs/riwayat-icon.svg"),
                                  const SizedBox(height: 6),
                                  Text(
                                    "Riwayat",
                                    style: GoogleFonts.poppins(
                                      color: blackColor,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  SvgPicture.asset(
                                      "assets/svgs/bantuan-icon.svg"),
                                  const SizedBox(height: 6),
                                  Text(
                                    "Bantuan",
                                    style: GoogleFonts.poppins(
                                      color: blackColor,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.grey[300],
        onPressed: () {},
        child: SvgPicture.asset("assets/svgs/tiket-icon.svg"),
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
