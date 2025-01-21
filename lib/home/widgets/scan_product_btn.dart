import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_eco_mobile/utils/color.dart';

class ScanProductBtn extends StatelessWidget {
  const ScanProductBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: greyColor,
      radius: 70,
      child: CircleAvatar(
        radius: 58,
        backgroundColor: Theme.of(context).colorScheme.primary,
        child: Text(
          'SCANNER',
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w500,
            color: Colors.white,
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}
