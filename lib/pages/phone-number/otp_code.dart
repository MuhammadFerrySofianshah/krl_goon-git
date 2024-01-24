import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:krl_goon/colors.dart';
import 'package:krl_goon/pages/home/home_page.dart';
import 'package:krl_goon/pages/phone-number/auth_phone_number.dart';
import 'package:pinput/pinput.dart';

class OTPPage extends StatefulWidget {
  final String phoneNumber;
  final String verificationId;
  const OTPPage({
    Key? key,
    required this.phoneNumber,
    required this.verificationId,
  }) : super(key: key);

  @override
  State<OTPPage> createState() => _OTPPageState();
}

class _OTPPageState extends State<OTPPage> {
  TextEditingController otpController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  late Timer _resendTimer;
  int _resendSeconds = 60;
  bool _canResend = false;

  @override
  void initState() {
    super.initState();
    startResendTimer();
    phoneController = AuthPhoneNumberState.getPhoneController();
  }

  @override
  Widget build(BuildContext context) {
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
                    const SizedBox(height: 10),
                    // TEXT KODE OTP TELAH TERKIRIM
                    Text(
                      'Kode OTP telah terkirim ke nomor:',
                      style: GoogleFonts.poppins(
                        color: blackColor,
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          "+62${widget.phoneNumber}",
                          style: GoogleFonts.poppins(
                            color: blackColor,
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(width: 10),
                        GestureDetector(
                          onTap: () => Get.off(const AuthPhoneNumber()),
                          child: Text(
                            "Ganti",
                            style: GoogleFonts.poppins(
                              fontSize: 20,
                              fontWeight: FontWeight.normal,
                              color: yellowColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 30),

                    // FORM CODE OTP
                    Center(
                      child: Pinput(
                        controller: otpController,
                        length: 6,
                        defaultPinTheme: PinTheme(
                          width: 60,
                          height: 60,
                          textStyle: GoogleFonts.poppins(
                            fontSize: 22,
                            color: blackColor,
                            fontWeight: FontWeight.w600,
                          ),
                          decoration: BoxDecoration(
                            color: bgColor,
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(8),
                            boxShadow: const [
                              BoxShadow(
                                color: Color(0xffc8c8c8),
                                blurRadius: 10,
                                offset: Offset(0, 4),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 40),
                    // TEXT KIRIM ULANG
                    Center(
                      child: GestureDetector(
                        onTap: () => resendOtp(),
                        child: Text(
                          'Kirim Ulang (${_resendSeconds}s)',
                          style: GoogleFonts.poppins(
                            color: _canResend ? blackColor : Colors.grey,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
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
                await verifyOtp();
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
                      offset: Offset(4, 6),
                    ),
                  ],
                  border: Border.all(color: Colors.black.withOpacity(0.13)),
                ),
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

  Future<void> verifyOtp() async {
    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: widget.verificationId,
        smsCode: otpController.text,
      );

      await FirebaseAuth.instance.signInWithCredential(credential);

      Get.to(const HomePage());
    } on FirebaseAuthException catch (e) {
      print(e.message.toString());
      errorMessage(context, 'Code OTP Salah!');
      startResendTimer();
    }
  }

  // Fungsi untuk mengatur dan memulai ulang timer
  void startResendTimer() {
    _canResend = false;
    _resendTimer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_resendSeconds == 0) {
        // Waktu ulang habis, izinkan pengguna mengirim ulang
        setState(() {
          _canResend = true;
        });
        _resendTimer.cancel(); // Hentikan timer
      } else {
        // Kurangi waktu ulang setiap detik
        setState(() {
          _resendSeconds--;
        });
      }
    });
  }

  // Fungsi untuk mengirim ulang OTP
  void resendOtp() async {
    if (_canResend) {
      await Auth().submitWithPhoneNumber(
        context,
        phoneController.text,
      );
      setState(() {
        _canResend = false;
        _resendSeconds = 60;
      });
      startResendTimer();
    }
  }

  @override
  void dispose() {
    // Pastikan untuk membatalkan timer saat widget di-dispose
    _resendTimer.cancel();
    super.dispose();
  }
}
class AuthPhoneNumberState extends State<AuthPhoneNumber> {
  static TextEditingController phoneController = TextEditingController();

  // ...

  static TextEditingController getPhoneController() {
    return phoneController;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}

