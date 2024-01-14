import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:krl_goon/colors.dart';
import 'package:krl_goon/providers/auth_provider.dart';
import 'package:krl_goon/pages/phone-number/daftar_with_phone_number.dart';
import 'package:krl_goon/pages/login_page.dart';
import 'package:krl_goon/widgets/textfield_confirmPassword_widget.dart';
import 'package:krl_goon/widgets/textfield_email_widget.dart';
import 'package:krl_goon/widgets/textfield_namalengkap_widget.dart';
import 'package:krl_goon/widgets/textfield_password_widget.dart';
import 'package:provider/provider.dart';

class DaftarPage extends StatefulWidget {
  const DaftarPage({super.key});
  @override
  _DaftarPageState createState() => _DaftarPageState();
}

class _DaftarPageState extends State<DaftarPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  final TextEditingController namaLengkapController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var loadAuth = Provider.of<AuthProvider>(context);
    return Scaffold(
      backgroundColor: bgColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 22),
          child: Column(
            children: [
              Center(
                child: Column(
                  children: [
                    Text(
                      "DAFTAR",
                      style: GoogleFonts.poppins(
                        color: blackColor,
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
"Pastikan Anda mengisi kolom dengan benar untuk menghindari kesalahan saat melakukan login.",
                      style: GoogleFonts.poppins(
                        color: blackColor,
                        fontSize: 14,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Form(
                // key: formKey.formKeyDaftar,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
// Nama Lengkap
                      TexttFieldNamaLengkapWidget(
                          controller: namaLengkapController),
                    const SizedBox(height: 9),
// Email
                    TextfieldEmailWidget(controller: emailController),
                    const SizedBox(height: 9),
// Password
                    TextfieldPasswordWidget(controller: passwordController),
                    const SizedBox(height: 9),
// Ulangi - Password
                      TextfieldConfirmPasswordWidget(
                          controller: confirmPasswordController),
                    const SizedBox(
                      height: 21,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
// Button Submit
                            ElevatedButton(
                              onPressed: () {
                                loadAuth.signupSubmit(emailController.text,passwordController.text, context);
                              },
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                  const Color(0xffFFC500),
                                ),
                                foregroundColor: MaterialStateProperty.all(
                                  const Color(0xff000000),
                                ),
                                fixedSize: MaterialStateProperty.all(
                                    const Size(266, 50)),
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                        10.0), // Radius tombol
                                  ),
                                ),
                              ),
                              child: Text(
                                "DAFTAR",
                                style: GoogleFonts.poppins(
                                  color: blackColor,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
// Sign up phone number
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 1.3,
                              child: ElevatedButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const DaftarWithPhoneNumber()));
                                },
                                style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                    const Color(0XFF28a745),
                                  ),
                                  foregroundColor: MaterialStateProperty.all(
                                    const Color(0xffffffff),
                                  ),
                                  fixedSize: MaterialStateProperty.all(
                                      const Size(266, 50)),
                                  shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(
                                          10.0), // Radius tombol
                                    ),
                                  ),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                          "SIGN UP WITH PHONE NUMBER",
                                      style: GoogleFonts.poppins(
                                        color: whiteColor,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 14,
                            ),
// Sign up/in google
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 1.3,
                              child: ElevatedButton(
                                onPressed: () {},
                                style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                    const Color(0XFFFFFFFF),
                                  ),
                                  foregroundColor: MaterialStateProperty.all(
                                    const Color(0xffFFC500),
                                  ),
                                  fixedSize: MaterialStateProperty.all(
                                      const Size(266, 50)),
                                  shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(
                                          10.0), // Radius tombol
                                    ),
                                  ),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset('assets/images/google.png'),
                                    const SizedBox(
                                      width: 11,
                                    ),
                                    Text(
                                          "SIGN UP WITH GOOGLE",
                                      style: GoogleFonts.poppins(
                                        color: yellowColor,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),

                            const SizedBox(
                              height: 50,
                            ),
// Sudah memiliki akun?
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
'Sudah Memiliki Akun ? ',
                                    style: GoogleFonts.poppins(
                                      fontSize: 16,
                                      color: blackColor,
                                    )),
                                GestureDetector(
                                    onTap: ()=> Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                LoginPage())),
                                    child: Text(
"Log in",
                                      style: GoogleFonts.poppins(
                                        fontSize: 16,
                                        color: yellowColor,
                                      ),
                                      textAlign: TextAlign.start,
                                    )),
                              ],
                            ),
                          ],
                        ),
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
