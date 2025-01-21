import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_eco_mobile/home/domain/model/product_part.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
    required this.product,
  });

  final ProductPart product;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          product.productName,
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.bold,
          ),
        ),
        const Gap(20),
        Center(
          child: Image.network(
            product.imageFrontUrl,
            width: 100,
            height: 100,
          ),
        ),
        const Gap(20),
        Text(
          'Emballage: ',
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w500,
          ),
        ),
        Text(
          product.packaging,
          style: GoogleFonts.poppins(fontSize: 12),
        ),
      ],
    );
  }
}
