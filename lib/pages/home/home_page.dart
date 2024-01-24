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
      //  IconButton(
      //         onPressed: () {
      //           FirebaseAuth.instance.signOut();
      //         },
      //         icon: const Icon(Icons.logout))
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
                        SvgPicture.asset('assets/svgs/card-uang.svg'),
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
                          icon: SvgPicture.asset('assets/svgs/profile.svg')),
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
                    Container(
                      width: 335,
                      height: 125,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        gradient: const LinearGradient(
                            colors: [Color(0xffececec), Color(0xffDDDDDD)],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight),
                      ),
                    ),
                  ],
                ),
              ),
            ],
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
