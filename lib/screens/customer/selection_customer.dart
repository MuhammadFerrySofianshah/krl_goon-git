import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:krl_goon/colors.dart';
import 'package:krl_goon/screens/customer/daftar_customer.dart';

class SelectionCustomer extends StatelessWidget {
  const SelectionCustomer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Anda Sebagai Customer",
                  style: GoogleFonts.poppins(
                    fontSize: 22,
                    color: blackColor,
                    fontWeight: FontWeight.bold
                  ),
                ),
                const SizedBox(height: 70),
      
                Image.asset('assets/images/logo-krl.png'),
                const SizedBox(height: 48),
      
                // login
                Container(
                  height: 40,
                  width: MediaQuery.of(context).size.width / 1.3,
                  decoration: BoxDecoration(
                    border: Border.all(color: blackColor, width: 3),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Center(
                    child: Text(
                      "Login",
                      style: GoogleFonts.poppins(
                          fontSize: 16,
                          color: blackColor,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const DaftarCustomer(),
                      ),
                    );
                  },
                  // Register
                  child: Container(
                    height: 40,
                    width: MediaQuery.of(context).size.width / 1.3,
                    decoration: BoxDecoration(
                      color: yellowColor,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Center(
                      child: Text(
                        "Register",
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          color: blackColor,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
