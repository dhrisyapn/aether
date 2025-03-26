import 'package:aether/model/provider/product_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductWidget extends StatelessWidget {
  final ProductDetails product;
  const ProductWidget({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: Container(
        width: double.infinity,
        decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
            side: BorderSide(
              width: 1,
              color: const Color(0xFF5A6F52),
            ),
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 8, right: 10, top: 8, bottom: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    width: 90,
                    height: 90,
                    decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          width: 1,
                          color: const Color(0xFF5A6F52),
                        ),
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    child: Image.network(product.image),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.5,
                        child: Text(
                          product.title,
                          style: GoogleFonts.lato(
                            color: const Color(0xFFD57A3B),
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            letterSpacing: -0.90,
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            '\$${product.price}',
                            style: GoogleFonts.lato(
                              color: const Color(0xFF5A6F52),
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              letterSpacing: -0.80,
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            ' ( ${product.discountPercentage}% off )',
                            style: GoogleFonts.lato(
                              color: Colors.black,
                              fontSize: 12,
                              fontWeight: FontWeight.w300,
                              letterSpacing: -0.60,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(Icons.star,
                              size: 15, color: const Color(0xFF5A6F52)),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            product.rating.toString(),
                            style: TextStyle(
                              color: const Color(0xFF5A6F52),
                              fontSize: 12,
                              fontFamily: 'Lato',
                              fontWeight: FontWeight.w700,
                              letterSpacing: -0.60,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              ),
              Icon(Icons.arrow_forward_ios, color: Color(0xFF5A6F52)),
            ],
          ),
        ),
      ),
    );
  }
}
