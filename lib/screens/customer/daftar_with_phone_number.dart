<<<<<<< HEAD
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:krl_goon/colors.dart';
import 'package:krl_goon/screens/home_screen.dart';

class DaftarWithPhoneNumber extends StatefulWidget {
  const DaftarWithPhoneNumber({Key? key}) : super(key: key);

  @override
  _DaftarWithPhoneNumberState createState() => _DaftarWithPhoneNumberState();
}

final _formKey1 = GlobalKey<FormState>();

class _DaftarWithPhoneNumberState extends State<DaftarWithPhoneNumber> {
  TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'SIGN IN WITH PHONE',
              style: GoogleFonts.poppins(
                fontSize: 22,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 15),
            Container(
              margin: const EdgeInsets.fromLTRB(30, 0, 30, 15),
              padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 15),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.only(top: 3, right: 2),
                    width: 40,
                    height: 35,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                    ),
                    child: Center(
                      child: Text(
                        "+62 ",
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          color: Colors.grey,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Form(
                      key: _formKey1,
                      child: TextFormField(
                        controller: phoneController,
                        keyboardType: TextInputType.phone,
                        cursorColor: Colors.green,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Input Phone Number...',
                        ),
                        validator: (String? value) {
                          return (value == null) ? 'Isi Field' : null;
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 150,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(Colors.green.shade900),
                ),
                onPressed: () async {
                  await Auth()
                      .submitWithPhoneNumber(context, phoneController.text);
                },
                child: Text(
                  "Masuk",
                  style: TextStyle(color: whiteColor),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// backend
class Auth {
  var isLogin = true;
  final formKey = GlobalKey<FormState>();

  Future<void> submitWithPhoneNumber(context, String phoneNumber) async {
    try {
      if (FirebaseAuth.instance.currentUser == null) {
        await FirebaseAuth.instance.verifyPhoneNumber(
          phoneNumber: '+62$phoneNumber',
          verificationCompleted: (credential) async {
            await FirebaseAuth.instance.signInWithCredential(credential);
          },
          verificationFailed: (exception) {
            showNotification(context, exception.message.toString());
          },
          codeSent: (verificationId, resendCode) async {
            String? smsCode = await askingSMSCode(context);
            if (smsCode != null) {
              PhoneAuthCredential credential = PhoneAuthProvider.credential(
                verificationId: verificationId,
                smsCode: smsCode,
              );
              try {
                await FirebaseAuth.instance.signInWithCredential(credential);
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => HomeScreen()),
                );
              } on FirebaseAuthException catch (e) {
                print(e.message.toString());
              }
            }
          },
          codeAutoRetrievalTimeout: (verificationId) {},
        );
      } else {
        await FirebaseAuth.instance.signOut();
      }
    } catch (e) {
      if (e is FirebaseAuthException) {
        if (e.code == 'email-already-in-use') {
          print('Email Telah digunakan');
        }
      }
    }
  }

  // Rest of the code remains the same...
  void showNotification(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: Colors.red, content: Text(message.toString())));
  }

  Future<String?> askingSMSCode(BuildContext context) async {
    return await showDialog<String>(
        context: context,
        builder: (_) {
          TextEditingController otpCode = TextEditingController();

          return SimpleDialog(
              title: const Text('Please enter the SMS code sent to you'),
              children: [
                Container(
                  margin: const EdgeInsets.fromLTRB(30, 0, 30, 15),
                  padding:
                      const EdgeInsets.symmetric(vertical: 0, horizontal: 15),
                  color: const Color.fromARGB(255, 240, 240, 240),
                  child: TextFormField(
                    controller: otpCode,
                    keyboardType: TextInputType.number,
                    cursorColor: Colors.green,
                    decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Input Code OTP...'),
                    validator: (value) {
                      if (value!.trim().isEmpty || value == "") {
                        return "Isi Code OTP terlebih dahulu.";
                      } else if (value.trim().length != 6) {
                        return "Input Code OTP 6 digit";
                      }
                      return null;
                    },
                  ),
                ),
                TextButton(
                    onPressed: () {
                      if (otpCode.text.isNotEmpty) {
                        Navigator.pop(context, otpCode.text);
                      } else {
                        print("OTP Belum Di Input");
                      }
                    },
                    child: Text('Confirm',
                        style: TextStyle(color: Colors.green.shade900)))
              ]);
        });
  }
}

// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:krl_goon/colors.dart';
// import 'package:krl_goon/widgets/textfield_no_hp.dart';
// import 'package:provider/provider.dart';

// class DaftarWithPhoneNumber extends StatefulWidget {
//   const DaftarWithPhoneNumber({super.key});

//   @override
//   State<DaftarWithPhoneNumber> createState() => _DaftarWithPhoneNumberState();
// }

// class _DaftarWithPhoneNumberState extends State<DaftarWithPhoneNumber> {
//   final TextEditingController phoneController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     var loadAuth = Provider.of<AuthProvider>(context);
//     return Scaffold(
//       body: SafeArea(
//         child: Center(
//           child: Padding(
//           padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 25),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 Text(
//                   loadAuth.isLogin
//                       ? "SIGN IN\nWITH PHONE NUMBER"
//                       : "SIGN UP\nWITH PHONE NUMBER",
//                   style: GoogleFonts.poppins(fontSize: 22, fontWeight: FontWeight.w600),
//                   textAlign: TextAlign.center,
//                 ),
//                 const SizedBox(height: 20),
//                 TextfieldNoHandphone(controller: phoneController),
//                 const SizedBox(height: 20),
//                 ElevatedButton(
//                   onPressed: () async{
//                     await AuthProvider().submitWithPhoneNumber(context,phoneController.text);
//                   },
//                   style: ButtonStyle(
//                     backgroundColor: MaterialStateProperty.all(
//                       const Color(0xffFFC500),
//                     ),
//                     foregroundColor: MaterialStateProperty.all(
//                       const Color(0xff000000),
//                     ),
//                     fixedSize: MaterialStateProperty.all(const Size(266, 50)),
//                     shape: MaterialStateProperty.all<RoundedRectangleBorder>(
//                       RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(10.0),
//                       ),
//                     ),
//                   ),
//                   child: Text(
//                     loadAuth.isLogin ? "MASUK" : "DAFTAR",
//                     style: GoogleFonts.poppins(
//                       color: blackColor,
//                       fontSize: 16,
//                       fontWeight: FontWeight.w500,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );

//   }
// }
=======
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:krl_goon/colors.dart';
// import 'package:krl_goon/widgets/textfield_no_hp.dart';
// import 'package:provider/provider.dart';

// class DaftarWithPhoneNumber extends StatefulWidget {
//   const DaftarWithPhoneNumber({super.key});

//   @override
//   State<DaftarWithPhoneNumber> createState() => _DaftarWithPhoneNumberState();
// }

// class _DaftarWithPhoneNumberState extends State<DaftarWithPhoneNumber> {
//   final TextEditingController phoneController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     var loadAuth = Provider.of<AuthProvider>(context);
//     return Scaffold(
//       body: SafeArea(
//         child: Center(
//           child: Padding(
//           padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 25),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 Text(
//                   loadAuth.isLogin
//                       ? "SIGN IN\nWITH PHONE NUMBER"
//                       : "SIGN UP\nWITH PHONE NUMBER",
//                   style: GoogleFonts.poppins(fontSize: 22, fontWeight: FontWeight.w600),
//                   textAlign: TextAlign.center,
//                 ),
//                 const SizedBox(height: 20),
//                 TextfieldNoHandphone(controller: phoneController),
//                 const SizedBox(height: 20),
//                 ElevatedButton(
//                   onPressed: () async{
//                     await AuthProvider().submitWithPhoneNumber(context,phoneController.text);
//                   },
//                   style: ButtonStyle(
//                     backgroundColor: MaterialStateProperty.all(
//                       const Color(0xffFFC500),
//                     ),
//                     foregroundColor: MaterialStateProperty.all(
//                       const Color(0xff000000),
//                     ),
//                     fixedSize: MaterialStateProperty.all(const Size(266, 50)),
//                     shape: MaterialStateProperty.all<RoundedRectangleBorder>(
//                       RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(10.0),
//                       ),
//                     ),
//                   ),
//                   child: Text(
//                     loadAuth.isLogin ? "MASUK" : "DAFTAR",
//                     style: GoogleFonts.poppins(
//                       color: blackColor,
//                       fontSize: 16,
//                       fontWeight: FontWeight.w500,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );

//   }
// }
// Import statements
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:krl_goon/colors.dart';
import 'package:krl_goon/screens/home_screen.dart';

class DaftarWithPhoneNumber extends StatefulWidget {
  const DaftarWithPhoneNumber({Key? key}) : super(key: key);

