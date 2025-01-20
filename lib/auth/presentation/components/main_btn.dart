import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_eco_mobile/wigdets/custom_circular_loader.dart';

class MainBtn extends StatelessWidget {
  const MainBtn({
    super.key,
    required this.text,
    this.showRightIcon = false,
    this.onPressed,
    this.height = 60,
    this.backgroundColor,
    this.textColor,
    this.isLoading = false,
    this.leftArrowPadding = 30,
  });

  final String text;
  final VoidCallback? onPressed;
  final bool showRightIcon;
  final double height;
  final Color? backgroundColor;
  final Color? textColor;
  final bool isLoading;
  final double leftArrowPadding;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor ?? Theme.of(context).primaryColor,
        minimumSize: Size(double.infinity, height),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      onPressed: isLoading ? null : onPressed,
      child: isLoading
          ? const CustomCircularLoader(
              size: 20,
            )
          : Text(
              text,
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w600,
                fontSize: 16,
                height: 24 / 16,
                color: textColor ?? Colors.white,
              ),
            ),
    );
  }
}
