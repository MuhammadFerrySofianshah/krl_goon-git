import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:krl_goon/pages/home_page.dart';
import 'package:krl_goon/pages/login_page.dart';
import 'package:krl_goon/pages/splashScreen_page.dart';
import 'package:krl_goon/providers/auth_provider.dart' as my_auth_provider;
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => my_auth_provider.AuthProvider()),
      ],
      child: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              home: snapshot.connectionState == ConnectionState.active
                  ? (snapshot.hasData && snapshot.data!.emailVerified == true ? const HomePage() : const LoginPage())
                  : const SplashScreen(),
            );
          }),
    );
  }
}