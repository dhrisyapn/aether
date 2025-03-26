import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: Image.asset('assets/logo.png', height: 130)),
          SizedBox(
            height: 20,
          ),
          Text(
            'AETHER',
            style: GoogleFonts.playfairDisplay(
              color: const Color(0xFF5A6F52),
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
