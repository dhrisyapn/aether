// ignore_for_file: use_build_context_synchronously

import 'package:aether/main.dart';
import 'package:aether/model/transitions.dart';
import 'package:aether/view/auth/login.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.delayed(const Duration(seconds: 2), () {
        Navigator.pushAndRemoveUntil(
            context, FadeRoute(page: const LoginPage()), (route) => false);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
              child: Image.asset('assets/logo.png',
                  width: MediaQuery.of(context).size.width * 0.2)),
          const SizedBox(
            height: 20,
          ),
          Text(
            'AETHER',
            style: GoogleFonts.playfairDisplay(
              color: primaryColor,
              fontSize: 24,
              fontWeight: FontWeight.w400,
              letterSpacing: -1.20,
            ),
          )
        ],
      ),
    );
  }
}
