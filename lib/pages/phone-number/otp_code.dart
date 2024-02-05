import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
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
                    const SizedBox(height: 10),
                    Text(
                      'Kode OTP telah terkirim ke nomor:',
                      style: GoogleFonts.poppins(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          "+62${widget.phoneNumber}",
                          style: GoogleFonts.poppins(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(width: 10),
                        GestureDetector(
                          onTap: () => Get.back(),
                          child: Text(
                            "Ganti",
                            style: GoogleFonts.poppins(
                              fontSize: 20,
                              fontWeight: FontWeight.normal,
                              color: Colors.amber,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 30),
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
                    const SizedBox(height: 40),
                    Center(
                      child: GestureDetector(
                        onTap: () => resendOtp(),
                        child: Text(
                          'Kirim Ulang (${_resendSeconds}s)',
                          style: GoogleFonts.poppins(
                            color: _canResend ? Colors.black : Colors.grey,
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
                    "Send",
                    style: GoogleFonts.poppins(
                      color: Colors.white,
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

      Get.back();
    } on FirebaseAuthException catch (e) {
      print(e.message.toString());
      // Handle error case
    }
  }

  void startResendTimer() {
    _canResend = false;
    _resendTimer = Timer.periodic(Duration(seconds: 1), (timer) {
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
            print('Auto retrieval timeout. Manually handle the timeout if needed.');
          },
          timeout: Duration(seconds: 60),
          forceResendingToken: widget.verificationId.isNotEmpty
              ? widget.resendToken
              : null,
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
