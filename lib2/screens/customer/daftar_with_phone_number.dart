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
import 'package:krl_goon/colors.dart';
import 'package:krl_goon/screens/customer/otp_code.dart';

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
              child:
                  // TextField(
                  //   controller: phoneController,
                  //   keyboardType: TextInputType.phone,
                  //   cursorColor: Colors.green,
                  //   decoration: const InputDecoration(
                  //     prefixText: '62',
                  //     border: InputBorder.none,
                  //     hintText: 'Phone Number',
                  //   ),
                  // ),
                  TextFormField(
                controller: phoneController,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: yellowColor),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    prefixText: "62",
                    hintText: "Masukan No.Handphone Anda",
                    //warna bg
                    filled: true,
                    fillColor: const Color(0xff121931).withOpacity(.08)),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Input your phone number... ';
                  }
                  return null;
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
                  await Auth().signInWithPhone(context, phoneController.text);
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

class Auth extends ChangeNotifier {
  var isLogin = true;
  final formKey = GlobalKey<FormState>();
  final _firebaseAuth = FirebaseAuth.instance;

  Future<void> signInWithPhone(BuildContext context, String phoneNumber) async {
    try {
        await FirebaseAuth.instance.verifyPhoneNumber(
          phoneNumber: '+$phoneNumber',
          verificationCompleted: (credential) async {
            await FirebaseAuth.instance.signInWithCredential(credential);
          },
          verificationFailed: (error) {
            throw Exception(error.message);
          },
          codeSent: (verificationId, resendCode) {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: ((context) =>
                        OtpScreen(verificationId: verificationId))));
          },
          codeAutoRetrievalTimeout: (verificationId) {},
        );
      }on FirebaseAuthException catch (e) {
      showNotification(context, e.message.toString());
  }
  }
  // Rest of the code remains the same...
  void showNotification(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: Colors.green.shade900,
        content: Text(message.toString())));
  }
   // DATABASE OPERTAIONS
  Future<bool> checkExistingUser() async {
    DocumentSnapshot snapshot =
        await _firebaseAuth.collection("users").doc(_uid).get();
    if (snapshot.exists) {
      print("USER EXISTS");
      return true;
    } else {
      print("NEW USER");
      return false;
    }
  }
  Future getDataFromFirestore() async {
    await _firebaseFirestore
        .collection("users")
        .doc(_firebaseAuth.currentUser!.uid)
        .get()
        .then((DocumentSnapshot snapshot) {
      _userModel = UserModel(
        name: snapshot['name'],
        email: snapshot['email'],
        createdAt: snapshot['createdAt'],
        bio: snapshot['bio'],
        uid: snapshot['uid'],
        profilePic: snapshot['profilePic'],
        phoneNumber: snapshot['phoneNumber'],
      );
      _uid = userModel.uid;
    });
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
  void verifyOtp({
    required BuildContext context,
    required String verificationId,
    required String userOtp,
    required Function onSuccess,
  }) async {
    _isLoading = true;
    notifyListeners();

    try {
      PhoneAuthCredential creds = PhoneAuthProvider.credential(
          verificationId: verificationId, smsCode: userOtp);

      User? user = (await _firebaseAuth.signInWithCredential(creds)).user;

      if (user != null) {
        // carry our logic
        _uid = user.uid;
        onSuccess();
      }
      _isLoading = false;
      notifyListeners();
    } on FirebaseAuthException catch (e) {
      showSnackBar(context, e.message.toString());
      _isLoading = false;
      notifyListeners();
    }
  }
}
