import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({super.key});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Alchemist',
                style: GoogleFonts.lato(
                  color: const Color(0xFFD57A3B),
                  fontSize: 28,
                  fontWeight: FontWeight.w700,
                  letterSpacing: -1.40,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: 353,
                height: 262,
                decoration: ShapeDecoration(
                  color: const Color(0x4C5A6F52),
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      width: 1,
                      color: const Color(0xFF5A6F52),
                    ),
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'The Alchemist is a novel by Brazilian author Paulo Coelho which was first published in 1988. Originally written in Portuguese, it became a widely translated international bestseller.',
                style: GoogleFonts.lato(
                  color: const Color(0xFF5A6F52),
                  fontSize: 18,
                  fontWeight: FontWeight.w300,
                  letterSpacing: -0.90,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(
                        '₹399',
                        style: GoogleFonts.lato(
                          color: const Color(0xFF5A6F52),
                          fontSize: 26,
                          fontWeight: FontWeight.w700,
                          letterSpacing: -1.30,
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        '(10% off)',
                        style: GoogleFonts.lato(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w300,
                          letterSpacing: -0.80,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.star, color: const Color(0xFF5A6F52)),
                      Text(
                        '4.3',
                        style: TextStyle(
                          color: const Color(0xFF5A6F52),
                          fontSize: 22,
                          fontFamily: 'Lato',
                          fontWeight: FontWeight.w700,
                          letterSpacing: -1.10,
                        ),
                      ),
                    ],
                  )
                ],
              ),
              Text(
                'only 10 left!',
                style: GoogleFonts.lato(
                  color: const Color(0xFFD57A3B),
                  fontSize: 16,
                  fontWeight: FontWeight.w300,
                  letterSpacing: -0.80,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
