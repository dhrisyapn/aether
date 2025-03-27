import 'package:aether/main.dart';
import 'package:aether/model/provider/product_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductDetailsPage extends StatefulWidget {
  final ProductDetails product;
  const ProductDetailsPage({super.key, required this.product});

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  Widget productDetailCard(String title, String subtitle) {
    return Row(
      children: [
        Text(
          title,
          style: GoogleFonts.lato(
            color: primaryColor,
            fontSize: 16,
            fontWeight: FontWeight.w400,
            letterSpacing: -0.80,
          ),
        ),
        Text(
          subtitle,
          style: GoogleFonts.lato(
            color: primaryColor,
            fontSize: 16,
            fontWeight: FontWeight.w300,
            letterSpacing: -0.80,
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        scrolledUnderElevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: false,
        title: SizedBox(
          child: Text(
            'Product details',
            style: GoogleFonts.lato(
              color: primaryColor,
              fontSize: 18,
              fontWeight: FontWeight.w400,
              letterSpacing: -0.90,
            ),
          ),
        ),
        titleSpacing: -10,
        leading: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: IconButton(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            icon: Icon(Icons.arrow_back_ios, size: 20, color: primaryColor),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, bottom: 40),
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.product.title,
                  style: GoogleFonts.lato(
                      color: secondaryColor,
                      fontSize: 28,
                      fontWeight: FontWeight.w700,
                      letterSpacing: -1.10,
                      height: 1),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  width: double.infinity,
                  height: 260,
                  decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        width: 1,
                        color: primaryColor,
                      ),
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  child: Image.network(widget.product.image),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  widget.product.description,
                  style: GoogleFonts.lato(
                    color: primaryColor,
                    fontSize: 18,
                    fontWeight: FontWeight.w300,
                    letterSpacing: -0.90,
                    height: 1.2,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text(
                          '\$${widget.product.price}',
                          style: GoogleFonts.lato(
                            color: primaryColor,
                            fontSize: 26,
                            fontWeight: FontWeight.w900,
                            letterSpacing: -1.30,
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          '(${widget.product.discountPercentage}% off)',
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
                      crossAxisAlignment: CrossAxisAlignment.center,
                      spacing: 3,
                      children: [
                        Icon(
                          Icons.star,
                          color: primaryColor,
                          size: 16,
                        ),
                        Text(
                          widget.product.rating.toString(),
                          style: GoogleFonts.lato(
                            color: primaryColor,
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            letterSpacing: -1.10,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                Text(
                  'only ${widget.product.stock} left!',
                  style: GoogleFonts.lato(
                    color: secondaryColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w300,
                    letterSpacing: -0.80,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'Product details',
                  style: GoogleFonts.lato(
                    color: primaryColor,
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    letterSpacing: -0.90,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                productDetailCard('Brand  : ', widget.product.brand),
                productDetailCard('Id  : ', widget.product.id),
                productDetailCard('Weight  : ', widget.product.weight),
                productDetailCard('Dimensions  : ', widget.product.dimensions),
                productDetailCard('Warranty  : ', widget.product.warranty),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
