import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:krl_goon/colors.dart';
import 'package:krl_goon/providers/auth_provider.dart';
import 'package:krl_goon/screens/customer/daftar_with_phone_number.dart';
import 'package:krl_goon/screens/customer/login_customer.dart';
import 'package:krl_goon/widgets/textfield_confirmPassword_widget.dart';
import 'package:krl_goon/widgets/textfield_email_widget.dart';
import 'package:krl_goon/widgets/textfield_namalengkap_widget.dart';
import 'package:krl_goon/widgets/textfield_password_widget.dart';
import 'package:provider/provider.dart';

class DaftarCustomer extends StatefulWidget {
  const DaftarCustomer({super.key});
  @override
  _DaftarCustomerState createState() => _DaftarCustomerState();
}

class _DaftarCustomerState extends State<DaftarCustomer> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
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
                      loadAuth.isLogin ? "LOGIN" : "DAFTAR",
                      style: GoogleFonts.poppins(
                        color: blackColor,
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      loadAuth.isLogin
                          ? "Pastikan Anda telah melakukan pendaftaran akun."
                          : "Pastikan Anda mengisi kolom dengan benar untuk menghindari kesalahan saat melakukan login.",
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
                key: loadAuth.formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
// Nama Lengkap
                    if (!loadAuth.isLogin)
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
                    if (!loadAuth.isLogin)
                      TextfieldConfirmPasswordWidget(
                          controller: passwordController),
                    const SizedBox(height: 9),
// Lupa Password
                    const SizedBox(
                      height: 10,
                    ),
                    if (loadAuth.isLogin)
                      GestureDetector(
                          onTap: () {},
                          child: Text(
                            "Lupa Password ?",
                            style: GoogleFonts.poppins(
                              fontSize: 16,
                              color: blackColor,
                            ),
                            textAlign: TextAlign.start,
                          )),
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
                                loadAuth.submit(context);
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
                                loadAuth.isLogin ? "LOGIN" : "DAFTAR",
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
                                      loadAuth.isLogin
                                          ? "SIGN IN WITH PHONE NUMBER"
                                          : "SIGN UP WITH PHONE NUMBER",
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
                                      loadAuth.isLogin
                                          ? "SIGN IN WITH GOOGLE"
                                          : "SIGN UP WITH GOOGLE",
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
                                    loadAuth.isLogin
                                        ? 'Belum Memiliki Akun ? '
                                        : 'Sudah Memiliki Akun ? ',
                                    style: GoogleFonts.poppins(
                                      fontSize: 16,
                                      color: blackColor,
                                    )),
                                GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        loadAuth.isLogin = !loadAuth.isLogin;
                                      });
                                    },
                                    child: Text(
                                      loadAuth.isLogin ? "Sign up" : "Log in",
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
