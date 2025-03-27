import 'package:aether/model/provider/product_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailsPage extends StatefulWidget {
  final ProductDetails product;
  const DetailsPage({super.key, required this.product});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  Widget ProductDetailCard(String title, String subtitle) {
    return Row(
      children: [
        Text(
          title,
          style: GoogleFonts.lato(
            color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.w400,
            letterSpacing: -0.80,
          ),
        ),
        Text(
          subtitle,
          style: GoogleFonts.lato(
            color: Colors.black,
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
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: SizedBox(
            child: Text(
          'Product details',
          style: GoogleFonts.lato(
            color: const Color(0xFF5A6F52),
            fontSize: 18,
            fontWeight: FontWeight.w400,
            letterSpacing: -0.90,
          ),
        )),
        leading: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: IconButton(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            icon: Icon(Icons.arrow_back_ios, size: 20, color: Colors.black),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          left: 20,
          right: 20,
        ),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.product.title,
                style: GoogleFonts.lato(
                  color: const Color(0xFFD57A3B),
                  fontSize: 28,
                  fontWeight: FontWeight.w700,
                  letterSpacing: -1.10,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                width: 353,
                height: 262,
                decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      width: 1,
                      color: const Color(0xFF5A6F52),
                    ),
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                child: Image.network(widget.product.image),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                widget.product.description,
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
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        '\$${widget.product.price}',
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
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Icon(Icons.star, color: const Color(0xFF5A6F52)),
                      Text(
                        widget.product.rating.toString(),
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
                'only ${widget.product.stock} left!',
                style: GoogleFonts.lato(
                  color: const Color(0xFFD57A3B),
                  fontSize: 16,
                  fontWeight: FontWeight.w300,
                  letterSpacing: -0.80,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Product details',
                style: GoogleFonts.lato(
                  color: const Color(0xFF5A6F52),
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  letterSpacing: -0.90,
                ),
              ),
              SizedBox(
                height: 8,
              ),
              ProductDetailCard('Brand  : ', widget.product.brand),
              ProductDetailCard('Id  : ', widget.product.id),
              ProductDetailCard('Weight  : ', widget.product.weight),
              ProductDetailCard('Dimensions  : ', widget.product.dimensions),
              ProductDetailCard('Warranty  : ', widget.product.warranty),
            ],
          ),
        ),
      ),
    );
  }
}
