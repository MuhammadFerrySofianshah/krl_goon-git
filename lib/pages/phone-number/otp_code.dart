import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:krl_goon/pages/home/home_page.dart';
import 'package:krl_goon/pages/phone-number/auth_phone_number.dart';
import 'package:krl_goon/test.dart';
import 'package:krl_goon/widgets/widget.dart';
import 'package:pinput/pinput.dart';

class OTPPage extends StatefulWidget {
  final String phoneNumber;
  String verificationId = "";
  int? resendToken;

  OTPPage({
    Key? key,
    required this.phoneNumber,
    required this.verificationId,
    required this.resendToken,
  }) : super(key: key);

  @override
  State<OTPPage> createState() => _OTPPageState();
}

class _OTPPageState extends State<OTPPage> {
  TextEditingController otpController = TextEditingController();
  late Timer _resendTimer;
  int _resendSeconds = 60;
  bool _canResend = false;

  @override
  void initState() {
    super.initState();
    startResendTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
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
                    wSizedBoxHeight(10),
                    wText('Kode OTP telah terkirim ke nomor:', Colors.black, 18, FontWeight.normal),
                    Row(
                      children: [
                        wText( "+62${widget.phoneNumber}",  Colors.black, 20, FontWeight.w600),
                        wSizedBoxWidth(10),
                        GestureDetector(
                          onTap: () => Get.back(),
                          child:
                          wText('Ganti', Colors.amber, 20, FontWeight.normal)
                        ),
                      ],
                    ),
                    wSizedBoxHeight(30),
                    Center(
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
                    ),
                    wSizedBoxHeight(40),
                    Center(
                      child: GestureDetector(
                          onTap: () => resendOtp(),
                          child: wText(
                              'Kirim Ulang (${_resendSeconds}s)',
                              _canResend ? Colors.black : Colors.grey,
                              18,
                              FontWeight.bold)
                          ),
                    ),
                  ],
                ),
              ),
            ),
            const Spacer(),
            wButtonBottom(
              context,
              'Send',
              () async {
                await verifyOtp();
              },
            )
          ],
        ),
      ),
    );
  }

  /// BACKEND
// VERIFY OTP
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
      errorMessage(context, 'Code OTP salah.');
      // Handle error case
    }
  }

// TIMER
  void startResendTimer() {
    _canResend = false;
    _resendTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_resendSeconds == 0) {
        setState(() {
          _canResend = true;
        });
        _resendTimer.cancel();
      } else {
        setState(() {
          _resendSeconds--;
        });
      }
    });
  }

// RESEND OTP
  void resendOtp() async {
    if (_canResend) {
      try {
        await FirebaseAuth.instance.verifyPhoneNumber(
          phoneNumber: '+62${widget.phoneNumber}',
          verificationCompleted: (PhoneAuthCredential credential) async {
            await FirebaseAuth.instance.signInWithCredential(credential);
            print('Verification completed automatically: $credential');
          },
          verificationFailed: (FirebaseAuthException e) {
            print('Verification failed: ${e.message}');
          },
          codeSent: (String verificationId, int? resendToken) async {
            print('Resending OTP...');
            setState(() {
              _canResend = false;
              _resendSeconds = 60;
            });
            startResendTimer();
            widget.verificationId = verificationId;
          },
          codeAutoRetrievalTimeout: (String verificationId) {
            print(
                'Auto retrieval timeout. Manually handle the timeout if needed.');
          },
          timeout: const Duration(seconds: 60),
          forceResendingToken:
              widget.verificationId.isNotEmpty ? widget.resendToken : null,
        );
      } catch (e) {
        print('Error resending OTP: $e');
      }
    }
  }

  @override
  void dispose() {
    _resendTimer.cancel();
    super.dispose();
  }
}
