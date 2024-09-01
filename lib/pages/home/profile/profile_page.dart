import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:krl_goon/colors.dart';
import 'package:krl_goon/pages/phone-number/auth_phone_number.dart';
import 'package:krl_goon/widgets/widget.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: bgColor,
        appBar: AppBar(
          backgroundColor: yellowColor,
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: textWidget(
            'Akun Saya',
            whiteColor,
            18,
            FontWeight.w500,
          ),
          actions: [
            IconButton(
                onPressed: () async {
                  bool confirmLogout = await showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: textWidget(
                          'Confirm Logout',
                          blackColor,
                          16,
                          FontWeight.w600,
                        ),
                        content: textWidget(
                          'Apakah Anda yakin ingin Logout?',
                          blackColor,
                          14,
                          FontWeight.normal,
                        ),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.of(context).pop(false),
                            child: textWidget(
                              'Batal', 
                              blackColor,
                              14,
                              FontWeight.w500,
                            ),
                          ),
                          TextButton(
                            onPressed: () => Navigator.of(context).pop(true),
                            child: textWidget(
                              'Logout',
                              blackColor,
                              14,
                              FontWeight.w500,
                            ),
                          )
                        ],
                      );
                    },
                  );
                  if (confirmLogout == true) {
                    Get.off(const AuthPhoneNumber());
                  }
                },
                icon: Icon(Icons.logout,color: whiteColor,))
          ],
        ),
        body: SafeArea(
            child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Stack(children: [
                  Image.asset('assets/images/profile.png'),
                  Positioned(
                    top: 100,
                    left: 110,
                    child: Stack(children: [
                      Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                            color: yellowColor,
                            borderRadius: BorderRadius.circular(500)),
                      ),
                      Positioned(
                          left: 8,
                          top: 8,
                          child: Icon(
                            Icons.camera_alt,
                            weight: 20,
                            color: whiteColor,
                          ))
                    ]),
                  )
                ]),
                // Nama
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const Icon(
                        Icons.person,
                        weight: 50,
                        color: Color(0xff8596A0),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          textWidget('Nama', const Color(0xff8596A0), 16,
                              FontWeight.normal),
                          textWidget('Muhammad Ferry Sofianshah', blackColor, 18,
                              FontWeight.normal),
                        ],
                      ),
                      Icon(
                        Icons.edit,
                        weight: 20,
                        color: yellowColor,
                      ),
                    ],
                  ),
                ),
                const Divider(color: Color(0xffc4c4c4)),
                // Telp
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(left: 10, right: 25),
                        child: Icon(
                          Icons.phone,
                          weight: 50,
                          color: Color(0xff8596A0),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          textWidget('Telepon', const Color(0xff8596A0), 16,
                              FontWeight.normal),
                          textWidget('+62 896 8812 0962', blackColor, 18,
                              FontWeight.normal),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        )));
  }
}
