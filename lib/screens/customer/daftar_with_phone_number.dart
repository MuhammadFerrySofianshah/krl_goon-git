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
//                     await AuthProvider().submit(context,phoneController.text);
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
      backgroundColor: Colors.green.shade50,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'SIGN IN WITH PHONE',
              style: GoogleFonts.lato(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            StreamBuilder<User?>(
              stream: FirebaseAuth.instance.userChanges(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Text(
                    "SIGNED IN: ${FirebaseAuth.instance.currentUser!.phoneNumber}",
                  );
                }
                return const Text("You haven't signed in yet");
              },
            ),
            const SizedBox(height: 15),
            Container(
              margin: const EdgeInsets.fromLTRB(30, 0, 30, 15),
              padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 15),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
              ),
              child: TextField(
                controller: phoneController,
                keyboardType: TextInputType.phone,
                cursorColor: Colors.green,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Phone Number',
                ),
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
                  await Auth().submit(context, phoneController.text);
                },
                child: StreamBuilder<User?>(
                  stream: FirebaseAuth.instance.userChanges(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return const Text("Sign Out");
                    }
                    return const Text("Sign In");
                  },
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

  Future<void> submit(BuildContext context, String phoneNumber) async {
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
        backgroundColor: Colors.green.shade900,
        content: Text(message.toString())));
  }

  Future<String?> askingSMSCode(BuildContext context) async {
    return await showDialog<String>(
        context: context,
        builder: (_) {
          TextEditingController controller = TextEditingController();

          return SimpleDialog(
              title: const Text('Please enter the SMS code sent to you'),
              children: [
                Container(
                  margin: const EdgeInsets.fromLTRB(30, 0, 30, 15),
                  padding:
                      const EdgeInsets.symmetric(vertical: 0, horizontal: 15),
                  color: const Color.fromARGB(255, 240, 240, 240),
                  child: TextField(
                    controller: controller,
                    keyboardType: TextInputType.number,
                    cursorColor: Colors.green,
                    decoration: const InputDecoration(
                        border: InputBorder.none, hintText: 'SMS Code'),
                  ),
                ),
                TextButton(
                    onPressed: () {
                      Navigator.pop(context, controller.text);
                    },
                    child: Text('Confirm',
                        style: TextStyle(color: Colors.green.shade900)))
              ]);
        });
  }
}
