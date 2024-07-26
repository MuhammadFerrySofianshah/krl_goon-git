import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:krl_goon/pages/home/home_page.dart';
import 'package:krl_goon/pages/phone-number/auth_phone_number.dart';
import 'package:krl_goon/widgets/widget.dart';
import 'package:pinput/pinput.dart';

class OTPPage extends StatefulWidget {
  final String vPhoneNumber;
  String vVerificationId = "";
  final int? vResendToken;

  OTPPage({
    Key? key,
    required this.vPhoneNumber,
    required this.vVerificationId,
    required this.vResendToken,
  }) : super(key: key);

  @override
  State<OTPPage> createState() => _OTPPageState();
}

class _OTPPageState extends State<OTPPage> {
  TextEditingController otpController = TextEditingController();
  late Timer vResendTimer;
  int vResendSeconds = 60;
  bool vCanResend = false;

  @override
  void initState() {
    super.initState();
    startResendTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _appBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                wSizedBoxHeight(10),
                wText('Kode OTP telah terkirim ke nomor:', Colors.black, 18, FontWeight.normal),
                _phoneNumber(),
                wSizedBoxHeight(30),
                _inputOTP(),
                wSizedBoxHeight(40),
                _resendOTP(),
                const Spacer(),
                wButtonBottom(
                  context,
                  'Send',
                  () async {
                    await verifyOtp(context);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  AppBar _appBar() {
    return AppBar(
      automaticallyImplyLeading: false,
      elevation: 0,
      backgroundColor: Colors.white,
      centerTitle: true,
      title: RichText(
        text: TextSpan(
          text: 'KRL',
          style: GoogleFonts.openSans(
            color: Colors.black,
            fontSize: 22,
            fontWeight: FontWeight.w700,
          ),
          children: [
            TextSpan(
              text: 'GoOn',
              style: GoogleFonts.openSans(
                color: Colors.amber,
                fontSize: 24,
                fontWeight: FontWeight.w800,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Row _phoneNumber() {
    return Row(
      children: [
        wText("+62${widget.vPhoneNumber}", Colors.black, 20, FontWeight.w600),
        wSizedBoxWidth(10),
        GestureDetector(
          onTap: () => Get.back(),
          child: wText('Ganti', Colors.amber, 20, FontWeight.normal),
        ),
      ],
    );
  }

  Center _inputOTP() {
    return Center(
      child: Pinput(
        controller: otpController,
        length: 6,
        defaultPinTheme: PinTheme(
          width: 60,
          height: 60,
          textStyle: GoogleFonts.poppins(
            fontSize: 22,
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
          decoration: BoxDecoration(
            color: Colors.white,
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
    );
  }

  Center _resendOTP() {
    return Center(
      child: GestureDetector(
        onTap: () => resendOtp(),
        child: wText('Kirim Ulang (${vResendSeconds}s)', vCanResend ? Colors.black : Colors.grey, 18, FontWeight.bold),
      ),
    );
  }

  Future<void> verifyOtp(BuildContext context) async {
    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: widget.vVerificationId,
        smsCode: otpController.text,
      );
      await FirebaseAuth.instance.signInWithCredential(credential);

      Get.to(const HomePage());
    } on FirebaseAuthException {
      errorMessage(context, 'Code OTP salah.');
    }
  }

  void startResendTimer() {
    vCanResend = false;
    vResendTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (vResendSeconds == 0) {
        setState(() {
          vCanResend = true;
        });
        vResendTimer.cancel();
      } else {
        setState(() {
          vResendSeconds--;
        });
      }
    });
  }

  void resendOtp() async {
    if (vCanResend) {
      try {
        await FirebaseAuth.instance.verifyPhoneNumber(
          phoneNumber: '+62${widget.vPhoneNumber}',
          verificationCompleted: (PhoneAuthCredential credential) async {
            await FirebaseAuth.instance.signInWithCredential(credential);
          },
          verificationFailed: (FirebaseAuthException e) {},
          codeSent: (String vVerificationId, int? resendToken) async {
            setState(() {
              vCanResend = false;
              vResendSeconds = 60;
            });
            startResendTimer();
            widget.vVerificationId = vVerificationId;
          },
          codeAutoRetrievalTimeout: (String vVerificationId) {},
          timeout: const Duration(seconds: 60),
          forceResendingToken: widget.vResendToken,
        );
      } catch (e) {}
    }
  }

  @override
  void dispose() {
    vResendTimer.cancel();
    super.dispose();
  }
}
