import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:krl_goon/colors.dart';
import 'package:krl_goon/screens/admin/login_admin.dart';
import 'package:krl_goon/screens/customer/daftar_customer.dart';
import 'package:krl_goon/screens/customer/selection_customer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page KRL GOON"),
        actions: [
          IconButton(
              onPressed: () {
                  FirebaseAuth.instance.signOut();
              },
              icon: const Icon(Icons.logout))
        ],
      ),
      body: const Center(
        child: Text("berhasil login"),
      ),
    );
  }
}
