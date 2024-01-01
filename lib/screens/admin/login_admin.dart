import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:krl_goon/colors.dart';

class LoginAdmin extends StatelessWidget {
  const LoginAdmin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Anda Sebagai Admin",
                style: GoogleFonts.poppins(
                    fontSize: 20,
                    color: blackColor,
                    fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 70),

              Image.asset('assets/images/logo-krl.png'),
              const SizedBox(height: 48),

              // login
              Container(
                height: 56,
                width: 284,
                decoration: BoxDecoration(
                  border: Border.all(color: blackColor, width: 3),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Center(
                  child: Text(
                    "Login",
                    style: GoogleFonts.poppins(
                      fontSize: 18,
                      color: blackColor,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 8),
              // Register
              Container(
                height: 56,
                width: 284,
                decoration: BoxDecoration(
                  color: yellowColor,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Center(
                  child: Text(
                    "Register",
                    style: GoogleFonts.poppins(
                      fontSize: 18,
                      color: blackColor,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
