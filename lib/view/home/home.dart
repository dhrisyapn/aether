import 'package:aether/controller/product_functions.dart';
import 'package:aether/model/provider/product_provider.dart';
import 'package:aether/model/widgets/product_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isLoading = true;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ProductFunctions(context).getProduct().then((value) {
        setState(() {
          isLoading = false;
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Image.asset('assets/word-logo.png', height: 30),
        elevation: 0,
        scrolledUnderElevation: 0,
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Product List',
                  style: GoogleFonts.lato(
                    color: const Color(0xFF5A6F52),
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    letterSpacing: -1,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                isLoading
                    ? Column(
                        spacing: 10,
                        children: [
                          for (int i = 0; i < 3; i++)
                            Shimmer(
                              gradient: LinearGradient(
                                colors: [
                                  Colors.grey[300]!,
                                  Colors.grey[100]!,
                                  Colors.grey[300]!,
                                ],
                              ),
                              child: Container(
                                width: double.infinity,
                                height: 110,
                                decoration: BoxDecoration(
                                  color: Colors.grey[300],
                                  borderRadius: BorderRadius.circular(16),
                                ),
                              ),
                            ),
                        ],
                      )
                    : Consumer<productProvider>(
                        builder: (context, provider, child) {
                          return ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: provider.products.length,
                            itemBuilder: (context, index) {
                              return ProductWidget(
                                  product: provider.products[index]);
                            },
                          );
                        },
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
