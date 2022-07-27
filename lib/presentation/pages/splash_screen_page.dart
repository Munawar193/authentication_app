import 'dart:async';

import 'package:authentication_app/auth/providers/auth_cubit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreenPage extends StatefulWidget {
  const SplashScreenPage({Key? key}) : super(key: key);

  @override
  State<SplashScreenPage> createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  @override
  void initState() {
    Timer(
      const Duration(seconds: 4),
      () {
        User? user = FirebaseAuth.instance.currentUser;

        if (user == null) {
          Navigator.pushNamedAndRemoveUntil(
              context, '/sign-up', (route) => false);
        } else {
          context.read<AuthCubit>().getCurrentUser(user.uid);
          Navigator.pushNamedAndRemoveUntil(context, '/main', (route) => false);
        }
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
              'Welcome'.toUpperCase(),
              style: GoogleFonts.montserrat(
                fontSize: 38,
                fontWeight: FontWeight.w900,
                color: Colors.white,
                letterSpacing: 10,
              ),
            ),
          )
        ],
      ),
    );
  }
}
