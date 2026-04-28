import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:movies/tabs/main_layout.dart';
import 'features/authentication/login/login_screen.dart';

class AuthChecker extends StatelessWidget {
  const AuthChecker({super.key});
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }
        if (snapshot.data != null) {
          return const MainLayout();
        }
        return const LoginScreen();
      },
    );
  }
}