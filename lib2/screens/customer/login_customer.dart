import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:krl_goon/colors.dart';
import 'package:krl_goon/providers/auth_provider.dart';
import 'package:krl_goon/screens/customer/daftar_customer.dart';
import 'package:krl_goon/widgets/textfield_email_widget.dart';
import 'package:krl_goon/widgets/textfield_password_widget.dart';
import 'package:provider/provider.dart';

class LoginCustomer extends StatefulWidget {
  const LoginCustomer({super.key});
  @override
  _LoginCustomerState createState() => _LoginCustomerState();
}

class _LoginCustomerState extends State<LoginCustomer> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var loadAuth = Provider.of<AuthProvider>(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Column(
                  children: [
                    Text(
                      "Login Akun",
                      style: GoogleFonts.poppins(
                        color: blackColor,
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 14),
//                     Form(
//                       key: loadAuth.formKey,
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
// // NO HANDPHONE
//                           // Text(
//                           //   "No.Handphone",
//                           //   style: GoogleFonts.poppins(
//                           //     color: blackColor,
//                           //     fontSize: 12,
//                           //     fontWeight: FontWeight.w500,
//                           //   ),
//                           // ),
//                           // const SizedBox(height: 3),
//                           // TextFormField(
//                           //   controller: null,
//                           //   decoration: InputDecoration(
//                           //       border: OutlineInputBorder(
//                           //         borderRadius: BorderRadius.circular(10),
//                           //       ),
//                           //       focusedBorder: OutlineInputBorder(
//                           //         borderSide: BorderSide(color: yellowColor),
//                           //         borderRadius: BorderRadius.circular(10),
//                           //       ),
//                           //       hintText: "Masukan No.Handphone Anda",
//                           //       //warna bg
//                           //       filled: true,
//                           //       fillColor: const Color(0xff121931).withOpacity(.08)),
//                           //   validator: (value) {
//                           //     if (value == null || value.isEmpty) {
//                           //       return 'Masukkan No.Handphone Anda';
//                           //     }
//                           //     return null;
//                           //   },
//                           // ),
//                           const SizedBox(height: 9),
// // EMAIL
//                           TextfieldEmailWidget(controller: emailController),
//                           const SizedBox(height: 9),
// // PASSWORD
//                           TextfieldPasswordWidget(
//                               controller: passwordController),
//                           const SizedBox(
//                             height: 21,
//                           ),
// // button submit
//                           SizedBox(
//                             width: MediaQuery.of(context).size.width,
//                             child: Center(
//                               child: Column(
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 children: [
//                                   ElevatedButton(
//                                     onPressed: () {
//                                       loadAuth.submit();
//                                     },
//                                     style: ButtonStyle(
//                                       backgroundColor:
//                                           MaterialStateProperty.all(
//                                         const Color(0xffFFC500),
//                                       ),
//                                       foregroundColor:
//                                           MaterialStateProperty.all(
//                                         const Color(0xff000000),
//                                       ),
//                                       fixedSize: MaterialStateProperty.all(
//                                           const Size(266, 50)),
//                                       shape: MaterialStateProperty.all<
//                                           RoundedRectangleBorder>(
//                                         RoundedRectangleBorder(
//                                           borderRadius: BorderRadius.circular(
//                                               10.0), // Radius tombol
//                                         ),
//                                       ),
//                                     ),
//                                     child: Text(
//                                       "MASUK",
//                                       style: GoogleFonts.poppins(
//                                         color: blackColor,
//                                         fontSize: 16,
//                                         fontWeight: FontWeight.w500,
//                                       ),
//                                     ),
//                                   ),
//                                   const SizedBox(
//                                     height: 14,
//                                   ),
//                                   // sign in google
//                                   SizedBox(
//                                     width:
//                                         MediaQuery.of(context).size.width / 1.3,
//                                     child: ElevatedButton(
//                                       onPressed: () {},
//                                       style: ButtonStyle(
//                                         backgroundColor:
//                                             MaterialStateProperty.all(
//                                           const Color(0XFFFFFFFF),
//                                         ),
//                                         foregroundColor:
//                                             MaterialStateProperty.all(
//                                           const Color(0xffFFC500),
//                                         ),
//                                         fixedSize: MaterialStateProperty.all(
//                                             const Size(266, 50)),
//                                         shape: MaterialStateProperty.all<
//                                             RoundedRectangleBorder>(
//                                           RoundedRectangleBorder(
//                                             borderRadius: BorderRadius.circular(
//                                                 10.0), // Radius tombol
//                                           ),
//                                         ),
//                                       ),
//                                       child: Row(
//                                         mainAxisAlignment:
//                                             MainAxisAlignment.center,
//                                         children: [
//                                           Image.asset(
//                                               'assets/images/google.png'),
//                                           const SizedBox(
//                                             width: 11,
//                                           ),
//                                           Text(
//                                             "SIGN IN WITH GOOGLE",
//                                             style: GoogleFonts.poppins(
//                                               color: yellowColor,
//                                               fontSize: 16,
//                                               fontWeight: FontWeight.w500,
//                                             ),
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                   ),
//                                   const SizedBox(
//                                     height: 12,
//                                     // sudah memiliki akun?
//                                   ),
//                                   Row(
//                                     mainAxisAlignment: MainAxisAlignment.center,
//                                     children: [
//                                       Text('Belum Memiliki Akun? ',
//                                           style: GoogleFonts.poppins(
//                                             fontSize: 16,
//                                             color: blackColor,
//                                           )),
//                                       TextButton(
//                                           onPressed: () {
//                                             Navigator.push(
//                                                 context,
//                                                 MaterialPageRoute(
//                                                     builder: (context) =>
//                                                         const DaftarCustomer()));
//                                           },
//                                           child: Text(
//                                             "Daftar",
//                                             style: GoogleFonts.poppins(
//                                               fontSize: 16,
//                                               color: yellowColor,
//                                             ),
//                                           ))
//                                     ],
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
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