  @override
  _DaftarWithPhoneNumberState createState() => _DaftarWithPhoneNumberState();
}

class _DaftarWithPhoneNumberState extends State<DaftarWithPhoneNumber> {
  TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'SIGN IN WITH PHONE',
              style: GoogleFonts.poppins(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 15),
            StreamBuilder<User?>(
              stream: FirebaseAuth.instance.userChanges(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                return Text(
                  'Berhasil Masuk',
                  style: GoogleFonts.lato(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                );
                } else {
                return Text(
                  'Belum Masuk',
                  style: GoogleFonts.lato(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                );

                }
              }
            ),
            const SizedBox(height: 15),
            Container(
              margin: const EdgeInsets.fromLTRB(30, 0, 30, 15),
              padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 15),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
              ),
              child: TextFormField(
                controller: phoneController,
                keyboardType: TextInputType.phone,
                cursorColor: Colors.green,
                decoration: const InputDecoration(
                  prefixText: "62",
                  border: InputBorder.none,
                  hintText: 'Input Phone Number...',
                ),
                validator: (String? value) {
                  return (value != null) ? 'Isi Field' : null;
                },
              ),
            ),
            SizedBox(
              width: 150,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(Colors.green.shade900),
                ),
                onPressed: () async {
                  await Auth()
                      .submitWithPhoneNumber(context, phoneController.text);
                },
                child: Text(
                  "Masuk",
                  style: TextStyle(color: whiteColor),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class Auth {
  var isLogin = true;
  final formKey = GlobalKey<FormState>();

  Future<void> submitWithPhoneNumber(
      BuildContext context, String phoneNumber) async {
    try {
      if (FirebaseAuth.instance.currentUser == null) {
        await FirebaseAuth.instance.verifyPhoneNumber(
          phoneNumber: '+$phoneNumber',
          verificationCompleted: (credential) async {
            await FirebaseAuth.instance.signInWithCredential(credential);
          },
          verificationFailed: (exception) {
            showNotification(context, exception.message.toString());
          },
          codeSent: (verificationId, resendCode) async {
            String? smsCode = await askingSMSCode(context);
            if (smsCode != null) {
              PhoneAuthCredential credential = PhoneAuthProvider.credential(
                verificationId: verificationId,
                smsCode: smsCode,
              );
              try {
                await FirebaseAuth.instance.signInWithCredential(credential);

                // Periksa apakah login berhasil sebelum beralih ke HomeScreen
                if (FirebaseAuth.instance.currentUser == null) {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => HomeScreen()),
                  );
                }
              } on FirebaseAuthException catch (e) {
                print(e.message.toString());
              }
            }
          },
          codeAutoRetrievalTimeout: (verificationId) {},
        );
      } else {
        await FirebaseAuth.instance.signOut();
      }
    } catch (e) {
      if (e is FirebaseAuthException) {
        if (e.code == 'email-already-in-use') {
          print('Email Telah digunakan');
        }
      }
    }
  }

  // Rest of the code remains the same...
  void showNotification(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: Colors.red, content: Text(message.toString())));
  }

  Future<String?> askingSMSCode(BuildContext context) async {
    return await showDialog<String>(
        context: context,
        builder: (_) {
          TextEditingController otpCode = TextEditingController();

          return SimpleDialog(
              title: const Text('Please enter the SMS code sent to you'),
              children: [
                Container(
                  margin: const EdgeInsets.fromLTRB(30, 0, 30, 15),
                  padding:
                      const EdgeInsets.symmetric(vertical: 0, horizontal: 15),
                  color: const Color.fromARGB(255, 240, 240, 240),
                  child: TextFormField(
                    controller: otpCode,
                    keyboardType: TextInputType.number,
                    cursorColor: Colors.green,
                    decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Input Code OTP...'),
                    validator: (value) {
                      if (value!.trim().isEmpty || value == "") {
                        return "Isi Code OTP terlebih dahulu.";
                      } else if (value.trim().length != 6) {
                        return "Input Code OTP 6 digit";
                      }
                      return null;
                    },
                  ),
                ),
                TextButton(
                    onPressed: () {
                      if (otpCode.text.isNotEmpty) {
                        Navigator.pop(context, otpCode.text);
                      } else {
                        print("OTP Belum Di Input");
                      }
                    },
                    child: Text('Confirm',
                        style: TextStyle(color: Colors.green.shade900)))
              ]);
        });
  }
}
>>>>>>> bbb752d13df561badd65c35f6cd658981f6daf00
