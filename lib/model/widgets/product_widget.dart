import 'package:aether/controller/transitions.dart';
import 'package:aether/main.dart';
import 'package:aether/model/provider/product_provider.dart';
import 'package:aether/view/product/product_details.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductWidget extends StatelessWidget {
  final ProductDetails product;
  const ProductWidget({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
              context, EnterRoute(page: ProductDetailsPage(product: product)));
        },
        child: Container(
          width: double.infinity,
          decoration: ShapeDecoration(
            shape: RoundedRectangleBorder(
              side: BorderSide(
                width: 1,
                color: primaryColor,
              ),
              borderRadius: BorderRadius.circular(16),
            ),
          ),
          child: Padding(
            padding:
                const EdgeInsets.only(left: 8, right: 10, top: 8, bottom: 8),
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
                            color: primaryColor,
                          ),
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      child: Image.network(product.image),
                    ),
                    const SizedBox(
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
                              color: secondaryColor,
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              letterSpacing: -0.90,
                              height: 1,
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            Text(
                              '\$${product.price}',
                              style: GoogleFonts.lato(
                                color: primaryColor,
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                                letterSpacing: -0.80,
                              ),
                            ),
                            const SizedBox(
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
                            Icon(Icons.star, size: 15, color: primaryColor),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              product.rating.toString(),
                              style: GoogleFonts.lato(
                                color: primaryColor,
                                fontSize: 12,
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
                Icon(Icons.arrow_forward_ios, color: primaryColor),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
