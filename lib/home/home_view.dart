import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_eco_mobile/auth/presentation/components/custom_snack_bar.dart';
import 'package:smart_eco_mobile/home/widgets/scan_product_btn.dart';
import 'package:smart_eco_mobile/home/widgets/scan_product_controller.dart';
import 'package:smart_eco_mobile/utils/color.dart';
import 'package:smart_eco_mobile/utils/constant.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ScanProductController(),
      child: Builder(builder: (context) {
        return Scaffold(
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: horizontalScreenPadding,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Gap(20),
                  _DisplayUserGreeting(),
                  const Gap(30),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: _UserStats(),
                  ),
                  const Gap(70),
                  Center(
                    child: ScanProductBtn(
                      onScan: (barcode) {
                        if (barcode == null) {
                          showSnackBar(context,
                              'Erreur lors de la lecture du code-barres');
                          return;
                        }

                        context.read<ScanProductController>().scan(barcode);
                      },
                    ),
                  ),
                  const Gap(30),
                  BlocBuilder<ScanProductController, ScanProductState>(
                    builder: (context, scanProductState) {
                      if (scanProductState is ScanProductLoading) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      } else if (scanProductState is ScanProductSuccess) {
                        final product = scanProductState.product;

                        if (product == null) {
                          return const Text('Produit non trouvé');
                        }
                        return Text(product.productName ?? 'Marque inconnue');
                      }

                      return SizedBox.shrink();
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}

class _DisplayUserGreeting extends StatelessWidget {
  const _DisplayUserGreeting();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'John Doe',
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        Text(
          'johndoe@gmail.com',
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w400,
            fontSize: 14,
          ),
        ),
      ],
    );
  }
}

class _UserStats extends StatelessWidget {
  const _UserStats();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 70,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          width: 2,
          color: greyColor,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(alpha: 0.1),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Center(
        child: Text(
          '150 kg / 200 kg',
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w500,
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}
