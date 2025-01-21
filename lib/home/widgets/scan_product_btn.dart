import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simple_barcode_scanner/simple_barcode_scanner.dart';
import 'package:smart_eco_mobile/utils/color.dart';

class ScanProductBtn extends StatelessWidget {
  const ScanProductBtn({
    super.key,
    required this.onScan,
  });

  final Function(String? barcode) onScan;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        String? res = await SimpleBarcodeScanner.scanBarcode(
          context,
          isShowFlashIcon: true,
          delayMillis: 2000,
          cameraFace: CameraFace.back,
          cancelButtonText: 'Annuler',
        );
        onScan(res);
        log(res ?? 'No result');
      },
      child: CircleAvatar(
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
      ),
    );
  }
}
