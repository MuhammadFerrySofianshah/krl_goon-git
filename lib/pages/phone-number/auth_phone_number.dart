import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:krl_goon/pages/phone-number/otp_code.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../colors.dart';

class AuthPhoneNumber extends StatefulWidget {
  const AuthPhoneNumber({Key? key}) : super(key: key);

  @override
  AuthPhoneNumberState createState() => AuthPhoneNumberState();
}

final _formKey1 = GlobalKey<FormState>();

class AuthPhoneNumberState extends State<AuthPhoneNumber> {
  TextEditingController phoneController = TextEditingController();
  bool isPhoneValid = false;

  @override
// Perbarui keadaan widget berdasarkan panjang teks pada phoneController.
  void initState() {
    super.initState();
    phoneController.addListener(() {
      setState(() {
        isPhoneValid = phoneController.text.length > 9;
      });
    });
  }

  Widget build(BuildContext context) {
    phoneController.selection = TextSelection.fromPosition(
        TextPosition(offset: phoneController.text.length));
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: bgColor,
        centerTitle: true,
        title: RichText(
          text: TextSpan(
            text: 'KRL',
            style: GoogleFonts.openSans(
              color: blackColor,
              fontSize: 22,
              fontWeight: FontWeight.w700,
            ),
            children: [
              TextSpan(
                text: 'GoOn',
                style: GoogleFonts.openSans(
                  color: yellowColor,
                  fontSize: 24,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // TEXT SELAMAT DATANG
                    Text(
                      'Selamat Datang,',
                      style: GoogleFonts.poppins(
                        color: blackColor,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    RichText(
                      text: TextSpan(
                        text: 'Masukkan ',
                        style: GoogleFonts.poppins(
                          color: blackColor,
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                        ),
                        children: [
                          TextSpan(
                            text: 'nomor Hp',
                            style: GoogleFonts.poppins(
                              color: blackColor,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          TextSpan(
                            text: ' Kamu.',
                            style: GoogleFonts.poppins(
                              color: blackColor,
                              fontSize: 16,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),

                    // FORM PHONE NUMBER
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 25, vertical: 5),
                      decoration: BoxDecoration(
                          color: bgColor,
                          boxShadow: const [
                            BoxShadow(
                                color: Color(0xffc8c8c8),
                                blurRadius: 10,
                                offset: Offset(0, 4)),
                          ],
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                              color: Colors.black.withOpacity(0.13))),
                      child: Stack(
                        children: [
                          // INTERNATIONAL PHONE NUMBER
                          InternationalPhoneNumberInput(
                            countries: const ['ID'],
                            maxLength: 13,
                            textFieldController: phoneController,
                            onInputChanged: (PhoneNumber phoneNumber) {
                              // Callback ketika nomor telepon berubah
                              print(phoneNumber.phoneNumber);
                            },
                            onInputValidated: (bool value) {
                              // Callback ketika validasi nomor telepon berubah
                              print(value);
                            },
                            formatInput: false,
                            selectorConfig: const SelectorConfig(
                              showFlags: true,
                              leadingPadding: 0,
                              setSelectorButtonAsPrefixIcon: true,
                              selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
                            ),
                            autoValidateMode: AutovalidateMode.disabled,
                            selectorTextStyle: TextStyle(
                                color: blackColor,
                                fontWeight: FontWeight.w500,
                                fontSize: 20),
                            inputDecoration: InputDecoration(
                              focusColor: Colors.black,
                              contentPadding: const EdgeInsets.only(bottom: 3),
                              hintText: '81234567890',
                              hintStyle: TextStyle(
                                  color: Colors.grey.shade500,
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold),
                              border: InputBorder.none,
                              // Ketika angka lebih dari 9
                              suffixIcon: isPhoneValid
                                  ? Container(
                                      width: 30,
                                      height: 30,
                                      margin: const EdgeInsets.all(10),
                                      decoration: const BoxDecoration(
                                          color: Colors.green,
                                          shape: BoxShape.circle),
                                      child: const Icon(
                                        Icons.done,
                                        color: Colors.white,
                                        size: 20,
                                      ),
                                    )
                                  : const SizedBox(),
                            ),
                            cursorColor: blackColor,
                            textStyle: TextStyle(
                              color: blackColor,
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Positioned(
                            left: 92,
                            top: 13,
                            child: Container(
                              width: 2,
                              height: 24,
                              color: Colors.black.withOpacity(0.13),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 25),

                    // TEXT MENYETUJUI
                    RichText(
                      text: TextSpan(
                        text: 'Dengan melanjutkan, kamu ',
                        style: GoogleFonts.poppins(
                          color: blackColor,
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                        ),
                        children: [
                          TextSpan(
                            text: 'menyetujui Syarat, Ketentuan, ',
                            style: GoogleFonts.poppins(
                              color: blackColor,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          TextSpan(
                            text: 'dan',
                            style: GoogleFonts.poppins(
                              color: blackColor,
                              fontSize: 16,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          TextSpan(
                            text: ' Kebijakan Privasi Kami.',
                            style: GoogleFonts.poppins(
                              color: blackColor,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
// BUTTON LANJUT
            const Spacer(),
            InkWell(
              onTap: () async {
                if (isPhoneValid) {
                  await Auth().submitWithPhoneNumber(
                    context,
                    phoneController.text,
                  );
                } else {
                  errorMessage(
                      context, 'Nomor HP harus terdiri dari minimal 9 angka.');
                }
              },
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
                  child: Text(
                    "Lanjut",
                    style: GoogleFonts.poppins(
                      color: whiteColor,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// BACKEND
class Auth {
  var isLogin = true;
  final formKey = GlobalKey<FormState>();

  Future<void> submitWithPhoneNumber(context, String phoneNumber) async {
    try {
//  NOTIFIKASI COY
      showDialog(
        context: context,
        builder: (context) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              LoadingAnimationWidget.hexagonDots(color: Colors.white, size: 50),
              const SizedBox(height: 15),
              const Text(
                'Mengirim kode OTP...',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.normal,
                    decoration: TextDecoration.none),
              ),
            ],
          );
        },
      );

// VERIFIKASI NOMOR TELP
      if (FirebaseAuth.instance.currentUser == null) {
        await FirebaseAuth.instance.verifyPhoneNumber(
          phoneNumber: '+62$phoneNumber',
          verificationCompleted: (credential) async {
            await FirebaseAuth.instance.signInWithCredential(credential);
          },
          verificationFailed: (exception) {
            errorMessage(context, 'Masukkan No.HP dengan benar!');
          },
          codeSent: (verificationId, resendCode) async {
            Get.to(
              OTPPage(phoneNumber: phoneNumber, verificationId: verificationId,resendToken: resendCode),
            );
          },
          timeout: const Duration(seconds: 60),
          codeAutoRetrievalTimeout: (String verificationId) {
            verificationId = verificationId;
          },
          
        );
      } else {
        await FirebaseAuth.instance.signOut();
      }
    } catch (e) {
      return;
    }
  }
}

// Notifikasi Dialog
void errorMessage(BuildContext context, String message) {
  showDialog(
// Menghilangkan kemampuan menutup dialog dengan tap di luar dialog
    barrierDismissible: false,
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text(
          'Error',
          style: TextStyle(
            fontSize: 20,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
        content: Text(
          message,
          style: const TextStyle(
            fontSize: 18,
            color: Colors.black,
            fontWeight: FontWeight.normal,
          ),
          textAlign: TextAlign.center,
        ),
        actionsAlignment: MainAxisAlignment.center,
        actions: [
          InkWell(
            onTap: () => Navigator.pop(context),
            child: Container(
              height: 40,
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.symmetric(horizontal: 10),
              color: Colors.red,
              child: const Center(
                child: Text(
                  'OK',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ),
          ),
        ],
      );
    },
  );
}
