import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:krl_goon/pages/home_page.dart';
import 'package:krl_goon/pages/tes.dart';

final _fireAuth = FirebaseAuth.instance;

// class formKey {
//   static final formKeyLogin = GlobalKey<FormState>();
//   static final formKeyDaftar = GlobalKey();
// }

class AuthProvider extends ChangeNotifier {

// LogIn Submit
  void loginSubmit(String email, String password, context) async {
    // final isvalidLogin = formKey.formKeyLogin.currentState!.validate();

    // if (!isvalidLogin) {
    //   return;
    // }

    // formKey.formKeyLogin.currentState!.save();
    try {
      final credential = await _fireAuth.signInWithEmailAndPassword(
          email: email, password: password);
          if(_fireAuth.currentUser != null){
                  Navigator.push(context, MaterialPageRoute(builder: (ctx)=>const EmailVerificationScreen()));
                }
          // if (credential.user!.emailVerified) {
            // Navigator.pushReplacementNamed(context, '/home');
          // }
      print("Login Berhasil: ${credential.user?.email}");
    } on FirebaseAuthException catch (e) { 
      print('FirebaseAuthException: $e');
      if (e.code == 'user-not-found') {
        showNotification(context, 'Email Belum Terdaftar');
        print('Tidak ada pengguna yang ditemukan untuk email tersebut.');
      } else if (e.code == 'wrong-password') {
        showNotification(context, 'Password salah');
        print('Password yang salah diberikan untuk pengguna tersebut.');
      } else {
        showNotification(context, 'Email Atau Password Salah');
        print('Error during signup: $e');
      }
    } catch (e) {
      print(e);
      showNotification(context, 'Terjadi kesalahan pada Login');
    }

    // notifyListeners();
  }

// SignUp Submit
  void signupSubmit(String email, String password, context) async {
    // final isValidSignUp = formKey.formKeyDaftar.currentState!.validate();
    // if (!isValidSignUp) {
    //   return;
    // }
    // formKey.formKeyDaftar.currentState!.save();
    try {
      final credential =
          await _fireAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      print("Daftar Berhasil: ${credential.user?.email}");
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        showNotification(context, 'Kata sandi yang diberikan terlalu lemah.');
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        showNotification(context, 'Akun sudah ada untuk email: $email');
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
      showNotification(context, 'Terjadi kesalahan pada pendaftaran');
    }
  }
}

// Notifikasi Dialog
void showNotification(BuildContext context, String message) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Message'),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('OK'),
          ),
        ],
      );
    },
  );
}

// SMS Code OTP
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
